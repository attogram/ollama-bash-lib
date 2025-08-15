# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Library**  
*(Targeting Bash v3.2 or higher)*  

> **Disclaimer** –  This review treats the script as *source code* that may be sourced or executed in any user environment.  Any evaluation of the logic or the intended use of the library is **NOT** a guarantee of safety.  The focus is on insecure coding patterns, potential injection or information‑leakage vectors, and compatibility gaps that could lead to privilege escalation, data leakage, or unintended command execution.

---

## 1. Compatibility Check (Bash ≥ 3.2)

| Feature | Status | Notes |
|---------|--------|-------|
| **`local` keyword** | ✅ | Supported since Bash 2.0 |
| **Array manipulation** | ✅ | Bash 3.2 introduced arrays; usage of `IFS=,` to concatenate is fine. |
| **Process substitution `<(...`** | ❌ | Bash 3.2 *does* support, but `${!}` expansion or `> >( … )` also works.  The script uses `> >(_ollama_thinking_stream)`, which is legitimate in Bash 3.2. |
| **`set -o pipefail`** | ✅ | Supported. |
| **`printf` with `%s`** | ✅ | Standard. |
| **`jq` and `curl` invocation** | ✅ | Binary dependencies; their presence is tested. |
| **`read -r -n 1 chunk`** | ✅ | `-n` option requires Bash 4.0?  *Check*: `-n` with `read` was added in Bash 4.0.  **THIS IS A BREAKING CHANGE** – the script will *fail* to read single characters under Bash 3.2.  The `_ollama_thinking_stream` helper will not function correctly. |

**Conclusion**: Most of the script runs under Bash 3.2 except the single‑character `read -n 1`, which is a Bash 4.0+ feature.  If you must support Bash 3.2, replace that logic with a loop that reads whole lines or use `dd bs=1 count=1` trick.

---

## 2. Overview of Potential Security Risks

| Category | Potential Vulnerabilities | Example |
|----------|---------------------------|---------|
| **Command Injection** | Unvalidated user input fed directly to shell commands or environment variables. | `ollama_eval` builds `eval "$cmd"`. |
| **Information Leakage** | Debug or error messages reveal sensitive data or internal state. | `_debug` prints API keys (redacted only partially). |
| **Privilege Escalation / Arbitrary Execution** | External input used to trigger programmatic execution with elevated privileges. | `ollama_app_turbo` allows interactive key entry; if mis‑used, could give a user root via `sudo`. |
| **Runtime Errors / Unhandled Edge Cases** | Errors might expose uninitialized variables or buffer overflows. | `_is_valid_json` mis‑parses; errors swallowed via `||` leading to silent failures. |
| **Resource Abuse** | Long‑running network requests or recursion. | `ollama_eval` may spawn endless `bash -n` validations. |
| **Mis‑configured Redirection / File Descriptors** | Accidental leaks to `stdout` instead of `stderr`. | Some debugging prints go to `stdout`. |

---

## 3. Detailed Assessment

### 3.1 Input Validation & Shell Escaping

| Function | Input Source | Validation Strategy | Issues |
|----------|--------------|--------------------|--------|
| `_call_curl` | `method`, `endpoint`, `json_body` (caller‐provided) | checks for `GET/POST`, that `endpoint` starts with `/`, no spaces or backslashes. | **Missing**: does **not** guard against semicolons, `&`, `|`, backticks, or command substitutions.  Even though the endpoint is passed as an array element, the concatenated URL is constructed without quoting – still safe because it is an array element, but if the string contains a space or shell meta char *inside* the array element, `curl` may treat it literally, not as a separator; however, the presence of quotes inside could break the header construction. |
| `ollama_eval` | `task`, `model` | No sanitization – uses `eval "$cmd"` after a user prompt. | **Critical**: The user has effectively full control of the shell code.  Even though a “permission” prompt is shown, denial of permission is *not guaranteed* due to race conditions or accidental confirmation. |
| `ollama_app_turbo` | `OLLAMA_HOST` | No validation – sets the API endpoint to whatever the user supplies. | Accepting any host string can redirect all HTTP traffic to an attacker‑controlled server.  The script does not verify the host contains a valid URL scheme (`http://` or `https://`) or domain.  The resulting `curl` commands will use `-H "Authorization: Bearer …"`; if the host is not intended, this could accidentally leak secrets. |
| `ollama_generate_json` and `ollama_chat_json` | `model`, `prompt` | Models are validated via `_is_valid_model`; prompt is passed directly to JSON payload as `--arg prompt`. | `jq -c -n …` safely escapes the prompt; no immediate risk here. |
| `ollama_list_array` | None, uses `ollama list` output | Output trimmed with `sort`. | No direct user input. |
| `ollama_generate_stream` / others | Use `jq` to filter streaming JSON; fine. | No injection danger. |

**Recommendation**  
Replace string comparison for `endpoint` with a more exhaustive whitelist or regex that matches only `/api/[^/ ]+` (no nested slashes allowed).  In `ollama_app_turbo`, enforce a scheme (`http://` or `https://`) and optionally a regex for domain/IP.  For `ollama_eval`, consider sandboxing the evaluated command or removing eval entirely: run the command in a detached process (`sh -c "$cmd"`) and isolate environment.

### 3.2 Debug / Error Logging

- `_debug` prints the date/time **and** the message, after applying `_redact`.  
- `_redact` replaces only one instance of `OLLAMA_LIB_TURBO_KEY`.  
- If the key contains quotes or newlines, redaction may fail partially.  
- All debug logs go to `stderr`; good practice.  
- `_error` writes to `stderr` without redaction, which may include a raw key if it’s passed into error strings (e.g., `ollama_generate_json` error messages contain user inputs).  

**Recommendation**  
Run `_redact` on *all* outputs that might contain env vars (especially `$JSON_BODY`, URLs, or command lines).  Also escape control characters that could influence terminal output.

### 3.3 Evaluate / Runtime Code (`eval`)

The library contains a single eval that is *in the user’s control*:

```
eval "$cmd"
```

The “permission” prompt is the only safety.  In real-world usage, this is essentially a sandbox escape and must be removed or heavily restricted.  If an attacker gains read/write to the lib file, they can inject arbitrary code through the `ollama_eval` function.

**Recommendation**  
*Avoid* `eval`.  Instead, write the command to a temporary script, mark it executable, and run it in a dedicated subshell.  Or use the `builtin printf -v` trick to avoid eval altogether.

### 3.4 Environment Variable Handling

- `OLLAMA_LIB_TURBO_KEY` is stored in process memory; it is never exported by default – good.  
- `OLLAMA_HOST` and `OLLAMA_LIB_API` are exported, which makes them visible to child processes.  If set by a user in a compromised terminal, all subsequent calls will send traffic to the malicious host.  
- The library does not check whether `OLLAMA_HOST` is a reachable host or a well‑formed URL.  

**Recommendation**  
Add a validation step that ensures `OLLAMA_HOST` matches `https?://[^\s/]+[:]?([0-9]*)` or a proper IPv4/IPv6 address.  Optionally provide a `--allow-unsafe-hosts` flag.

### 3.5 Error Handling and Exit Codes

The script frequently uses `return` on errors, but many callers ignore the return value (e.g., `ollama_generate()` just uses the result of `ollama_generate_json` and continues).  This may lead to hard‑to‑debug failures or silent bugs when a network call fails.

**Recommendation**  
Propagate errors consistently (e.g., `set -e` or explicit check, `|| return $?`).  Document the contract of each function: “returns 0 on success, non‑zero on error”.

### 3.6 Resource Usage / Potential Abuse

- `ollama_generate_stream` and friends use `while` reading from a pipe, then `exit ${PIPESTATUS[0]}` to propagate upstream errors.  This is safe.  
- `ollama_model_random()` loops over all available models via `shuf` or `awk`, acceptable.  
- No long‑running loops or infinite recursion.  **No known resource abuse.**

### 3.7 Bash 3.2 Specific

The only incompatibility mentioned above is the use of `read -n 1`.  All other features are fully supported.  If Bash 3.2 support is mandatory, the `_ollama_thinking_stream` function needs rewriting.

---

## 4. Summary of Findings

| Risk | Severity | Mitigation |
|------|----------|------------|
| **Arbitrary command execution** (`eval`, `ollama_eval`) | **High** | Remove `eval` or sandbox; enforce stricter permissions. |
| **Unvalidated host input** (`OLLAMA_HOST`, `ollama_app_turbo`) | **High** | Whitelist acceptable patterns; restrict to `http(s)://`. |
| **Partial credential redaction** | **Medium** | Redact any occurrence of the key; quote properly; check for newlines. |
| **Potential injection through unescaped variables** | Medium | Use array arguments for curl; validate strings for meta characters. |
| **Bash 4+ only feature (`read -n`)** | Low | Replace with alternative method if Bash 3.2 required. |
| **Unclear error propagation** | Low | Standardize error handling; explicit checking. |

---

## 5. Recommendations for Mitigation

1. **Remove or sandbox `eval`:**  
   Replace with a temporary script or explicit command dispatch.  
2. **Input validation:**  
   * Endpoint regex: `^/[^/ ]+$`.  
   * Host validation: `^https?://[^\s]+$`.  
3. **Redaction hygiene:**  
   Apply `_redact` to all error / debug outputs that might contain private data.  
4. **Strict error handling:**  
   Add `set -euo pipefail` in scripts that source this lib, and return errors consistently.  
5. **Upgrade to Bash 4+** to avoid the `read -n 1` incompatibility, or rewrite the logic.  
6. **Log API key exposure risk**: Warn users when `OLLAMA_LIB_DEBUG` is set and a key is present.

---

## 6. Final Verdict

- **Functionally correct** for Bash ≥ 4.0 but contains several **security‑critical gaps**.  
- If used in a *trusted* environment (offline testing or controlled scripts), the script is acceptable.  
- In *public* or *production* deployments, **the presence of `eval` and lax host validation render the library insecure** and should be rectified before deployment.

---
