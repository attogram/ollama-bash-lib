# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate -m "gpt-oss:20b" -p "$task\n\n$(cat "$file")"
```
# Security Review – Ollama Bash Lib 0.48.0

This review evaluates the **security posture** of the `Ollama Bash Lib` library, with a focus on the most sensitive operations (network requests, handling of secrets, debug logging, and external command invocation).  
The library is aimed at environments running **Bash v3.2 or later** and is used as a reusable script (exported functions, environment variables).  
All findings are provided with remediation suggestions where appropriate.

---

## 1. Threat Model

| Threat | Impact | Likelihood |
|--------|--------|------------|
| **SSRF / Untrusted URL** – an attacker controlling `OBL_API` or request paths may cause the library to reach arbitrary hosts (including internal ones). | Medium – can read internal data or trigger unwanted actions. |  Medium |
| **Information Disclosure** – secrets leaking via debug logs, environment variables, or JSON output. | High – especially if used in a multi–user or shared environment. |  High |
| **Command Injection** – unsanitized user input building command-line arguments (`curl`, `jq`, etc). | Medium – could lead to arbitrary execution if crafted payloads influence command arguments. |  Low–Medium |
| **Denial of Service / Resource Exhaustion** – large payloads or many calls to `curl` could exhaust CPU, memory or network. | Medium | Low (needs active manipulation) |
| **Privilege Escalation** – none obvious because only non‑privileged commands are run. | Low | Low |

---

## 2. Detailed Findings

### 2.1 Input Validation

| Function | What’s validated | Issues | Recommendations |
|----------|------------------|--------|-----------------|
| `_is_valid_url` | Simple regex against `http(s)://<host>[:port]`. | *Accepts any hostname* – an attacker can set `OBL_API="http://internal.service"` or IP, enabling SSRF. <br>*Does not reject IPs like `http://127.0.0.1:11434`?* (actually accepts). | • Tighten validation (e.g. whitelist 127.0.0.1 or `localhost` by default).<br>• Allow override only if `OBL_ALLOW_UNSAFE_API=true`.<br>• Reject any IP other than loopback unless explicitly permitted. |
| Endpoint validation in `_call_curl` | Checks start with `/`, no spaces or backslashes. | Adequate for preventing malformed paths. | Keep. |
| JSON body validation | Uses `jq -e '.'` to check syntax. | No vulnerability. | Keep. |
| JSON payload for chat/generate | Built via `jq` with proper quoting. | Safe. | Keep. |
| Model name (`_is_valid_model`) | Regex `^[a-zA-Z0-9._:/-]+$`. | Accepts colons → `model:/path` could be abused if the library was extended to support remote models. | Fine for now; consider tightening if remote models become a feature. |

### 2.2 Command Execution

All external commands (`curl`, `jq`, `ollama`, `shuf`, `awk`, `sort`) are invoked via *explicit `command -v`* checks or through `curl_args[@]`, minimizing shell expansion risks.  
No `eval`, `xargs -0`, or variable–expansion‑to‑command usage.  

**Potential Weakness**  
*`_is_valid_json`* uses `jq -e '.'` – if a malicious user controls the JSON sent to `jq`, they could break out of the command due to shell quoting, but `jq` is a binary with no interpretable shell scripts, so risk is low.

**Recommendation**  
Maintain strict quoting and avoid shell metacharacters in user‑supplied content.

### 2.3 Information Disclosure

1. **Debug Logging**  
   – `OBL_DEBUG` controls output of `_debug`.  
   – The debug payload includes: `method`, `endpoint`, `json_body`.  
   – `_redact` only protects `OBL_TURBO_KEY`.  
   – All other secrets (e.g., `OLLAMA_AUTH`, `OLLAMA_CONTEXT_LENGTH`, `CUDA_VISIBLE_DEVICES`, etc.) **may** be printed if they appear in logs (via `printf` or `jq` output).

2. **Environment Variables** – `ollama_app_vars` lists many settings, potentially revealing secrets if those variables contain sensitive substrings.  
   – `_get_redacted_var` removes `AUTH`, `KEY`, or `TOKEN` but not `SECRET` or `PASSWORD`.  

3. **JSON Response Output** – Some functions print raw `jq` results (`ollama_app_version`, `ollama_show_json`, etc.). If the API returns fields containing secrets, they will be exposed.

**Recommendations**

| Area | Fix |
|------|-----|
| Debug Redaction | Extend `_redact` to handle common patterns (`AUTH`, `KEY`, `TOKEN`, `SECRET`, `PASSWORD`, `PASS`) using pattern matching. |
| Config Echo | In `ollama_app_vars`, mask or omit variables that are likely to contain secrets unless the user explicitly asks for them. |
| JSON Logging | When debugging payloads, use `jq -Rrc .` to pretty‑print escaped content, then redact before printing. |
| OBL_DEBUG Level | Change default from `0` to `1` for development only – in production keep it off. |

### 2.4 SSRF / API Misuse

- **`OBL_API`** is set from `OLLAMA_HOST` with a default of `http://localhost:11434`.  
- There is **no restriction** on `OLLAMA_HOST`, so a malicious user could set it to any URL (including private IPs).  
- **Endpoints** are validated but the library will still forward the chosen `OBL_API` value.

**Impact** – The library acts as a proxy that can contact any host reachable from the machine.

**Recommendations**

| Item | Solution |
|------|----------|
| Enforce base host whitelist | Provide a Bash array of allowed hosts (`OBL_ALLOWED_HOSTS=(127.0.0.1 localhost)`) and validate `OBL_API` against it. |
| Allow override flag | Permit safe override via `OBL_ALLOW_UNSAFE_API=true` (only for advanced users). |
| Validate ports | If the API host contains a port, ensure it is in an allowed range. |

### 2.5 Secrets Handling & Redaction

- `OBL_TURBO_KEY` is the only secret stored in the library.  
- `_redact` replaces the *exact* value in messages.  
- **Potential issue:** If the key contains shell metacharacters or is not unique in the output, it may not be fully redacted.  
- **Missing redaction for other secrets** that might be stored elsewhere (e.g., `OLLAMA_AUTH`, `OLLAMA_CONTEXT_LENGTH`).

**Recommendations**

- Use `printf '%q'` to escape secrets before passing to commands.  
- Add a generic `redact_secret` function that iterates over a list of known secret env vars and replaces them in any string.  
- If a secret is already exposed in the environment (`_get_redacted_var`), ensure it never appears in logs or `printf`.

### 2.6 Environment Variable Exposure

`ollama_app_vars` does not sanitize all printed values.  
An attacker could set an env var like `BAD=foo; echo malicious code` and then observe it in the output.

**Recommendation**

- Trim or mask all values in `ollama_app_vars` before printing.  
- Optionally provide a `--quiet` flag that omits this output.

### 2.7 Compatibility with Bash v3.2

- The script uses **parameter expansion `${var//pattern/repl}`**, `shopt`, array constructs, and `printf`.  
- Bash 3.2 supports all features in use.  
- **Potential caveat**: The script uses `read -r -n 1` (available since Bash 3.1).  
- The regex used by `=~` is supported since Bash 3.2.  

**Nothing requires updates** for Bash v3.2.

### 2.8 Miscellaneous

| Issue | Severity | Note |
|-------|----------|------|
| `shift $((OPTIND-1))` used in many functions: if called from a subshell or with `set -e`, might shift incorrectly. | Low | Standard usage. |
| The script returns non‑zero on many failures; callers may exit prematurely. | Low | Good practice. |
| No `set -e` or `set -u`; thus uninitialized variables silently default to empty strings. | Low | Acceptable given design. |

---

## 3. Recommendations

| Category | Action | Priority |
|----------|--------|----------|
| **URL & Host Validation** | Introduce a whitelist for `OBL_API` and reject any input not matching the whitelist. | High |
| **Secret Disclosure** | Expand `_redact` & `_get_redacted_var` to filter all known secret patterns. | High |
| **Debug Logging** | Ensure debug messages are only emitted when `OBL_DEBUG=1` or higher, and always pass payloads through `_redact`. | Medium |
| **Environment Variable Exposure** | Mask or omit potentially sensitive config in `ollama_app_vars`. | Medium |
| **SSRF Prevention** | Provide `OBL_ALLOW_UNSAFE_API` toggle with warning, default to false. | Medium |
| **Input Sanitization** | Add stricter validation for `OLLAMA_HOST` (ensure IP or localhost), and for any new parameters added in future. | Medium |
| **External Command Safety** | Keep explicit quoting around all parameter expansions used in commands. | Low |
| **Documentation** | Add explicit security notes in README / help messages about SSRF risk and secret handling. | Low |
| **Testing** | Add unit tests (e.g., bash unit or bats) that verify no secrets leak under various `OBL_DEBUG` settings. | Low |

---

## 4. Summary

- The **core functionality** is implemented safely, with safe handling of external commands and proper quoting.  
- The **highest-security risk** is the possibility of **SSRF** via the `OBL_API` variable and the **information leakage** from debug logs and environment variable listings.  
- **Redaction** is currently limited to the `OBL_TURBO_KEY` and can be improved to cover other secrets.  
- The library already works on Bash 3.2, so no breaking changes are required for backward compatibility.  
- By applying the above recommendations the library will mitigate the most significant risks while preserving its intended functionality.

**Next Steps** – Implement a whitelist for `OBL_API`, extend redaction, and update help output. When these fixes are in place, consider adding automated tests that simulate malformed input and verify no secrets appear in logs.
