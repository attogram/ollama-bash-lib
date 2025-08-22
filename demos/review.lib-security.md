# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate -m "gpt-oss:120b" -p "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
*Version: 0.46.2* (requires Bash ≥ 3.2)  

Prepared by: **Security Analyst**  
Date: 2025‑08‑22  

---  

## 1. Scope & Threat Model  

| Aspect | Description |
|--------|-------------|
| **Asset** | The Bash library that allows a user (or a script) to invoke the Ollama API (local or remote) and manage model processes. |
| **Actors** | • **Legitimate user** running the library on a workstation or server. <br>• **Malicious attacker** who can influence the environment (e.g., inject environment variables, control input files, or run the script with crafted arguments). |
| **Potential Impact** | • Leakage of the Turbo‑mode API key (`OBL_TURBO_KEY`). <br>• Remote code execution (RCE) via command‑injection in any place where un‑quoted data is passed to the shell. <br>• Denial‑of‑service (DoS) by exhausting resources (e.g., unlimited array growth, uncontrolled `curl` timeouts). |
| **Assumptions** | • The host OS provides the standard utilities (`curl`, `jq`, `shuf`, `awk`, `sed`, `grep`, `read`). <br>• The library is sourced or executed by a trusted Bash interpreter. <br>• No set‑uid root binaries are invoked by the script. |

---

## 2. High‑Level Findings  

| # | Category | Finding | Severity |
|---|----------|---------|----------|
| 1 | **Secret Exposure** | The Turbo‑mode API key is stored in `OBL_TURBO_KEY` and may be exported to the environment (`export OBL_TURBO_KEY`). Child processes (including `curl`) inherit it, and debugging output can inadvertently print the key if redaction logic fails. | **High** |
| 2 | **Insufficient Input Sanitisation** | Some user‑controllable values are interpolated in command lines without full quoting: e.g., `response="$(ollama_generate_json -m "$model" -p "$prompt")"` later fed to `jq`. Though the JSON is built with `jq`, the raw `prompt` is used to build a JSON string via `jq` (safe), but other functions (e.g., `_call_curl` when *no* JSON body is supplied) embed `$endpoint` directly in a curl argument list – the endpoint is validated but the validation regex is permissive (`^[a-zA-Z0-9.-]+(:[0-9]+)?$`) and does **not** forbid `&`, `?`, `%`, etc. This could allow a crafted endpoint to affect the HTTP request in unexpected ways. | **Medium** |
| 3 | **Debug / Error Logging Leakage** | `_debug` and `_error` print messages to `stderr` using `printf`. If `OBL_DEBUG` is set (especially to `2` – verbose), these logs may contain full request bodies, including user prompts and even the full JSON payload (which may contain sensitive data). | **Medium** |
| 4 | **Unbounded Array (`OBL_MESSAGES`)** | The library stores every added message in a global Bash array. An attacker who can repeatedly call `ollama_messages_add` can cause the array to grow without limit, exhausting memory or causing the process to crash. | **Low** |
| 5 | **Missing `set -u` / Strict Mode** | The script does **not** enable `set -u` (treat unset variables as errors), so typos or missing variables may be silently interpreted as empty strings, possibly leading to malformed requests. | **Low** |
| 6 | **Potential Command‑Injection via `read -s`** | The Turbo‑mode activation reads the API key with `read -r -s api_key`. If the terminal input is controlled by an attacker (e.g., a malicious wrapper script feeding data via a pipe), a newline inside the key could be interpreted as the end of the read, but the key would then be truncated – not a security issue, but could cause authentication failures. | **Info** |
| 7 | **Use of `eval`‑like Constructs** | No direct `eval` usage, but functions like `printf '%s' "$response"` and `printf '%s' "$json_body"` rely on the format string `%s`. They are safe because they are not user‑controlled format strings. | **None** |
| 8 | **Compatibility with Bash 3.2** | All syntax used (`[[ ]]`, `${var:offset:length}`, arrays, `local`, process substitution `< <(...)`) is supported by Bash 3.2. No Bash 4‑only features (e.g., associative arrays) are present. | **N/A** |

---

## 3. Detailed Walk‑Through of Critical Code Paths  

### 3.1. `_call_curl` (core HTTP handler)  

```bash
curl_args=(
    -s -N --max-time "$OBL_TIMEOUT"
    -H 'Content-Type: application/json'
    -w '\n%{http_code}'
)

if [[ -n "${OBL_TURBO_KEY}" ]]; then
    curl_args+=( -H "Authorization: Bearer ${OBL_TURBO_KEY}" )
fi
...
curl_args+=( -X "$method" )
curl_args+=( "${OBL_API}${endpoint}" )
```

* **Risk** – The `Authorization` header is constructed *unquoted* inside the array. If `OBL_TURBO_KEY` contains spaces or special characters, curl will treat them as separate arguments, potentially leaking part of the key or causing a malformed request.  
* **Mitigation** – Quote the value explicitly: `-H "Authorization: Bearer ${OBL_TURBO_KEY}"` is already quoted, but the array expansion later (`"${curl_args[@]}"`) correctly preserves the whole header. However, the *value* itself should be validated to contain only base‑64 URL‑safe characters (`^[A-Za-z0-9._-]+$`).  

* **Risk** – `OBL_API` can be overridden via the environment (`OLLAMA_HOST`). No validation is performed before concatenation with `${endpoint}`. An attacker could set `OLLAMA_HOST="http://evil.com -H 'X-Exploit: 1'"` and break the intended request, injecting additional curl headers. Though the script later validates `endpoint` to begin with `/`, the malicious part is in the *host* part.  
* **Mitigation** – Validate `OBL_API` with `_is_valid_url` at startup (or reject any value containing spaces or `-H`).  

### 3.2. `_redact`  

```bash
if [[ -n "${OBL_TURBO_KEY}" ]]; then
    msg=${msg//"${OBL_TURBO_KEY}"/'[REDACTED]'}
fi
```

* Only the exact string value of the key is redacted. If the key appears in a **different form** (e.g., URL‑encoded, base64‑encoded, or split across lines) the redaction will miss it.  
* **Recommendation** – Add a generic secret‑masking function that replaces any long (>8 chars) alphanumeric substrings that look like a token, or replace the whole `Authorization` header before logging.  

### 3.3. `ollama_messages_add`  

```bash
json_payload="$(jq -c -n \
    --arg role "$role" \
    --arg content "$content" \
    '{role: $role, content: $content}')"
OBL_MESSAGES+=("$json_payload")
```

* `jq` safely escapes the content, preventing JSON injection. However, the **array** is later printed with `printf '[%s]' "$(printf '%s,' "${OBL_MESSAGES[@]}" | sed 's/,$//')"` – this uses unquoted `${OBL_MESSAGES[@]}` inside command substitution, which is safe because `${...}` expands each element as a separate word, but the `sed` pipeline may interpret *any* element containing a newline, leading to malformed JSON.  
* **Mitigation** – Use `printf '%s\n' "${OBL_MESSAGES[@]}" | paste -sd, -` (POSIX‑compatible) or rely on `jq -s '.' <<<"${OBL_MESSAGES[*]}"`.  

### 3.4. `ollama_app_turbo`  

* When turning Turbo mode **on**, the function stores the API key in a regular variable and optionally `export`s it. Exported variables are inherited by **all** child processes, including those unrelated to Ollama (e.g., a later `git` command). This widens the attack surface.  

* **Mitigation** – Keep the key **unexported** and pass it only via the `Authorization` header to curl. If export is requested (`-e`), warn the user about the security implication.

### 3.5. Debug Output  

* Debugging shows the full **JSON payload** (`_debug "_call_curl: json_body: ${json_body:0:120}"`). Even when truncated, sensitive data (e.g., prompts, model names) may be exposed in logs.  

* **Mitigation** – When `OBL_DEBUG` ≥ 1, redact any field named `prompt`, `content`, `message`, or any value longer than a configurable threshold before printing. Provide a dedicated `OBL_DEBUG_REDACT` flag.

---

## 4. Recommendations  

| # | Recommendation | How to Implement | Rationale |
|---|----------------|------------------|-----------|
| 1 | **Validate/Whitelist `OLLAMA_HOST`** | At script start: `if ! _is_valid_url "${OLLAMA_HOST:-}"; then _error "Invalid OLLAMA_HOST"; return 1; fi` and reject spaces or `-H`‑like substrings. | Prevents host‑header injection and arbitrary curl flags. |
| 2 | **Strict secret handling** | • Do **not** export `OBL_TURBO_KEY` unless the user explicitly opts in.<br>• When exporting, prepend warning.<br>• Add a function `_sanitize_header` that replaces any `Authorization: Bearer …` with `Authorization: Bearer [REDACTED]` before logging. | Limits accidental leakage of API tokens. |
| 3 | **Improve redaction** | Expand `_redact` to mask any substring matching `/[A-Za-z0-9\._-]{20,}/` (typical token length) and to replace the entire `Authorization` header. | Covers cases where the key appears in transformed form. |
| 4 | **Enforce strict Bash options** | Add at top of file: `set -o errexit -o nounset -o pipefail` (the latter already attempted). Use `${var:?}` wherever a mandatory variable is accessed. | Fails early on programming errors, reducing unexpected behaviour. |
| 5 | **Limit `OBL_MESSAGES` growth** | Introduce a configurable ceiling, e.g., `MAX_MESSAGES=500`. In `ollama_messages_add`, after pushing new entry, check `if (( ${#OBL_MESSAGES[@]} > MAX_MESSAGES )); then OBL_MESSAGES=("${OBL_MESSAGES[@]: -MAX_MESSAGES}") ; fi`. | Prevents memory exhaustion attacks. |
| 6 | **Sanitize endpoint strings** | Current check allows characters like `?` and `&`. Refine regex, e.g., `local url_regex='^/api/[A-Za-z0-9/_-]+$'`. Reject query strings; they should be passed in JSON body. | Avoids ambiguous or malicious endpoint paths. |
| 7 | **Avoid revealing full prompts in debug** | When `OBL_DEBUG` is enabled, truncate prompt after a safe length (e.g., 80 chars) and replace the rest with `…`. Optionally hide prompts completely with a separate flag. | Reduces leakage of potentially sensitive user input. |
| 8 | **Use safer JSON aggregation** | Replace the manual `printf '%s,' "${OBL_MESSAGES[@]}" | sed` with: `jq -s '.' <<<"${OBL_MESSAGES[*]}"`. This guarantees proper JSON array syntax even when messages contain newlines. | Prevents malformed JSON that could be interpreted unexpectedly by downstream services. |
| 9 | **Documentation of security posture** | Add a `SECURITY.md` file summarising the above mitigations, known limitations, and how to report vulnerabilities. | Improves transparency and encourages responsible disclosure. |
|10 | **Run static analysis** | Test the script with tools like `shellcheck` (compatible with Bash 3.2) and address any reported warnings (e.g., quoting, double‑[`[` vs `[[`). | General code‑quality improvement, catches subtle bugs. |

---

## 5. Compatibility with Bash 3.2  

* All syntactic constructs (`[[ ]]`, `${var:offset:length}`, arrays, `local`, process substitution `< <(...)`, `printf -v` – not used) are supported in Bash 3.2.  
* The script **does not** use associative arrays, `declare -A`, or `BASH_REMATCH` with extended regex features beyond what Bash 3.2 provides.  
* The only potential incompatibility is the use of `$(< <(...))` (process substitution), which is available since Bash 2.0.  

Thus, the script remains functional on Bash 3.2, provided the external utilities (`curl`, `jq`, `awk`, `sed`, `grep`, `shuf`) are present.

---

## 6. Summary  

*The Ollama Bash Lib is a fairly comprehensive wrapper around the Ollama API, but it handles a **sensitive API token** and user‑provided prompts, making secret leakage the primary security concern.*  

| Issue | Severity | Fix Priority |
|-------|----------|--------------|
| API key exposure (export, logs) | High | Immediate |
| Insufficient host/endpoint validation | Medium | High |
| Unbounded message array | Low | Medium |
| Debug‑log leakage of prompts | Medium | High |
| Missing strict Bash options | Low | Low |

Implementing the recommendations above will considerably harden the library against accidental credential leakage, command‑injection vectors, and resource‑exhaustion attacks while preserving compatibility with Bash 3.2.  

---  

*End of Review*  
