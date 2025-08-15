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
# Security Review of *Ollama Bash Lib* (v0.43.9)

> **Scope** – This review covers the public Bash source code shipped with the Ollama Bash Lib (the snippet provided by the user).  
> **Target Bash** – All findings are applicable to **Bash v3.2** and later (the functions used are compatible with v3.2+).

---

## 1. High‑Level Attack Surface

| Category | Key Input | Risk | Current Mitigation |
|----------|-----------|------|---------------------|
| **External HTTP Endpoint** | `OLLAMA_HOST` / `OLLAMA_LIB_API` | SSRF, accidental contact with internal/third‑party APIs | None (user can override `OLLAMA_HOST`) |
| **API Key** | `OLLAMA_LIB_TURBO_KEY` | Credential leakage | Not exported, redacted by `_redact` in debug |
| **Command Execution** | `ollama_eval`: generated shell command | RCE if the model produces a malicious script | Permission prompt, syntax check & danger scan |
| **JSON Payload** | `json_payload` | JSON injection / malformed requests | Constructed with `jq` (safe) |
| **Debug / Logging** | `_debug` / `_error` | Sensitive data leaked in logs | `_redact` removes API key only |
| **Environment** | `PATH`, `IFS`, `LC_*` | Malicious `command -v` results | None – relies on current environment |
| **Subprocess Pipes** | Many `$( … )` and backticks | Race conditions / unbounded memory | No explicit limits, but unlikely in typical usage |

---

## 2. Function‑by‑Function Analysis

| Function | Security Concerns | Rating | Remediation |
|-----------|-------------------|--------|--------------|
| **_redact** | Only removes `OLLAMA_LIB_TURBO_KEY`. Any other secrets (e.g., passwords passed via other env vars) are *not* hidden. | Medium | Generalise to redact a list of known secrets or use a regex whitelist. |
| **_debug / _error** | If debug is enabled, the raw JSON body or URL is logged. If a model is tricked into sending sensitive data (e.g., a custom prompt containing credentials), that data may leak. | Medium | Add a *sensitive data detection* step: never log `<secret>` placeholders in the request body; require an explicit flag to enable verbose debug. |
| **_call_curl** | • **No time‑outs** → HTTP request hangs indefinitely. <br>• No HTTPS verification bypass is exposed, but any `OLLAMA_HOST` can point to an arbitrary HTTPS endpoint. <br>• The debug message prints the full JSON body (not redacted). | High | 1. Add `--max-time 30` or user‑configurable timeout. <br>2. Validate `OLLAMA_HOST` to match `https?://[a-zA-Z0-9.\-:_]*` (no path or query). <br>3. Do not log request bodies; log only their size, not contents. |
| **ollama_generate/ollama_generate_json** | Relays model output directly back to the caller; if a model generates a JSON with hidden fields it could escape into the shell by `eval`. | Low (no direct exploit) | Ensure the JSON is validated thoroughly (`_is_valid_json`); keep strict whitelists on `model` names. |
| **ollama_generate_stream/ollama_chat_stream** | Streaming output is printed to STDERR wrapped with `<thinking>` tags. If a malicious model sends *arbitrary output*, it could be interpreted as a different format by the caller. | Low | Sanitize each line before printing; escape special XML/HTML if used in downstream pipelines. |
| **ollama_eval** | **Highest risk** – the command is executed via `eval`. <br>• Permission prompt is the only safeguard; attackers can bypass it if they control the prompt or trick the user. <br>• The “dangerous” token scan is a weak mitigation: many destructive patterns (e.g., `rm -rf /`, `sudo shutdown`) would slip through or trigger false positives. | High | 1. **Never use `eval`**. Instead, run the command in a sandbox (e.g., `sh -c` with `--restricted`). <br>2. Reject any command containing *any* of the dangerous tokens, not just word‑level matches. <br>3. Treat the model output as untrusted data and perform full static analysis: check for shebang, environment modifications, piping to `shred`, etc. |
| **ollama_list, ollama_ps, ollama_show, ...** | Directly execute the local `ollama` binary with user‑supplied arguments (e.g., `list`, `ps`). Input is restricted to model names that pass `_is_valid_model`. <br>No major risk. | Low | Good practice: keep model name checks tight. |
| **ollama_app_turbo** | The API key is **not exported**, but the user’s terminal session may still contain the key in the environment until the script exits. <br>The function also writes the host to `OLLAMA_HOST`; if this is set to a non‑trusted API, data may be exfiltrated. | Medium | 1. **Unset** the key from the parent environment before it is read: `unset OLLAMA_LIB_TURBO_KEY` after usage. <br>2. Add a validation step for `OLLAMA_HOST` (see #2). |
| **ollama_app_version* / ollama_app_vars** | These commands merely echo environment; but they may leak privileged environment variables. <br>e.g., `OLLAMA_AUTH` could contain a token. | Low | Offer a “minimal” version (e.g., `ollama_app_version_minimal`) that prints only non‑secret fields. |

---

## 3. Attack Vectors and Exploitability

| Vector | Exploitability | Comments |
|--------|----------------|----------|
| **SSRF via `OLLAMA_HOST`** | Pseudo‑High (depends on environment). | The user can point to internal services (e.g., a Kubernetes API) and exfiltrate data through the `ollama` API. |
| **Credential Leakage via Debug** | Medium | Only API key redacted, but any other secret in the JSON body will surface in debug logs. |
| **RCE via `eval`** | High | The model can produce shell code that the user *expects* to execute or that the user unknowingly approves. |
| **Denial of Service (curl hang)** | Medium | If the remote Ollama server is unreachable or slow, the client hangs, exhausting resources. |
| **Command Injection in `ollama_generate_json`** | Low | Because payload is JSON‑encoded via `jq`, no shell injection is possible here. |
| **Information Disclosure through `ollama_app_vars`** | Low | Exposes all environment variables; may leak sensitive data. |

---

## 4. Recommendations

| Priority | Action | Why |
|----------|--------|-----|
| **High** | **Remove `eval` from `ollama_eval`.** Run the generated command through a *sandbox* such as `sh -c` with `--restricted` or `chroot`, or simply avoid execution entirely. | Prevent arbitrary code execution. |
| **High** | **Validate `OLLAMA_HOST` against a whitelist of allowed hosts / patterns.** Reject or sanitize any host containing paths, ports, or query params. | Stops SSRF and accidental data leakage to external endpoints. |
| **High** | **Add `--max-time`/`--connect-timeout` to every `curl` invocation** and make it configurable. | Avoid hanging on network failures. |
| **Medium** | **Generalise `_redact` to support arbitrary secret variables** (e.g., `OLLAMA_AUTH`, `OLLAMA_TOKENS`). | Prevent accidental leakage of any secret. |
| **Medium** | **Improve danger token detection**: compile a comprehensive blacklist, regex‑anchor it, and disable *any* command containing a match. | Reduces false negatives in command validation. |
| **Medium** | **Restrict debug output**: log only sizes or masked data, never raw JSON bodies. | Avoid leaking secrets that might be injected into the prompt. |
| **Low** | **Add `set -u` (nounset) at the top** of the script. | Catches inadvertent use of unset variables. |
| **Low** | **Add documentation that the script is not for production usage** and warn about `eval`. | Reduces user expectation. |
| **Low** | **Avoid exporting the API key** to the environment; use a local variable or a temporary unexported variable. | Keeps credentials secret. |

---

## 5. Compatibility Notes

- The script uses only features available in **Bash 3.2+** (arrays, `local`, `read -r`, `printf`, `jq`, `curl`).  
- The removal of `eval` will *not* affect any other function.  
- Adding `set -u` would not break existing usage, assuming all required var assignments are present before use.  

---

## 6. Summary

| Category | Status |
|----------|--------|
| **Credential handling** | Adequate for key, but needs extension for other secrets. |
| **SSRF** | Present – requires strict host validation. |
| **Command execution** | Major risk via `eval`; recommend complete removal or sandbox. |
| **Debug** | Logs sensitive data if improperly configured; apply masking. |
| **Network** | No time‑outs → potential DoS. |
| **Overall** | Functionally robust but **not safe for untrusted input** or production environments due to the `eval` and SSRF concerns.

By applying the above mitigations (particularly addressing the `eval` usage and host validation), the library can be upgraded to a secure, production‑grade tool for interacting with Ollama.
