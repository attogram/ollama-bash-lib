# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# <thinking>
# We need to produce a security review of the given bash script. Must be markdown format. Should evaluate security aspects: input validation, command injection, secret handling, environment variables, error handling, reliance on external binaries, compatibility with Bash 3.2+, etc. Also note any potential issues like unsafe eval, use of read -r -s, use of unquoted expansions, potential race conditions, etc. Provide recommendations. Ensure script works with Bash 3.2; note any constructs that may be incompatible (e.g., associative arrays not used, good). Use of ${var^^} maybe not used. Use of ${var:0:42} substring works in Bash 3.2? Bash's substring expansion works. Use of $(( )) for arithmetic, fine. Use of local array OLLAMA_LIB_MESSAGES appears but arrays are supported in Bash 3.2? Yes, indexed arrays introduced earlier. Use of process substitution <(...) is a Bash feature supported. Use of PIPESTATUS array is Bash 3? PIPESTATUS is available. Use of timeout command maybe not present; but it's external. Overall compatibility okay.

Now provide review sections: Overview, Threat Model, Findings (e.g., command injection via _call_curl json_body not sanitized; but validated with jq), unsafe eval in ollama_eval, handling of API keys, redaction, use of _exists, etc. Provide recommendations: enforce strict quoting, avoid eval, limit permissions, sanitize model names, avoid use of read without -r for password input, better error handling, avoid leaking secrets via debug logs, etc.

Make markdown with headings, bullet points, code snippets.

Proceed.
# </thinking>

# Security Review – **Ollama Bash Lib**  
**Version:** 0.44.1  
**Target Bash:** ≥ 3.2  

---

## 1. Overview  

The script is a Bash library that wraps the **Ollama** API (local or cloud) and provides a rich CLI surface (`og`, `oc`, `oe`, …).  
It relies on external tools (`curl`, `jq`, `awk`, `sed`, `shuf`, `timeout`, `column`, …) and exports several environment variables for configuration (`OLLAMA_LIB_API`, `OLLAMA_LIB_TURBO_KEY`, …).

The review focuses on **security‑relevant aspects**:

| Area | Question |
|------|----------|
| **Input validation / sanitisation** | Are all user‑supplied values (model names, prompts, JSON bodies, paths) validated before being used in commands? |
| **Command injection** | Are any values interpolated into `eval`, `curl -d @-`, or other command lines without proper quoting? |
| **Secret handling** | How are API keys managed and protected from accidental exposure? |
| **Information leakage** | Does debugging or error output reveal sensitive data? |
| **Privilege escalation / unsafe operations** | Are there risky constructs (`eval`, `timeout`, `read -s` etc.) that could be abused? |
| **External dependencies** | Are required binaries checked safely? |
| **Compatibility with Bash 3.2** | Does the code use any features introduced after Bash 3.2? |
| **General hardening** | Recommendations for defense‑in‑depth. |

---

## 2. Threat Model  

| Actor | Capability | Goal |
|-------|------------|------|
| **Malicious user** | Can control arguments passed to library functions (e.g., model name, prompt, generated command). | Execute arbitrary commands, read/write files, exfiltrate data, or disrupt the host. |
| **Compromised API key** | Possesses `OLLAMA_LIB_TURBO_KEY`. | Use the Ollama Cloud API as the legitimate user, possibly incurring costs or abusing quota. |
| **Network attacker** | Can sniff traffic on the local host or intercept the HTTP request (if TLS is not used). | Capture the API key or generated content. |
| **Local attacker** | Has read access to the script file. | Exploit any hard‑coded logic bugs to gain higher privileges. |

The script must **minimise the attack surface** by validating all external input, avoiding unsafe evaluations, and protecting secrets.

---

## 3. Detailed Findings  

### 3.1 Input Validation & Sanitisation  

| Function | Input | Validation |
|----------|-------|------------|
| `_is_valid_model` | Model name | Regex `^[a-zA-Z0-9._://-]+$` – acceptable, but **allows `:`**, which could be used with `curl` to specify a scheme (`http:`) or a username:password (`user:pass@host`). However the model name is only ever concatenated into JSON (`{model: …}`) – not a direct command, so risk is low. |
| `_call_curl` | `method`, `endpoint`, `json_body` | Method is forced to `GET|POST`. `endpoint` must start with `/` and contain no spaces or backslashes – good. `json_body` is passed through `_is_valid_json`. This function **requires `jq`** and returns non‑zero if the JSON is malformed, preventing malformed JSON from reaching `curl`. |
| `ollama_eval` – prompt & generated command | Prompt is user‑supplied, but later passed to `ollama_generate_json` (which validates JSON). The **generated command** (`cmd`) is **executed via `eval`** – see Section 3.4. |
| `ollama_messages_add` | role, content | Both values are wrapped into JSON using `jq`, so no injection into the API call. |
| `ollama_app_turbo` | `mode` argument (`on|off`) | Strict case handling, no injection. |
| `ollama_lib_about` | none | No external input. |

**Conclusion:** Input validation is generally solid, but **model names** could be tightened (e.g., disallow `:`) and **generated commands** need stricter handling.

---

### 3.2 Command Injection  

| Location | How the value is used | Safety |
|----------|----------------------|--------|
| `_call_curl` – builds `curl_args` as an **array** and passes it to `curl "${curl_args[@]}"`. No word‑splitting – safe. |
| `ollama_generate_json` – passes JSON payload to `ollama_api_post`, which forwards it to `_call_curl`. JSON is built with `jq` – safe. |
| `ollama_eval` – final step `eval "$cmd"` | **Unsafe**. The command is produced by the LLM and only lightly vetted (syntax check, dangerous‑token regex). An attacker could construct a prompt that makes the model output a malicious command that bypasses the regex (e.g., using multiline constructs, `${IFS}` tricks, or command substitution). |
| `ollama_app_turbo` – reads API key via `read -r -s` and stores it in an environment variable. No command execution, but the variable is exported (if `-e` flag). Exporting brings the secret to subprocesses – **potential leakage**. |
| `ollama_app_turbo` – sets `OLLAMA_LIB_API` and `OLLAMA_HOST` to user‑controlled values (if the user runs the function with a custom `host_api`). Subsequent `curl` calls use that value directly (no validation). | Allows **man‑in‑the‑middle** or SSRF if an attacker can influence the variable from a compromised shell. |
| `timeout 1 bash -n <<<"$cmd"` – safe (no word‑splitting). |
| `read -r permission` – safe. |

**Key Issue:** **`eval`** in `ollama_eval` creates a **code execution path** that can be abused. The script attempts to mitigate by syntax‑checking and a blacklist of “dangerous” tokens, but **black‑lists are incomplete** and the regex can be bypassed.

---

### 3.3 Secret Handling  

| Secret | Storage | Exposure vectors |
|--------|---------|------------------|
| `OLLAMA_LIB_TURBO_KEY` | In-process variable (optionally exported). | If exported (`-e` flag), all child processes inherit it (including `curl`, `jq`, `ps`, `env`). Debug output (`_debug`) **redacts** this key via `_redact`, which replaces every occurrence of the exact key string with `[REDACTED]`. However: <br>• If the key appears in a **different form** (e.g., base64‑encoded), it will not be redacted.<br>• Exported variables can be read via `/proc/<pid>/environ` by other users on the system. |
| `OLLAMA_LIB_API` (host URL) | Variable, optionally exported. | May contain tokens or scheme; no secret, but could be manipulated for SSRF. |
| `OLLAMA_LIB_DEBUG` | Variable – controls debug output. | If set to a high level, many internal values (including the **full JSON payload**, possibly containing secrets) are printed to **stderr**. This could be captured by log files or redirected inadvertently. |
| **Other environment variables** (e.g., `OLLAMA_AUTH`) | Not touched by the library. | No impact. |

**Recommendations:**  

* Keep `OLLAMA_LIB_TURBO_KEY` **unexported** unless absolutely required. Provide a **separate function** to export it for a single command via `env VAR=... command` rather than a global export.  
* Add **runtime checks** to ensure the key is never logged, even when `DEBUG` is on (e.g., always apply `_redact` to any data that may contain the key).  
* Consider **zeroising** the variable after use (`unset OLLAMA_LIB_TURBO_KEY`).

---

### 3.4 Unsafe `eval` in `ollama_eval`  

The function:

```bash
eval "$cmd"
```

* Relies on an LLM to generate a *single* Bash one‑liner.  
* Performs a **syntax check** (`bash -n`) and a **dangerous‑token regex**.  

**Problems:**

1. **Black‑list bypass** – the regex matches only whole words. An attacker can embed a command using quoting tricks, command substitution, or indirection (`$(rm -rf /)`, `${!var}`) that escapes the list.  
2. **Multiline payloads** – the LLM could return a payload with newline characters; `bash -n` will still succeed for each line, but `eval` will execute the whole block.  
3. **Variable expansion** – the generated command may reference variables defined in the caller’s environment, possibly leaking information.  

**Impact:** Arbitrary command execution with the privileges of the user running the script.

**Mitigation suggestions:**

* **Remove `eval`** entirely. Instead, print the generated command and let the user run it manually, or execute it in a **restricted subshell** (`bash -c "$cmd"` with `set -o errexit -o nounset -o pipefail` and a very limited `PATH`).  
* Use **`command -v`** to whitelist allowed binaries before execution.  
* Prefer **`read -r`** into an array and invoke via `"$cmd"` without `eval`.  
* Add a **sandbox** (e.g., `firejail`, Docker) or run as a **low‑privilege user**.  

---

### 3.5 Information Leakage  

* **Debug output** (`_debug`) prints the full JSON payload, request URLs, and response snippets to **stderr**. When `OLLAMA_LIB_DEBUG` is set to `2` (verbose), the full response can be exposed.  
* Some error messages (`_error`) also output the raw API response (`$result`) when a request fails (e.g., in `ollama_api_get`), potentially leaking **model names** or **error details** to the console or log files.  
* The **`_ollama_thinking_stream`** function prints thinking text to **stderr** with no redaction. If the model’s thinking includes private data (e.g., a snippet of a secret that the model “remembers”), it could be exposed.  

**Recommendation:**  

* Make debug output **redaction‑aware** for any string that could contain the API key or other secrets (apply `_redact` to the entire JSON string before printing).  
* Provide a **`--quiet`** mode that suppresses both debug and thinking output unless explicitly requested.  

---

### 3.6 External Dependencies  

| Binary | Presence check | Security concerns |
|--------|----------------|-------------------|
| `curl` | `_exists` | Uses `-s -N` – silent, no progress; no `--fail` (commented out). Without `--fail`, HTTP 4xx/5xx responses are treated as success, potentially returning an error JSON that the caller misinterprets. |
| `jq` | `_exists` | Required for all JSON handling. No verification of version – older `jq` may have bugs. |
| `shuf` | Optional (fallback to `awk`) | No security impact. |
| `timeout` | Used in `ollma_eval`; not checked for existence – if missing, the command will fail but the script proceeds, possibly leaving an unchecked command. |
| `column`, `sed`, `awk`, `read`, `printf` | Built‑ins or common POSIX tools – assumed present. |
| `ollama` CLI | Many functions (`ollama list`, `ollama ps`, `ollama show`) call it directly; the script checks only via `_exists` where needed. If a malicious alias named `ollama` is present earlier in `$PATH`, it could be executed. |

**Mitigations:**  

* Use **`command -v`** with a full path check (e.g., `$(command -v curl)`) and optionally verify the binary’s checksum or location (`/usr/bin/curl`).  
* Prefer **`curl --fail`** (or manually test HTTP status) to avoid silent processing of error payloads.  
* Verify `jq` version `>=1.5` (or whichever minimum is required for the flags used).  

---

### 3.7 Bash‑3.2 Compatibility  

The script avoids newer Bash features:

| Feature | Bash‑3.2 support |
|---------|-----------------|
| Indexed arrays (`ARR=()`, `ARR+=()`) – ✔ |
| `local` in functions – ✔ |
| `[[ ... ]]` with regex – ✔ |
| `${var:offset:length}` – ✔ |
| Process substitution `<(...)` – ✔ |
| `PIPESTATUS` array – ✔ |
| `${var//search/replace}` – ✔ |
| `(( ))` arithmetic – ✔ |
| `read -r -s` – ✔ |
| `command -v` – ✔ |
| `printf '%s'` – ✔ |
| `declare -a` not used – not needed. |

**Conclusion:** No syntax that requires Bash ≥ 4 (e.g., associative arrays, `${var^^}`) is present. The script should run on Bash 3.2+.

---

## 4. Recommendations  

### 4.1 Harden Command Execution  

* **Eliminate `eval`.** Replace with one of:
  ```bash
  # Show the command and ask the user to run it explicitly
  printf 'Generated command:\n%s\n' "$cmd"
  read -p "Run it now? [y/N] " answer
  [[ $answer =~ ^[Yy]$ ]] && bash -c "$cmd"
  ```
* If automatic execution is required, run inside a **restricted environment**:
  ```bash
  PATH=/usr/bin:/bin
  export PATH
  bash -c "$cmd"
  ```

* Add a **whitelist** of allowed binaries before execution:
  ```bash
  allowed=(
    cat cp date echo grep ls mkdir mv printf rm sed sleep
  )
  IFS='|'; allowed_regex="^($(IFS='|'; echo "${allowed[*]}"))\b"
  if [[ ! $cmd =~ $allowed_regex ]]; then
      _error "Command contains non‑whitelisted binary"
      return 1
  fi
  ```

### 4.2 Protect Secrets  

* Do **not export** `OLLAMA_LIB_TURBO_KEY` by default. Offer a helper wrapper:
  ```bash
  ollama_turbo_run() { env OLLAMA_LIB_TURBO_KEY="$1" "$2"; }
  ```
* Zero‑out the variable after a request:
  ```bash
  local key=$OLLAMA_LIB_TURBO_KEY
  unset OLLAMA_LIB_TURBO_KEY
  # use $key for the request, then discard it
  ```

* Ensure `_redact` is applied to **all** debug/err messages that may contain the key, not only the explicit `"${1}"` argument.

### 4.3 Strengthen Validation  

* Tighten model name regex:
  ```bash
  [[ "$model" =~ ^[a-zA-Z0-9._-]+$ ]]   # no ':' or '/' characters
  ```
* Validate `OLLAMA_LIB_API`/`OLLAMA_HOST` to be a **well‑formed URL** (scheme + host + optional port). Reject values containing spaces, semicolons, or shell metacharacters.

### 4.4 Improve Error Handling  

* Use **`curl --fail --show-error`** to differentiate HTTP errors:
  ```bash
  curl_args+=(--fail --show-error)
  ```
* For functions that call external commands (`ollama list`, `timeout`), verify their existence first:
  ```bash
  _exists timeout || { _error "timeout command missing"; return 1; }
  ```

### 4.5 Reduce Information Leakage  

* Provide a **`--quiet`** flag (environment variable `OLLAMA_LIB_QUIET=1`) that disables all diagnostic output unless `DEBUG` is explicitly set.  
* In `ollama_api_get/post`, avoid printing raw API responses on failures; instead, log a sanitized message.

### 4.6 Logging & Auditing  

* Write a **structured log** (e.g., JSON) to a dedicated file with restrictive permissions (`0600`) for audit trails.  
* Include timestamps, command invoked, and exit status, but **never** log raw API keys.

### 4.7 Documentation & Safe Defaults  

* Document that **`ollama_eval` is dangerous** and must be used with caution.  
* Set **`OLLAMA_LIB_DEBUG=0`** as the default; advise users to enable only for troubleshooting.  
* Recommend running the library under a **dedicated, non‑privileged user** when possible.

---

## 5. Summary  

| Severity | Issue | Mitigation |
|----------|-------|------------|
| **Critical** | `eval` of untrusted LLM output (`ollama_eval`). | Remove `eval`; run in a sandbox or require explicit user confirmation. |
| **High** | API key export & possible leakage via debug logs. | Keep key unexported, always redact in logs, zero‑out after use. |
| **Medium** | Lack of strict validation for `OLLAMA_LIB_API` and model names. | Enforce tighter regex, validate URL scheme. |
| **Medium** | Debug/err messages may expose full JSON payloads (including secrets). | Apply redaction globally, add quiet mode. |
| **Low** | Missing `--fail` for `curl` → silent HTTP errors. | Add `--fail` and check HTTP status. |
| **Low** | No existence check for `timeout`; potential fallback to insecure execution. | Verify presence before use. |

Overall, the script is **well‑structured** and **compatible with Bash 3.2**, but the **`eval` path** and **secret handling** are the primary security concerns. Implementing the recommendations above will greatly reduce the attack surface while preserving functionality.
