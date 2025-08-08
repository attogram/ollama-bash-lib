# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.32


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review – `ollama-bash-lib.sh`

> **Version:** 0.42.32  
> **Target:** Bash 3 or later  
> **Scope:** All public and internal functions of the library.

The review covers 4 main areas

1. **Command‑execution & Injection**  
2. **Information‑leak / Handling of Secrets**  
3. **Data Validation & Sanitization**  
4. **Practical Coding Issues (Bash‑compat, performance, bugs)**  

Below are findings, potential impact, and mitigation recommendations.

---

## 1. Command‑Execution & Injection

| Function / Section | Issue | Impact | Mitigation |
|--------------------|-------|--------|------------|
| `_call_curl`, `ollama_*_json`, `ollama_*` | **Unvalidated endpoint arguments** – callers can pass arbitrary endpoint strings that are concatenated into a URL (`"${OLLAMA_LIB_API}${endpoint}"`). | If an attacker controls the endpoint, they can send requests to arbitrary services without going through the intended Ollama API. | Whitelist allowed endpoints or validate that `endpoint` starts with `/api/`. |
| `ollama_app_turbo` | **`read -r -s`** is correctly used for reading the API key, but the key is stored in an environment variable that can be inherited by child processes. | Any child process (e.g. a shell script executed by the user) will inherit the key in `OLLAMA_LIB_TURBO_KEY`, enabling credential leakage. | Export the key only in the parent shell; alternatively store it in a file with restrictive permissions and read it on demand. |
| **No use of `eval` or backticks** – All commands are invoked directly. | N/A | Good practice. |

**Overall:** No direct eval/command‑substitution vulnerabilities. The biggest vector is the untrusted `endpoint` string and the API key being exposed to child processes.

---

## 2. Information‑Leak / Secrets Handling

| Area | Observation | Impact | Mitigation |
|------|--------------|--------|------------|
| **Debug output (`OLLAMA_LIB_DEBUG`)** | `debug` prints the entire JSON body, curl arguments, and API responses.  This will include **API keys**, **model names**, and user input. | If a system administrator forgets to set `OLLAMA_LIB_DEBUG=0` in a prod environment, sensitive data can leak via stderr or logs. | *Default to OFF.* Force explicit opt‑in: `OLLAMA_LIB_DEBUG=1` only if a user explicitly sets it. Consider filtering known secrets in debug output. |
| **API key persistence** | Stored in a shell variable (`OLLAMA_LIB_TURBO_KEY`) that becomes visible to all descendant processes. | Any script or program launched from the shell may read the key. | Use a **restricted file** or OS keyring; keep the key in memory only for the duration of the request. |
| **Potential race in `OLLAMA_HOST`** | The user can override `OLLAMA_HOST` to any arbitrary URL (including a malicious host). The library will send API requests there. | Credential leakage (as shown above) or malicious code executed on that host. | Validate `OLLAMA_HOST` against an allow‑list (e.g. `localhost`, `127.0.0.1`, `192.168.*`, `10.*`, or a known HTTPS endpoint). |

---

## 3. Data Validation & Sanitization

| Function | Validation | Issues | Recommendations |
|----------|------------|--------|-----------------|
| `_escape_control_characters` | Only escapes when `OLLAMA_LIB_SAFE_MODE == 1`.  It converts control bytes to `\b \t \n \f \r \uXXXX`. | The function operates on raw bytes; UTF‑8 multibyte sequences that contain a byte in the control range (rare) will be escaped incorrectly, potentially corrupting data. | If strict JSON compliance is required, validate that input is UTF‑8 before processing. |
| `ollama_generate_*` and `ollama_chat_*` | Relies on `jq` to escape all JSON literals. | None – `jq` safely quotes content. |
| `ollama_messages_add` | No validation of role or content; they are passed directly to `jq`. | A user may pass an enormous string causing resource exhaustion. | Add a size limit for `content` (e.g., `if [[ ${#2} -gt 64K ]]; then error; fi`). |
| `ollama_app_turbo` | No URL validation for `OLLAMA_HOST`. | Already covered in sec‑2. |
| `ollama_show_json`, `ollama_list_json`, `ollama_model_unload` | No input sanitization of model names; they are sent verbatim in JSON (`--arg model "$1"`). | If the model name contains `"`, it will be escaped by `jq`. Safe. | Minor: Add a check that the model name matches `^[A-Za-z0-9._-]+$`. |

**Bottom line:** The library relies heavily on `jq` for JSON construction – this is safe as long as the inputs are correctly quoted. The only area of concern is the lack of endpoint validation.

---

## 4. Practical Coding Issues

| Issue | Impact | Fix |
|-------|--------|-----|
| **Unquoted `IFS` expansion** in `ollama_list_array` | `echo "${models[@]}"` uses the default IFS which splits on spaces and tabs. If a model name contains whitespace, it will be split. | Use `printf '%q '` or `printf '%s\n' "${models[@]}"` and capture with proper quoting. |
| **`ollama_generate_stream`** piped into `while IFS= read -r -d ''` | The `-d ''` delimiter expects a null byte. The Ollama API streams JSON objects separated by newlines, so this loop may terminate early. | Replace with `while IFS= read -r; do` or use `jq -c` to output one object per line. |
| **Return codes** | Several functions rely on `$?` from previous commands without checking for failure, e.g., `if ! result="$(... )"; then`. `result` may capture an empty string but `$?` is still `0`. | Always test the exit status directly: `if ! ollama_api_post ...; then … fi`. |
| **Legacy Bash support** | Functions use Bash‑array features and arithmetic expansion, which are present in Bash 3 +. No direct incompatibilities. | None. |
| **`ollama_app_vars`** prints variables without quoting – if a variable contains `\t` or newlines this may produce malformed output. | Minor readability issue. | Quote values, e.g., `printf '%s\t%s\n' "VAR" "${VAR:-<unset>"`. |
| **Potential for `curl` to overwrite environment variables** | `curl` inherits all environment vars. If the caller sets a massive env var in the script, it might blow up memory. | Not actionable; trust system. |

---

## 5. Recommendations Summary

| Category | Recommendation |
|----------|----------------|
| **Endpoint validation** | Ensure endpoints start with `/api/` or match an explicit whitelist. |
| **Debug mode** | Default to `OLLAMA_LIB_DEBUG=0`; document that enabling it may leak secrets. |
| **API key handling** | Prefer storing the key in a file or OS keyring; otherwise export it only for the curl command executed. |
| **Host validation** | Verify `OLLAMA_HOST` is an allowed host (e.g., `localhost`, `127.0.0.1`, or a trusted HTTPS endpoint). |
| **Streaming handling** | Use newline-delimited JSON (`jq -c .`) for stream pipelines instead of `-d ''`. |
| **Size limits** | Add limits for message content and response buffers to mitigate DoS. |
| **Documentation** | Clearly state that the library is not intended for untrusted input; recommend users validate data before passing it. |
| **Testing** | Include unit tests that feed malicious endpoints and verify no credentials leak. |

---

## 6. Final Verdict

The script contains **no exploitable eval/command‑injection vulnerabilities**.  
The main risks are **information leaking via debug output** and **potential credential leakage to child processes**. Addressing these with proper configuration policies and host validation will bring the library to a secure baseline for Bash 3+ environments.
