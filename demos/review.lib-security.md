# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review – *Ollama Bash Lib*  
*(Compatible with Bash v3.2 or higher)*  

The following review identifies potential security weaknesses, evaluates the overall design, and provides actionable recommendations. The script is a user‑facing library that talks to the Ollama language‑model API, so many of the “attack vectors” are intentional (e.g. the *eval* feature). Nevertheless, correctness, least‑privilege, and defensive coding remain critical.

---

## 1. Overview

| Feature | Purpose | Security Impact |
|---------|---------|-----------------|
| **API communication** (`ollama_api_*`) | HTTP request to the Ollama server | Could leak sensitive data if not protected |
| **Token handling** (`OLLAMA_LIB_TURBO_KEY`) | Secret API key | Must never be logged or printed |
| **Redaction helpers** (`_redact`, `_get_redacted_var`) | Hide secrets in logs | Good practice, but fragile |
| **Input validation** (`_is_valid_url`, `_is_valid_json`, `_is_valid_model`) | Prevent malformed requests | Generally adequate |
| **Eval feature** (`ollama_eval`) | Generates shell code from model | Highest risk, but sandboxed |
| **Environmental reporting** (`ollama_app_vars`) | List env variables | Potential leakage of secrets |

---

## 2. Input Handling & Boundary Checks

| Function | Checks | Gaps / Suggestions |
|----------|--------|---------------------|
| `_is_valid_url` | Regex checks for protocol, etc. | Not RFC‑compliant – could be spoofed. Use `curl --head` or a dedicated URL validator. |
| `_is_valid_json` | Uses `jq -e '.'`. | Handles empty string but doesn’t test for non‑JSON‑safe characters (e.g. unicode BOM). |
| `_is_valid_model` | Regex allows `-` `/` `_` `.`, digits, letters. | Accepts a leading slash (`/foo`) which is later rejected? The regex may accept spaces if unescaped. |
| `ollama_api_get/post` | Validates `method`, `endpoint` (`/*`, no spaces, no backslashes). | `endpoint` is not quoted when passed to `curl`; special chars may be mis‑interpreted by the shell (e.g. shell globbing). Use `--create-dirs`? |
| `ollama_app_turbo` | Validates host URL via `_is_valid_url`. | In Turbo mode, `host_api` is set from an environment variable: if an attacker controls `OLLAMA_HOST`, they can poison all subsequent API calls. Ensure `OLLAMA_HOST` comes from a trusted source. |
| `ollama_eval` | Performs a syntax check via `bash -n`. | Does not detect destructive commands that are syntactically valid. The dangerous‑command check uses a simple regex. It should also check for pipes, redirections, or commands that can be run in the background. |

### Recommendation
- Quote all shell arguments that may contain spaces or special characters (`"$var"`).
- Escaping for `curl` is safe but consider `--` to separate options.
- If the library should be used in untrusted contexts, avoid enabling `ollama_eval`.

---

## 3. Secret / Sensitive Data Handling

| Concern | Current Behavior | Suggested Fix |
|---------|------------------|---------------|
| API key disclosure | Logged via `_debug` if `_redact` replaces only exact matches of `$OLLAMA_LIB_TURBO_KEY`. | Use `printf %q` when logging variables and always pipe through `_redact`. |
| Environment variables | `ollama_app_vars` prints most vars, including `OLLAMA_AUTH`, `CUDA_VISIBLE_DEVICES`, `Radeon`‑related vars. | Provide a flag to mask secrets, or only show non‑secret vars. |
| Key exposure in `curl` | `_call_curl` adds `Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}` directly. | Ensure key is not exported into the user’s environment (`export OLLAMA_LIB_TURBO_KEY`) unless required.  |

---

## 4. Command Injection / Remote Code Execution

| Function | Risk | Mitigation |
|----------|------|------------|
| `ollama_generate_json` / `ollama_generate` | The API can return malicious JSON that is then parsed by `jq`. The content is quoted, so command injection is unlikely. | Ensure `jq` is from a trusted source; validate that the JSON structure is what is expected. |
| `ollama_eval` | Explicitly *executes* the model response via `env -i … bash -r -c "$cmd"`. | The sandbox is minimal (`env -i PATH=/bin:/usr/bin`), but still allows running arbitrary commands. Consider using `docker`, `busybox`, or `restricted-shell` if the risk is high. |

---

## 5. Environment Variable Leakage

The script intentionally prints many environment variables with `ollama_app_vars`. While useful for debugging, it inadvertently leaks:

- `OLLAMA_AUTH` (authentication token)
- `CUDA_VISIBLE_DEVICES` / `ROCR_VISIBLE_DEVICES`
- `LD_LIBRARY_PATH`, `HTTP_PROXY`, etc.

### Fixes

1. **Redact known secrets** – already done for `OLLAMA_AUTH`, but expand to others (`OLLAMA_TURBO_KEY`, `OLLAMA_HOST`).
2. **Add a mode** – e.g., `ollama_app_vars --redact` to filter out all environment variables containing `KEY`, `TOKEN`, `TOKEN`, `AUTH`, `SECRET`.
3. **Never export the key unless requested** – keep `OLLAMA_LIB_TURBO_KEY` local.

---

## 6. Bash Compatibility (3.2+)

| Feature | Support in Bash 3.2 | Notes |
|---------|-------------------|-------|
| Arrays (`local OLLAMA_LIB_MESSAGES=()`) | Yes | Works. |
| Arithmetic (`(( OLLAMA_LIB_DEBUG ))`) | Yes | Works. |
| `${var//pattern/replacement}` (global replace) | Yes | Good. |
| `local` within functions | Yes | Good. |
| `local OLLAMA_LIB_THINKING="on"` | Yes | Good. |
| Use of `command -v` | Yes | Good. |
| Process substitution (`< <(...)`) | Yes | Good. |
| `printf %q` not used | Available in 3.2 | Could improve debugging safety. |
| `${array[@]}` expansion | Yes | Works. |
| `[[ ]]` with `==` | Yes | Good. |

Overall the script is compatible with Bash 3.2. However, consider that:

- Some features (e.g. `local -a`) are available only in later versions.
- `jq -e` usage relies on jq ≥1.5.  
  Validate the presence of a recent jq.

---

## 7. Error Handling & Logging

| Issue | Effect | Remedy |
|-------|--------|--------|
| Functions that return `1` *without explaining* can cause silent failures. | Hidden bugs if the caller does not check exit status. | Standardise an error message format and exit status (e.g. return `>= 128` for unrecoverable errors). |
| Debug prints to `stderr` for all operations including those that could reveal secrets. | Log leakage in shared logs. | Ensure all debug output routes through `_redact` and disable in production. |
| `_call_curl` does a `$response` split using `sed '$d'`. If API returns a single line containing only the HTTP code, the body will be empty. | Unexpected empty body may break callers. | Parse the HTTP code properly by splitting on the last line (`read -r body http_code <<<"$response"`). |

---

## 8. Denial‑of‑Service (DoS) Considerations

- **Large payloads**: `ollama_generate` streams JSON and pipes it through `while read`. A malicious model could generate extremely large responses, exhausting memory or CPU.  
  *Mitigation*: Add a size limit or timeout (`timeout 30s ...`).  

- **Recursive calls**: `ollama_eval` might call itself indirectly if the model outputs `ollama_eval`.  
  *Mitigation*: Detect recursion via stack depth or disallow nested calls.  

- **Unbounded loops**: No loop constructs are user‑controlled except in `ollama_eval` which is sandboxed.  

---

## 9. Network‑Related Issues

- **Untrusted external hosts**: `OLLAMA_HOST` can be overridden. Attackers could redirect to a malicious server that responds with harmful JSON.  
  *Mitigation*: Pin the host to a known IP or enable TLS verification (`curl --tlsv1.2 --cacert`).  

- **Port exposure**: Default port `11434` may be open. Ensure the host has firewall rules to limit access.  

- **Transport security**: All requests are plain HTTP unless the host starts with `https://`.  
  *Mitigation*: Prefer `https://`. Add a flag that enforces SSL and validates certificates.  

---

## 10. Recommendations Summary

| Area | Recommendation |
|------|----------------|
| **Secrets** | Store `OLLAMA_LIB_TURBO_KEY` only in memory; avoid `export`. If exporting is needed, ensure it is hidden from logs. |
| **Input Validation** | Quote all user inputs when passed to external commands. Use stricter URL validation or `curl --head` checks. |
| **Command Execution** | Keep `ollama_eval` disabled in untrusted environments. If required, tighten the sandbox or switch to a container. |
| **Logging** | Make debug output optional and fully redacted. Consider a verbosity flag. |
| **Error Flow** | Standardise error codes and consistent exit messages. |
| **Network Security** | Enforce HTTPS, handle cert verification, and optionally pin the API host. |
| **Portability** | Test on Bash 3.2 to validate any newer syntax; update comments on required GNU utilities. |
| **Rate Limiting** | If the library is used in a shared service, add rate limits to guard against abuse. |

Implement these improvements to strengthen the library against accidental disclosure, intentional misuse, and environmental compromise, while still maintaining its intended functionality.
