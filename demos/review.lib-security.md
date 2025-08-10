# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.2


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
**Version:** 0.43.2  
**Target Bash:** ≥ 3.2  

---

## 1. Overview  

The script provides a Bash‑only client library for the Ollama inference API.  
It bundles a fairly large set of convenience functions (API wrappers, model handling, chat, streaming, etc.) and relies on external tools:

| Tool   | Used for |
|--------|----------|
| `curl` | HTTP requests |
| `jq`   | JSON construction / parsing |
| `ollama` (CLI) | Local model enumeration & management |
| `column`, `compgen` | Optional pretty‑printing |

The library is meant to be sourced by other Bash programs or used interactively.

---

## 2. Threat Model  

| Asset | Potential Adversary | Impact |
|-------|--------------------|--------|
| **API key** (`OLLAMA_LIB_TURBO_KEY`) | Any process that can read the script’s debug output or environment | Unauthorized use of the paid Ollama Cloud API |
| **Generated commands** (`ollama_eval`) | User of the library (or a compromised script) | Arbitrary command execution on the host |
| **User‑supplied data** (model name, prompts, messages) | Malicious user or attacker controlling input | Injection into HTTP request body, JSON, or Bash eval |
| **Environment variables** (`OLLAMA_HOST`, `OLLAMA_LIB_API`) | Other processes spawned from the same shell | Unintended redirection of traffic, Man‑in‑the‑Middle |
| **Debug output** | Anyone with console access | Disclosure of internal data (API key, URLs, payloads) |

The review focuses on **information disclosure**, **command injection**, **unsafe handling of user‑controlled data**, and **compatibility with Bash 3.2**.

---

## 3. Findings  

### 3.1. Information Disclosure  

| Issue | Description | Severity |
|-------|------------|----------|
| **Redaction only touches one secret** (`OLLAMA_LIB_TURBO_KEY`). | `_redact` replaces the turbo API key but any other sensitive values (e.g., custom headers, tokens stored in other env vars) are printed as‑is in debug logs. | Medium |
| **Debug logging of full payloads** (`_debug "_call_curl: json_body: [${json_body:0:120}]"`). | Even with truncation, the first 120 characters can contain secrets, API paths, or user‑provided data. When `OLLAMA_LIB_DEBUG=1` a malicious user could trigger verbose logging to extract data. | Medium |
| **Exporting `OLLAMA_HOST` and `OLLAMA_LIB_API`** in `ollama_app_turbo`. | The function modifies the environment of the calling shell, potentially affecting unrelated scripts that reuse the same shell. | Low |

### 3.2. Command Injection  

| Issue | Description | Severity |
|-------|------------|----------|
| **Unchecked `eval` in `ollama_eval`**. | The function automatically runs the generated command via `eval "$cmd"` after a simple “Y/N” prompt. If the LLM is compromised or the prompt is malicious, any string that expands to a valid Bash command (including pipelines, redirections, variable assignments) will be executed with the caller’s privileges. | **Critical** |
| **`$cmd` used in regex check before prompting** – the regex is built from a static *dangerous* list, but tokens can be obfuscated (e.g., `"r\\\$((rm -rf /))"`). The check only warns; it does not prevent execution. | High |
| **Potential injection via JSON body**. Functions like `ollama_generate_json` embed user‑supplied `$1` and `$2` directly into a JSON document built with `jq`. `jq --arg` is safe, but if `jq` is missing the script falls back to plain string concatenation in some places (e.g., `ollama_chat_json` builds `messages_array_json` via `printf`). If a message contains `"\"` or newline characters the resulting JSON may become malformed, leading to an unexpected API request that could be abused. | Medium |

### 3.3. Unsafe JSON Construction  

| Issue | Description | Severity |
|-------|------------|----------|
| **`messages_array_json` assembled with `printf ",%s"`**. | The code assumes each element of `OLLAMA_LIB_MESSAGES` is already a valid JSON object. No quoting/escaping is performed, so a malformed element (e.g., containing a comma) corrupts the final JSON array sent to the API. | Medium |
| **`--argjson stream "$stream_bool"`** – `stream_bool` is set to the literal strings `true`/`false`. This works but is tied to `jq` version; older `jq` may reject non‑boolean literals. | Low |
| **Missing check for `jq` presence** before functions that rely on it (e.g., `ollama_chat_json`, `ollama_generate_json`). If `jq` is absent, the script will exit with a cryptic error from `jq` command not found, potentially leaking stack traces. | Low |

### 3.4. Environment & Variable Handling  

| Issue | Description | Severity |
|-------|------------|----------|
| **Global mutable state** (`OLLAMA_LIB_STREAM`, `OLLAMA_LIB_MESSAGES`). | Functions mutate these globals without a clear “reset” contract. If a caller forgets to reset the flag, a later unrelated request may unintentionally stream data, causing the script to hang or leak partial output. | Low |
| **`set -o pipefail`** is used, but the script frequently ignores the exit status of pipelines (e.g., `echo "$list" | tail -n+2 | sort`). In Bash 3.2 `pipefail` is available, but failing commands could be silently ignored. | Low |
| **Use of `$(bash --version | head -n1)`** inside `ollama_eval` to fallback when `$BASH_VERSION` is empty. This spawns a subshell, which may be disallowed on hardened environments. | Low |

### 3.5. Compatibility with Bash 3.2  

| Observation | Impact |
|-------------|--------|
| **Arrays** – fully supported in Bash 3.2. | ✅ |
| **`${var//pattern/repl}`** – pattern replacement is supported. | ✅ |
| **`[[ … =~ … ]]` regex operator** – present, but capture groups (`BASH_REMATCH`) work. | ✅ |
| **`local` inside functions** – supported. | ✅ |
| **`printf '%s' "${array[@]}"`** – works. | ✅ |
| **`declare -A` (associative arrays)** – *not used*, so no issue. | ✅ |
| **`printf -v`** – not used. | ✅ |
| **Parentheses in `[[ … || ( … && … ) ]]`** – Bash 3.2 treats them as grouping, which is valid. | ✅ |

Overall the script is **compatible with Bash 3.2**.

---

## 4. Recommendations  

### 4.1. Harden Secrets & Debug Logging  

1. **Centralise redaction** – keep a list of variables that should be censored (`OLLAMA_LIB_TURBO_KEY`, any `*_TOKEN`, `*_SECRET`) and replace them in `_redact`.  
2. **Make debug logging opt‑in per‑module**, not a global `OLLAMA_LIB_DEBUG` that may be turned on inadvertently.  
3. **Never export the API key**; keep it strictly in the script’s environment. If it must be exported for child processes, consider using a temporary file descriptor with restrictive permissions.

### 4.2. Eliminate or Guard `eval`  

* **Avoid `eval` altogether.** Instead, write the generated command to a temporary script file (`mktemp`) and run it with `bash "$tmpfile"` after user confirmation.  
* If `eval` must stay, **strictly whitelist allowed characters** (e.g., `^[a-zA-Z0-9_./\-\$ ]+$`) before execution, and reject anything else.  

### 4.3. Improve JSON Safety  

* Use `jq` **exclusively** to build JSON objects, even for the messages array:  
  ```bash
  messages_json=$(printf '%s\n' "${OLLAMA_LIB_MESSAGES[@]}" | jq -s '.')
  ```
* Validate that `jq` exists at **script load time**; abort early with a clear message.  
* When constructing `messages_array_json`, escape the content or pass the array directly to `jq` as shown above.

### 4.4. Safer API Calls  

* When sending a JSON body, always use `curl --data @-` **with `printf '%s' "$json_body"`** **quoted** (already done). Ensure that `json_body` is never derived from untrusted command substitution without quoting.  
* Add a sanity check on the HTTP status returned by `curl` (`-w '%{http_code}'`) and reject non‑200 responses before piping output to downstream parsers.

### 4.5. Harden Input Validation  

* **Model names** – the current regex `^[a-zA-Z0-9._:-]+$` is acceptable, but also reject names containing whitespace.  
* **Prompt strings** – they are passed to the API unchanged. Consider limiting length (e.g., `[[ ${#prompt} -le 8192 ]]`) to avoid denial‑of‑service via huge payloads.

### 4.6. Reduce Global Side‑Effects  

* Make functions **pure** where possible: accept a `stream` flag argument rather than toggling the global `OLLAMA_LIB_STREAM`.  
* Provide a `ollama_reset` helper that clears `OLLAMA_LIB_MESSAGES` and resets `OLLAMA_LIB_STREAM` to the default.

### 4.7. Defensive Error Handling  

* After any pipeline, check `${PIPESTATUS[0]}` if `pipefail` is not enough.  
* Return distinct error codes for common failure modes (e.g., 101 = missing `curl`, 102 = missing `jq`, 103 = API key not set).

### 4.8. Documentation & Safe Defaults  

* Document that **`ollama_app_turbo`** overwrites `OLLAMA_HOST` globally and advise users to call it in a subshell if they need temporary Turbo mode.  
* Provide an example of safe use of `ollama_eval` with the new “write‑to‑tempfile” approach.

---

## 5. Conclusion  

The **Ollama Bash Lib** is functional and compatible with Bash 3.2, but it contains several **high‑impact security weaknesses**:

* **Critical command‑injection risk** via `eval` in `ollama_eval`.  
* **Partial secret redaction**, leading to possible API‑key leakage when debugging is enabled.  
* **JSON construction that can be malformed** if a caller inserts unexpected characters.

Addressing the recommendations above—especially removing `eval`, centralising secret handling, and enforcing strict JSON generation with `jq`—will substantially raise the security posture of the library while preserving its ease of use.  

---  

*Prepared by: [Your Name], Security Analyst*  
*Date: 2025‑08‑10*  
