# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.29


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  

*Version examined: `0.42.29` (2025)*  

---  

## 1. Executive Summary  

| Aspect | Rating | Comments |
|--------|--------|----------|
| **Confidentiality** | ⚠️ Medium | API‑key (`OLLAMA_LIB_TURBO_KEY`) is kept in a shell variable only; however it may be inadvertently exported or leaked via debugging output. |
| **Integrity** | ✅ Good | JSON payloads are built with `jq`, which safely escapes user‑supplied values. |
| **Availability** | ⚠️ Medium | Several functions read unlimited amounts of data into Bash variables (e.g., `_call_curl`, `ollama_generate_json`). An attacker controlling the remote Ollama server could cause extreme memory consumption. |
| **Overall** | ⚠️ **Needs hardening** | The library is functional but several security‑related defaults are weak (safe‑mode off, no strict Bash options, uncontrolled environment variables, long‑running processes). |

Below is a detailed analysis of the code, identified risks, and concrete mitigation recommendations.

---  

## 2. Detailed Findings  

### 2.1. Secure Bash Practices  

| Finding | Impact | Explanation |
|---------|--------|-------------|
| **Missing `set -euo pipefail`** | Medium | Without `set -e` the script continues after a failing command, possibly leading to undefined state. `set -u` would catch accidental use of undefined variables, and `pipefail` would propagate errors from pipelines. |
| **No `IFS` sanitisation** | Low | Functions that iterate over strings (e.g., `ollama_list_array`) rely on the default `IFS`. An attacker could inject newlines or spaces into environment variables that later become part of a word‑splitting context. |
| **No `umask` enforcement** | Low | Temporary files are not used, but future extensions that write to disk could inherit an insecure default file mode. |

### 2.2. Input Validation & Injection Risks  

| Function | Issue | Likelihood | Mitigation |
|----------|-------|------------|------------|
| `_escape_control_characters` | Safe‑mode is **disabled by default** (`OLLAMA_LIB_SAFE_MODE=0`). When disabled the function simply `echo "$1"` and returns the unmodified string, meaning control characters (e.g., `\b`, `\n`, `\r`, `\u0000`) can pass straight into JSON payloads. In combination with downstream `jq -r ".response"` this could break JSON parsing or lead to **JSON injection**. | High (if a malicious user can influence prompts, system messages, or model output). | Enable safe‑mode by default (`OLLAMA_LIB_SAFE_MODE=1`). If a user explicitly disables it, issue a warning and require the caller to acknowledge the risk. |
| `ollama_generate_json`, `ollama_chat_json`, `ollama_model_unload` | JSON payloads are built with `jq -c -n`, which safely quotes inputs. No injection risk here. | – | Keep this pattern; avoid manual string concatenation. |
| `_call_curl` – `curl_args+=( "${OLLAMA_LIB_API}${endpoint}" )` | `endpoint` is supplied by the caller. If an attacker could inject something like `"; rm -rf /; echo "` it would be treated as part of the URL, *not* executed, because it is stored in an array element. However, if the endpoint contains a newline, `curl` would interpret it as a header separator and may cause HTTP request smuggling. | Low (requires control of `$endpoint`). | Validate that `endpoint` starts with a `/` and contains no newlines or control characters (`[[ $endpoint =~ ^/[^[:cntrl:]]*$ ]]`). |
| `ollama_app_turbo` – reads API key with `read -s` and stores it in `OLLAMA_LIB_TURBO_KEY`. The key is later echoed in debug output (`_debug "OLLAMA_LIB_TURBO_KEY: (${#OLLAMA_LIB_TURBO_KEY} characters)"`). | Medium – the length is safe, but the key value could be printed if the debugging flag is turned on (`OLLAMA_LIB_DEBUG=1`). | Never log the value itself, only its length. Add a conditional: `[[ $OLLAMA_LIB_DEBUG -eq 1 ]] && _debug "OLLAMA_LIB_TURBO_KEY set (${#OLLAMA_LIB_TURBO_KEY} chars)"`. |
| `ollama_model_random` – uses `$RANDOM%${#models[@]}` inside arithmetic expansion. If `${#models[@]}` is 0 the modulus is zero, causing a division‑by‑zero error. | Low (only when no models are installed). | Guard with `[[ ${#models[@]} -gt 0 ]]` before performing the modulus. |

### 2.3. Secret / Credential Handling  

| Observation | Issue | Recommendation |
|-------------|-------|----------------|
| API key stored in a **plain shell variable** (`OLLAMA_LIB_TURBO_KEY`). It is not exported, but a subshell invoked by the library (e.g., `curl`) may inherit it via the environment if the user later runs `export -p`. | Medium – accidental export could leak the secret to child processes. | Store the key in a **read‑only** variable (`readonly OLLAMA_LIB_TURBO_KEY`) after it is set, and explicitly unset it (`unset OLLAMA_LIB_TURBO_KEY`) when the script exits or on `trap EXIT`. |
| Debug mode can print the **full key** if a developer inadvertently adds a line such as `_debug "$OLLAMA_LIB_TURBO_KEY"`. | High (potential leakage). | Enforce a coding rule: *Never* reference `$OLLAMA_LIB_TURBO_KEY` in debugging or logging. Add a wrapper `_debug_secret` that prints only masked value (`*****`). |
| The key is never persisted to disk, which is good, but the script does **not** enforce a timeout or rotation. | Low (outside the scope of the library). | Document best‑practice for the end‑user: rotate the key regularly, keep it in a secure password manager, and avoid keeping the library running for long periods. |

### 2.4. Resource Exhaustion / DoS  

| Function | Potential Abuse | Impact |
|----------|----------------|--------|
| `_call_curl` → `curl "${curl_args[@]}"` | The remote Ollama server could return an arbitrarily large JSON payload (e.g., with huge `response` fields). The script captures the output in a Bash variable (e.g., `result="$(ollama_api_get …)"`). Bash variables are stored in memory; a malicious server could cause the script to consume gigabytes of RAM, leading to a denial‑of‑service. | High if the library is used in a long‑running daemon. |
| `ollama_generate`, `ollama_chat` | Same issue – they read the entire response before processing. | High |
| `ollama_list_array` – loops over the output of `ollama list`. If the list is extremely long, the local array `models` may become huge. | Medium |

**Mitigations**  

* Use `curl --max-filesize` or `--limit-rate` to bound the response size.  
* Stream large responses directly to `jq` instead of loading the whole payload into a Bash variable (`curl … | jq …`).  
* Set a reasonable default for `OLLAMA_LIB_MAX_RESPONSE_SIZE` (e.g., 10 MiB) and abort when exceeded.  

### 2.5. Path & Environment Manipulation  

| Observation | Issue | Recommendation |
|-------------|-------|----------------|
| `OLLAMA_LIB_API` is built from `${OLLAMA_HOST:-http://localhost:11434}`. The script later does `export OLLAMA_HOST="$host_api"` and `OLLAMA_LIB_API="$host_api"` in `ollama_app_turbo`. If an attacker can influence `OLLAMA_HOST` (e.g., by exporting it before sourcing the library), they could cause subsequent API calls to go to a malicious host. | Medium | Validate that `OLLAMA_HOST` is a well‑formed URL (`[[ $OLLAMA_HOST =~ ^https?://[[:alnum:].-]+(:[0-9]+)?$ ]]`) before using it. |
| No `PATH` sanitisation before invoking external binaries (`curl`, `jq`, `ollama`). If a malicious directory appears earlier in `$PATH`, the library could execute a compromised binary. | Medium | At start of the script, set a minimal `PATH`, e.g., `PATH="/usr/bin:/bin"` or use `command -v` with full path (`/usr/bin/curl`). |

### 2.6. Error Handling & Exit Codes  

* Most functions capture the exit status of the previous command (`$?`) and propagate it correctly.  
* However, several branches use `return` inside a pipeline (`if ! result="$(ollama_api_get …)"; then`). In Bash, the exit status of a pipeline is the status of the **last** command, not the assignment. This is safe because the assignment is the only command, but if the implementation ever changes, the behaviour may change unexpectedly.  

**Recommendation** – enable `set -o pipefail` globally to avoid silent failures.

### 2.7. Logging & Debug Output  

* `_debug` prints timestamps and messages to `stderr`.  
* The library does not filter or truncate potentially large payloads; e.g., `_debug "_call_curl: json_body: [${3:0:120}]"` limits to 120 characters, which is good.  
* Ensure that **no** secret is ever interpolated into debug output (already noted for the API key).  

---  

## 3. Recommendations – Actionable Hardening Steps  

1. **Enable strict Bash mode at the top of the file**  

   ```bash
   set -euo pipefail
   IFS=$'\n\t'   # safe word splitting
   ```

2. **Make safe mode the default**

   ```bash
   : "${OLLAMA_LIB_SAFE_MODE:=1}"
   ```

   If a user explicitly disables it, issue a clear warning:

   ```bash
   if [[ $OLLAMA_LIB_SAFE_MODE -eq 0 ]]; then
       _error "Safe mode disabled – control characters will not be escaped."
   fi
   ```

3. **Sanitise external inputs**  

   ```bash
   _validate_endpoint() {
       local ep=$1
       [[ $ep =~ ^/[^[:cntrl:]]*$ ]] || { _error "Invalid endpoint: $ep"; return 1; }
       return 0
   }
   ```

   Call this before any API request.

4. **Protect the API key**  

   * Store as **read‑only**: `readonly OLLAMA_LIB_TURBO_KEY` after it is set.  
   * Mask when logging:  

     ```bash
     _debug "OLLAMA_LIB_TURBO_KEY set (${#OLLAMA_LIB_TURBO_KEY} chars)"
     ```

   * Unset on script exit:  

     ```bash
     trap 'unset OLLAMA_LIB_TURBO_KEY' EXIT
     ```

5. **Limit response size & stream when possible**  

   ```bash
   local max=10485760   # 10 MiB
   curl ... --max-filesize "$max" | jq …   # fail if larger
   ```

   For streaming endpoints (`ollama_generate_stream*`), keep the pipeline and avoid variable assignment.

6. **Lock down the execution environment**  

   ```bash
   export PATH="/usr/bin:/bin"
   ```

   Or resolve absolute paths (`/usr/bin/curl`, `/usr/bin/jq`, `/usr/bin/ollama`).

7. **Validate host URL**  

   ```bash
   _validate_host() {
       [[ $1 =~ ^https?://[[:alnum:].-]+(:[0-9]+)?$ ]] || \
          { _error "Invalid OLLAMA_HOST: $1"; return 1; }
   }
   ```

   Call in `ollama_app_turbo` and when the library is sourced.

8. **Graceful handling of empty model list**  

   ```bash
   if (( ${#models[@]} == 0 )); then
       _error "No models available."
       return 1
   fi
   ```

9. **Document security‑aware usage**  

   * Advise users to keep `OLLAMA_LIB_DEBUG=0` in production.  
   * Recommend running the script under a non‑privileged user and using a separate network namespace if connecting to untrusted Ollama servers.

---  

## 4. Conclusion  

The **Ollama Bash Lib** provides a convenient wrapper around the Ollama API, and it follows many good practices (JSON built with `jq`, clear error handling, debug toggles). Nevertheless, several security‑related defaults are weak:

* **Safe‑mode is off** by default, allowing control characters to flow unchecked into JSON.  
* **Debug output can leak the API key** when verbosity is enabled.  
* **No strict Bash mode** and no input sanitisation make the script more prone to accidental misuse.  
* **Unbounded response handling** opens a path for denial‑of‑service attacks.

By applying the hardening recommendations above—especially turning safe‑mode on, adding strict Bash options, sanitising host/endpoint inputs, and protecting the API key—the library can be made robust enough for production environments.  

---  

*Prepared by: **[Your Name]**, Security Engineer*  
*Date: 2025‑08‑08*  
