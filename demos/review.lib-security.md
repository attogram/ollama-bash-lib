# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – *Ollama Bash Library*  
**Version:** `0.43.9`  
**Target Bash:** **3.2 +**  

---

## 1. Overview  

The script provides a fairly large Bash‑only client for the Ollama LLM server.  
It wraps `curl`/`jq` calls, implements a tiny message buffer, supports streaming, and even offers an “eval‑generator” that asks the model to produce a Bash one‑liner and then runs it after a sanity check.

Overall the code follows a consistent style, validates a few inputs, and attempts to hide the Turbo API key.  
Nevertheless, several security‑relevant weaknesses remain – especially around **untrusted data handling, command injection, credential exposure, and privilege escalation**.  

The review below is organized by threat‑vector, with an eye on Bash‑3.2 compatibility.

---

## 2. Threat Model  

| **Actor** | **Goal** | **Assumptions** |
|-----------|----------|-----------------|
| **Malicious user** (local or remote) | Obtain the Turbo API key, execute arbitrary commands, or cause a denial‑of‑service. | Has access to the shell where the library is sourced or executed. |
| **Compromised remote Ollama server** | Return malformed JSON or embed shell‑meta‑characters in streamed responses. | The client trusts the server’s JSON output. |
| **Attacker controlling environment variables** | Influence API endpoint or command‑line arguments. | Can set `OLLAMA_HOST`, `OLLAMA_LIB_TURBO_KEY`, etc. before the library is loaded. |

The library runs **as the invoking user**, so any successful exploit yields the same privileges.

---

## 3. Findings  

### 3.1 Input Validation & Injection  

| Function | Issue | Impact | Bash‑3.2 note |
|----------|-------|--------|---------------|
| `_call_curl` – endpoint validation | Only checks that the path starts with `/` and contains no spaces or backslashes. It does **not** reject `..` or other URL‑encoding tricks. A crafted value like `/api/../etc/passwd` could be sent to a malicious proxy or cause the server to treat it as a different resource. | Potential SSRF / information leak. | The test uses `[[ "$endpoint" != /* || "$endpoint" == *" "* || "$endpoint" == *"\\"* ]]` – works in Bash 3.2. |
| `ollama_api_get` / `ollama_api_post` | The endpoint argument is passed straight to `_call_curl`. If a caller supplies a malicious endpoint (e.g., `/api/../..%2Fetc/passwd`), the library will forward it. | Same as above. | No issues. |
| `ollama_eval` – **eval** of model‑generated code | The function tries to “sanity‑check” the generated command (syntax‑check, dangerous‑token detection) but still **executes** the string with `eval`. The checks can be bypassed (e.g., using `$(command)` inside a harmless‑looking string, or quoting tricks). | Remote code execution (RCE). | `eval` is available in all Bash versions. |
| `_is_valid_model` – regex `^[a-zA-Z0-9._:-]+$` | Allows colon (`:`) and dash (`-`) which are valid in model names but also could be used to inject a *shell* meta‑character when the name is later used in a command line *without quoting*. For instance, `model=$(printf 'foo; rm -rf /')` would still pass the regex if the attacker can control the variable. However the code always quotes `${model}` when passed to `jq`. | Low – mostly safe, but could be tightened. | Regex syntax is fine. |
| `ollama_messages_add` – no validation of role or content | Both values are directly encoded into JSON via `jq`. If `jq` is missing, the function aborts, but when present the content is JSON‑escaped, reducing injection risk. | Minor. | Works. |

### 3.2 Credential Handling  

| Observation | Issue | Recommendation |
|-------------|-------|----------------|
| Turbo API key stored in **global variable** `OLLAMA_LIB_TURBO_KEY`. | The key is never exported (good), but the script sometimes does `export OLLAMA_LIB_API="$host_api"` and `export OLLAMA_HOST="$host_api"`. If a later command sources the script in a subshell, the key may be visible in the environment of child processes (e.g., the `curl` command includes the key in an HTTP header, but the header itself is not a secret leak). | Keep the key in a **private variable** and **unset** it as soon as possible after a request. Consider using a *read‑only* variable (`readonly OLLAMA_LIB_TURBO_KEY`) after assignment. |
| `_redact` only replaces occurrences of the exact key string. | If the key appears in a transformed form (e.g., base64 encoded) it will not be redacted in logs. | Expand redaction to common transformations (base64, URL‑encoded) or simply suppress debug output when a key is present (`OLLAMA_LIB_DEBUG=0`). |
| Prompt for key via `read -s` without a timeout. | The key lives in the shell’s memory for the entire session and can be read with `ps e` on some systems that expose the environment of a running process. | After setting the variable, **`unset -v OLLAMA_LIB_TURBO_KEY`** when the script is terminated, or store it only in a temporary file with restrictive permissions and read it each request. |

### 3.3 Use of External Commands  

| Command | Risk | Mitigation |
|---------|------|------------|
| `curl` – invoked with `-f` (fail on HTTP errors) but **no** explicit `--max-time`. | A malicious server could hang indefinitely (DoS). | Add a sensible `--max-time 30` (or make it configurable). |
| `jq` – required for JSON handling. If missing, many functions abort, but the script still prints a generic error. | Users may be forced to install `jq`; not a security issue. | Fine. |
| `timeout` – used in syntax‑check (`timeout 1 bash -n`). If unavailable, the script fails silently. | Could cause the script to hang on large payloads. | Detect availability; fallback to `bash -n` without timeout or use a configurable timeout. |
| `shuf` / `awk` fallback in `ollama_model_random`. | No direct risk. | Fine. |
| `read -r -n 1` in `_ollama_thinking_stream`. | Reads a single byte before streaming; may interfere with binary streams. | Not a security issue, but could truncate data. |

### 3.4 Output Encoding & Information Leakage  

| Area | Observation | Issue |
|------|-------------|-------|
| Debug messages (`_debug`) are sent to **stderr** and include the full request payload (potentially large). | If `OLLAMA_LIB_DEBUG` is mistakenly left on in production, it may leak sensitive prompts or responses. | Ensure debug is disabled by default (`OLLAMA_LIB_DEBUG=0`). |
| `ollama_lib_about` lists **all functions** via `compgen`. | Reveals internal implementation details to anyone who can run the script. | Not critical, but consider restricting to `--quiet` mode. |
| `ollama_thinking` prints the current `thinking` mode without sanitising. | No secret data is printed, but may be used for fingerprinting. | Acceptable. |

### 3.5 Race Conditions & File‑System Interaction  

The library **does not** write to any files except when the user explicitly invokes `ollama` CLI commands (e.g., `ollama list`). Therefore there are no exploitable TOCTOU bugs in the library itself.  

**Potential future issue:** If a user adds functions that write to `$HOME/.ollama` or similar, they must ensure proper permissions.

### 3.6 Compatibility with Bash 3.2  

| Feature | Bash 3.2 Support | Comments |
|---------|------------------|----------|
| `local var` and `local -a` arrays | ✔ | Supported. |
| `[[ ... ]]` extended test syntax | ✔ | Works. |
| `${var:-default}` parameter expansion | ✔ | Works. |
| `$(command)` command substitution | ✔ | Works. |
| `(( expr ))` arithmetic evaluation | ✔ | Works. |
| **Process substitution** `< <(...)` | ✔ (supported since Bash 2) | Used in several functions. |
| **`declare -g`** or **nameref** (`declare -n`) | **Not used** – good, because they require Bash 4+. |
| **`pipefail`** option | ✔ (available in Bash 3.0+) | Already set. |
| **`${BASH_REMATCH}`** after regex match | ✔ | Works. |
| **`printf -v`** (not used) | – | N/A. |

Overall the script is **compatible** with Bash 3.2.

---

## 4. Recommendations  

### 4.1 Harden Command Execution  

1. **Remove or heavily sandbox `eval`** in `ollama_eval`.  
   * Prefer writing the generated code to a temporary file and executing it with `bash -c` under a non‑privileged user (e.g., using `sudo -u nobody`).  
   * Or reject any command that contains a semicolon, pipe, `$(`, backticks, or other shell metacharacters – not just the “dangerous token” list.

2. **Sanitize endpoint strings** more rigorously:  
   ```bash
   # reject path traversal and URL‑encoded traversal
   if [[ "$endpoint" =~ \.\. | %2e%2e ]]; then
       _error "Invalid endpoint (path traversal)"
       return 1
   fi
   ```

3. **Add a timeout and size limits** to `curl`:  
   ```bash
   curl_args+=(
       --max-time 30
       --max-filesize 10M
   )
   ```

### 4.2 Protect the Turbo API Key  

* After a request, **clear the variable**: `unset OLLAMA_LIB_TURBO_KEY` or `readonly` it and only set once per session.  
* Do **not export** any variable that may contain the key.  
* Disable debug output automatically when the key is set:  
  ```bash
  if [[ -n "$OLLAMA_LIB_TURBO_KEY" ]]; then
      OLLAMA_LIB_DEBUG=0
  fi
  ```

### 4.3 Improve Logging & Redaction  

* Expand `_redact` to handle common encodings: base64, URL‑encoding, hex.  
* Prefix debug output with a **timestamp** and the PID to aid forensic analysis.  

### 4.4 Strengthen Model‑Name Validation  

* Disallow `:` and `/` characters, which can be used in filesystem paths.  
* Use a whitelist of known models (cached from `ollama list`) where possible.

### 4.5 Defensive Programming  

* Explicitly check for required commands at **library load time** (`_exists curl jq`). Fail early if missing.  
* Ensure that any function that returns JSON enforces **UTF‑8** output (set `LC_ALL=C.UTF-8` or similar).  

### 4.6 Documentation & Secure Defaults  

* State in the README that **debug must be disabled** in production.  
* Recommend running the library inside a **container** or a **restricted user** when using Turbo mode.  

---

## 5. Conclusion  

The *Ollama Bash Library* provides a useful abstraction over the Ollama HTTP API, and it largely respects Bash 3.2 constraints.  
However, the current implementation contains **high‑severity risks**:

* **Unrestricted `eval`** of model‑generated code.  
* **Insufficient endpoint sanitisation** that could enable SSRF‑style attacks.  
* **Potential exposure of the Turbo API key** via environment variables and debug output.

Mitigating these issues—particularly by removing `eval`, tightening input validation, and securing credential handling—will make the library safe for use in multi‑user or production environments.  

Implement the recommendations above and re‑run the security audit before deployment.
