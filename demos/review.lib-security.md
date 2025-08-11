# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.6


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review – *Ollama Bash Lib* (`ollama-bashlib.sh`)

> **Target environment** – Bash v3.2 + (OS X 10.5 / RHEL 5 style).  
> **Audit date** – 2025‑08‑11

The library is a thin wrapper around the **Ollama** REST API.  
Below is a systematic review of its security posture, with a focus on
potential vulnerabilities, accidental data exposure, and
compatibility with Bash 3.2+.

---

## 1. Compatibility With Bash 3.2

| Feature | Bash 3.2 support | Note |
|---------|------------------|------|
| `local` declaration (inside functions) | ✔ | Works in all downstream versions |
| Array handling (`OLLAMA_LIB_MESSAGES=()`) | ✔ | Syntax unchanged |
| Pattern matching `[[ $var =~ regex ]]` | ✔ | Regex support added in Bash 3.0 |
| Arithmetic `(( ... ))` | ✔ | Fine |
| Sub‑shell expansion `$(command)` | ✔ | Native |
| `${var:-default}` | ✔ | Default substitution |
| `printf` format safety | ✔ | Standard |
| `read -r -s` | ✔ | Silent mode available |
| `read -r -a` (array) – *NOT used* | – | N/A |
| `IFS=` quoting | ✔ | Works |

> **Conclusion** – All syntax constructs used in the script are fully supported by Bash 3.2. No compatibility‑breaking features are present.

---

## 2. Input Validation & Sanitisation

| Function | Validation | Observation | Risk |
|----------|-----------|-------------|------|
| `_is_valid_json` | Passes to `jq -e`. | Assumes `jq` is present. | Potential denial‑of‑service if `jq` missing. |
| `_is_valid_model` | Regex: `^[a-zA-Z0-9._:-]+$`. | Bash 3.2 supports ERE (`=~`). | Safe – only alphanumerics + few separators. |
| `ollama_messages_add` | JSON payload built with `jq -c -n`. | No unsanitised interpolation. | Safe. |
| `ollama_generate_json` | JSON payload via `jq`. | No unsanitised user input. | Safe. |
| `ollama_chat_json` | JSON payload via `jq`. | Same as above. | Safe. |
| `ollama_eval` | Generates a Bash one‑liner via Ollama. | No validation of the returned command beyond syntax and a regex blacklist. | **Risk** – the user (or an attacker who can influence the prompt) can get arbitrary code executed. |

**Key takeaway:** All data that goes into external commands (`curl`, `jq`) is passed through `jq` which guarantees proper JSON escaping. However, the *output* of Ollama commands is not sanitized, therefore the `ollama_eval` procedure is inherently dangerous.

---

## 3. Command Execution

| Area | Details | Potential Vulnerability |
|------|---------|------------------------|
| `_call_curl` | Uses `curl` with `-H "Content-Type: application/json"` and optional Authorization header. | If the user passes a model name containing shell metacharacters, the value is still sanitized by `jq`. No direct command injection. |
| `ollama_eval` | `eval "$cmd"` after user interaction. | **High** – full execution of whatever code Ollama returns.  The prompt can be controlled by the calling user, so essentially the library allows the user to run any shell command they wish. |
| `timeout 1 bash -n <<<"$cmd"` | Syntax checking only. | No injection risk beyond the previous item. |
| Dangerous token regex | Uses: `\b(${dangerous[*]})\b` (with `\b`). | Bash regex does **not** support `\b`. The pattern may always fail, meaning true dangerous phrases may go unnoticed. | *Impact* – silent execution of potentially destructive commands. |

**Mitigation:**  
- If the library is to be used in untrusted contexts, the `ollama_eval` function should be forbidden or heavily sandboxed (e.g. using `chroot`, `namespaces`, or containerisation).  
- The regex should be rewritten using `[[:<:]]`/`[[:>:]]` for word boundaries or plain `[[:space:]]` based separators.

---

## 4. Logging & Redaction

| Logging function | Content | Redaction | Observation |
|------------------|---------|-----------|-------------|
| `_debug` | Prints to `stderr` with timestamp. Uses `_redact` to replace the contents of `OLLAMA_LIB_TURBO_KEY`. | Only the API key is redacted. | **Risk** – Prompts and JSON payloads (which may contain secrets or personal data) are logged verbatim when `OLLAMA_LIB_DEBUG` is enabled. |
| `_error` | Prints to `stderr`. | Redacts API key. | Same risk as above. |

**Recommendation:**  
- Disable `OLLAMA_LIB_DEBUG` by default.  
- If you must turn on debug tracing, either suppress logging of prompts/data entirely, or add an environment variable to control what gets redacted.  
- Consider writing logs to a secure location or using a log‑rotation mechanism.

---

## 5. External Dependencies

| Dependency | Use | Security Note |
|------------|-----|---------------|
| `curl` | HTTP requests | Ensure it is the system default; any version with a known CVE that tamper‑with TLS/HTTP may be dangerous. |
| `jq` | JSON construction & validation | Must be installed and trustable; use pinned versions if possible. |
| `shuf` | Random model selection | Fallback to `awk` if absent – safe. |
| `timeout` (coreutils) | Syntax validation timeout | Must exist; otherwise `ollama_eval` fails silently. |
| `column` | Formatted display in `ollama_lib_about` | No security impact. |

---

## 6. Secret Management

| Secret | Storage | Exposure Risk |
|--------|---------|---------------|
| `OLLAMA_LIB_TURBO_KEY` | Bash variable, *not exported* | Stored in memory only while the script runs. No export → no process‑inherit. |
| `OLLAMA_HOST / OLLAMA_API` | Environment variables | Exported in `ollama_app_turbo()` to child processes. In a multi‑user environment this could leak which host a particular session is pointed at. |
| `OLLAMA_AUTH` (used by external clients) | Exported by user | The library itself does not handle OAuth etc.  No impact. |

**Observation:**  
- No mechanism is in place to persist the API key.  
- The key can be set at runtime by the user via the `ollama_app_turbo()` helper.  After this call, children processes inherit the key if it was exported (not the case here).  
- Since the key is never written to disk, **long‑term persistence** of secrets is not an issue.

---

## 7. Potential Information Leakage

| Source | Content | Mitigation |
|--------|---------|------------|
| API responses | May contain model prompts, internal IDs, or personal messages | Do **not** pipe them to logs unless you’re certain they are public. |
| Debug mode | Logs raw JSON payloads and prompts | Turn off debug in production. |
| Environment var export | `OLLAMA_HOST` and `OLLAMA_LIB_API` | These are benign, but could leak internal network topology. |
| Prompts | Sent to Ollama server – includes whatever the user typed. | Users must be explicit about the privacy implications of their prompts. |

---

## 8. Runtime Behaviour Concerns

| Issue | Description | Impact |
|-------|-------------|--------|
| Streaming `-N` without capturing partial responses | In `ollama_generate_stream` the output might be interleaved with errors. | Can cause log confusion but not a security flaw. |
| `$OLLAMA_LIB_TURBO_KEY` default is empty | Functions check for its presence; if unset, the Authorization header is omitted. | Inadvertently sending requests to a *public* endpoint without authentication. |
| `ollama_app_turbo()` sets `OLLAMA_HOST` / `OLLAMA_LIB_API` *twice* (once in the function, once at the end). | Duplicate export. Minor. | None |

---

## 9. Recommendations & Mitigations

| Area | Recommendation | Rationale |
|------|----------------|-----------|
| **Eval usage** | **Remove** or heavily sandbox `ollama_eval`; if kept, require explicit user permission to run the generated command. | `eval` enables arbitrary code execution – a major risk in any shared or automated environment. |
| **Regex for dangerous token detection** | Replace `\b` with `[[:<:]]`/`[[:>:]]` or `[[:space:]]` separators. | Bash regex eschews `\b`; otherwise the check is ineffective. |
| **Debug logging** | Add a whitelist of redaction keys; optionally provide `OLLAMA_DEBUG_LEVEL` to control verbosity. | Prevent accidental leakage of prompts or other secrets. |
| **Deprecate `set -o pipefail`** | Keep for error visibility, but add a note about potential portability across older shells. | `pipefail` exists in Bash 3.2, but not in POSIX `sh`. |
| **Dependency validation** | At initialization, verify that required binaries (`curl`, `jq`, `timeout`) exist and are from known safe versions. | Early detection prevents silent failures. |
| **Environmental export** | Do *not* export `OLLAMA_HOST` and `OLLAMA_LIB_API` unless absolutely necessary; keep them local to the session. | Avoid leaking internal addresses. |
| **Secret persistence** | Offer optional secure storage (e.g., keyring, encrypted file), or enforce API key usage only via environment variables. | Prevent accidental persistence of the key. |
| **CLI usage guidance** | Add documentation indicating that `ollama_eval` may execute arbitrary commands and should only be used in trusted contexts. | User awareness cuts down misuse. |

---

## 10. Open Issues & Further Review

1. **`ollama_app_turbo()`**: The function re‑exports `OLLAMA_HOST` and `OLLAMA_LIB_API` even when Turbo mode is on. Is this intentional?  
2. **`ollama_eval` dangerous regex**: As mentioned, the current pattern could fail to detect known dangerous commands.  
3. **`_is_valid_json` case handling**: If `jq` is not installed, the function will exit with a non‑zero status, but the caller may treat that as an actual JSON parse failure. Consider distinguishing the two cases.  
4. **Error handling in `ollama_message_*`**: Functions return 1 when array empty; consumer code must handle this. No security issue, but may lead to silent failures.  
5. **`ollama_generate_stream`**: The JSON stream is passed directly to `jq` which may still yield JSON fragments that are not valid for `jq -j`. If the server streams partial lines, this could lead to errors; add a robust streaming parser.

---

## 11. Summary

* **Compatibility** – The script runs cleanly on Bash 3.2 and newer.  
* **Secure coding** – All external data that touches `curl` or `jq` is properly quoted.  
* **High‑Risk Areas** –  
  * `ollama_eval`’s `eval` call.  
  * Inadequate redaction in debug logs.  
  * Regex mis‑use for dangerous token detection.  
  * Potential data leakage via debug logging and API requests.  
* **Recommendations** – Tighten or remove `eval`, refine regex, improve logging redaction, and ensure environment variables do not leak sensitive configurations.

After applying the above mitigations, the library will present a solid security posture for use in trusted environments while avoiding the most common pitfalls associated with shell scripting.
