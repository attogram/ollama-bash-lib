# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.7


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
*Version 0.44.7* – Bash ≥ 3.2 required  

---

## 1. Overview  

The script is a fairly large Bash library that provides a client‑side wrapper around the Ollama HTTP API.  
It defines many helper functions (`ollama_*`) that ultimately build JSON payloads with **jq**, send them with **curl**, and then parse the responses again with **jq**.  

The library also offers a “**eval**” feature (`ollama_eval`) that asks LLM‑generated code to be executed on the host, optionally inside a crude sandbox.

The review focuses on **security‑relevant aspects** (secret handling, input validation, command execution, logging, external dependencies, and compatibility with Bash 3.2) and provides recommendations for hardening.

---

## 2. Threat Model  

| Actor | Goal | Likely Attack Vector |
|------|------|----------------------|
| **Malicious user** (who can run the script locally) | Leak API keys, run arbitrary commands, modify host system | Debug logging, `eval` sandbox bypass, environment manipulation |
| **Remote attacker** (who can influence API data) | Trigger command injection via crafted responses, steal secrets | Unchecked JSON fields, insecure `eval` of LLM output |
| **Supply‑chain attacker** (replaces `curl`, `jq`, `shuf`, `awk`, etc.) | Execute arbitrary code when the library calls those binaries | Reliance on `PATH` to locate utilities |
| **Local privileged attacker** | Escalate privileges via sandbox weaknesses | Inadequate isolation of sandboxed command |

---

## 3. Findings  

### 3.1 Input Validation  

| Function | Issue | Severity |
|----------|-------|----------|
| `_call_curl` – endpoint validation | Only checks that the path starts with “/” and contains no spaces or back‑slashes. Other characters (`;`, `&`, `|`, `` ` ``, `$`, `*`, `?`, `[`…`) are allowed and could be interpreted by `curl` **if** they are later expanded by the shell (e.g., when user‑supplied `$OLLAMA_LIB_API` contains them). Though the endpoint is passed as a *single* argument to curl, future changes (e.g., `eval "$(curl …)"`) could become risky. | **Medium** |
| `_is_valid_model` | Uses a whitelist regex that permits `:` and `/` (e.g., `http://evil`). The function later passes the model name inside JSON, which is safe, but the name may be logged or echoed elsewhere (e.g., debug). | **Low** |
| `_ollama_payload_generate` – `stream` / `thinking` flags | Sets `stream=true` etc. and passes them with `--argjson`. If a caller deliberately sets `$OLLAMA_LIB_STREAM` to a non‑numeric value the function still works, but the value is never used for command injection. No issue. | — |
| `ollama_app_turbo` – `host_api` validation | Uses `_is_valid_url`, which is a simple regex that accepts many schemes (`ftp`, `file`). If an attacker supplies a malicious URL (e.g., `file:///etc/passwd`) the script will set `OLLAMA_HOST` accordingly, causing subsequent `curl` calls to read arbitrary local files. The URL is derived from a hard‑coded constant unless the user explicitly invokes `ollama_app_turbo on`. Still a **potential** misuse if a user runs the script with untrusted arguments. | **Low** |

### 3.2 Secret Management & Logging  

| Area | Issue | Severity |
|------|-------|----------|
| **API Key leakage through debug output** | When `OLLAMA_LIB_DEBUG` ≥ 1, `_call_curl` prints the *entire* curl argument list via `_debug "_call_curl: args: ${curl_args[*]}"`. This includes the header `Authorization: Bearer <key>` unless `OLLAMA_LIB_SAFE_MODE` disables debugging. The redaction routine `_redact` only replaces the *raw* value of `$OLLAMA_LIB_TURBO_KEY`; it does **not** redact the header line, so the key is exposed in logs. | **High** |
| **Environment export** | `ollama_app_turbo -e on` exports `OLLAMA_LIB_TURBO_KEY` to the environment, making it visible to any child process (including `ps`/`/proc/*/environ`). This is intentional but should be highlighted as a risk. | **Medium** |
| **Redaction function** | `_redact` only looks for `$OLLAMA_LIB_TURBO_KEY`. Other potentially secret variables (e.g., `OLLAMA_AUTH`, `CUDA_VISIBLE_DEVICES`) are not redacted in debug output. | **Low** |
| **`ollama_app_vars`** – prints many environment variables, redacting only a handful. If a user sets a secret in a variable named `*_SECRET` it will be shown. | **Low** |

### 3.3 Command Execution  

| Function | Issue | Severity |
|----------|-------|----------|
| `ollama_eval` – sandboxed execution | Uses `env -i PATH="/bin:/usr/bin" bash -r -c "$cmd"` to run generated code. `bash -r` (restricted shell) **does not** prevent all dangerous actions (e.g., reading/writing files via redirection, using builtin `source`, `exec`, or `printf` with process substitution). The sandbox is therefore **weak** and can be bypassed by a crafty command (`cat /etc/passwd > /dev/null`). | **High** |
| `ollama_eval` – “eval” mode | Gives the user the option to run `eval "$cmd"` directly. This is expected to be dangerous, but the function does not enforce any additional confirmation beyond a second “y/N” prompt. | **High** |
| Use of `eval` elsewhere | No other `eval` usage detected. | — |
| `timeout` and `bash -n` syntax check | If `timeout` is missing, the script runs `bash -n` without a timeout, which could hang indefinitely on maliciously large input. Not a security breach but a denial‑of‑service vector. | **Low** |

### 3.4 External Dependencies  

| Dependency | Issue | Severity |
|-----------|-------|----------|
| `curl` / `jq` / `shuf` / `awk` / `timeout` | The script locates them with `command -v`. An attacker controlling the user’s `PATH` could supply malicious wrappers that exfiltrate data. No integrity verification (e.g., checking `$(type -P curl)` against a whitelist). | **Medium** |
| `ollama` (CLI) | The script assumes the binary is trustworthy. Same PATH‑poisoning concern. | **Medium** |
| `sed`, `printf`, `read` | Built‑ins / POSIX utilities, generally safe. | — |

### 3.5 Compatibility (Bash 3.2+)  

* Uses **arrays**, **local**, **parameter expansion** (`${!var}`), **process substitution** (`<(…)`) – all supported in Bash 3.2.  
* Uses **`[[ ... =~ ... ]]`** regex operator – available in Bash 3.2.  
* No Bash‑4+ features (associative arrays, `declare -A`).  
* **Conclusion:** The script is compatible with Bash 3.2.

### 3.6 Miscellaneous  

* `set -o pipefail` is good practice.  
* The script mixes `printf` and `echo`; `echo` is only used for user prompts (acceptable).  
* Exit status handling (`${PIPESTATUS[0]}`) is correct.  
* Global mutable state (`OLLAMA_LIB_*` variables) can be inadvertently modified by a calling script; consider using `local` or a namespace prefix for internal variables only.  

---

## 4. Recommendations  

| Recommendation | Rationale | How to Implement |
|----------------|-----------|-------------------|
| **1. Protect the API key in debug logs** | Current debug prints the full Authorization header. | • Before printing `curl_args[*]`, replace any occurrence of the key with `[REDACTED]` using `_redact`. <br>• Or skip printing the header entirely when `OLLAMA_LIB_DEBUG` ≥ 1. |
| **2. Harden the sandbox for `ollama_eval`** | `bash -r` is insufficient. | • Use a proper container (Docker, `firejail`, `bubblewrap`) or a dedicated chroot with restricted capabilities.<br>• If a lightweight approach is required, launch the command via `stdbuf -o0 -e0 sh -c "set -o noclobber; ..."` and drop all dangerous built‑ins (`unset -f source exec eval`). |
| **3. Add explicit confirmation for the “eval” mode** | Double‑prompt is easy to bypass. | • Require an explicit `--force` flag or read a second confirmation line that mentions “YOU ARE ABOUT TO EXECUTE UNTRUSTED CODE”. |
| **4. Tighten endpoint validation** | Current regex allows many shell‑meta characters. | • Extend `_call_curl` check to reject any of `;|&$*?[]{}()` and ensure the endpoint contains only `[a-zA-Z0-9/_-]`. |
| **5. Verify external binaries** | PATH poisoning can lead to malicious substitutes. | • Resolve each required binary once at library load time, e.g., `CURL=$(type -P curl)` and use `$CURL` later.<br>• Optionally check checksum or file owner (root) for critical binaries. |
| **6. Redact more secrets in debug output** | Only the turbo key is redacted. | • Extend `_redact` to replace any variable whose name matches `*_KEY`, `*_TOKEN`, `*_SECRET`, `*_PASS`. |
| **7. Avoid exporting API key unless requested** | `-e` flag unintentionally leaks key to child processes. | • Keep the key in a **private** variable; only export if the caller explicitly asks for it. |
| **8. Defensive handling of user‑supplied URLs** | `file://` URLs could cause local‑file reads. | • In `ollama_app_turbo`, limit allowed schemes to `https?` only, or add a whitelist. |
| **9. Prevent denial‑of‑service via large input** | `bash -n` without timeout can hang. | • Enforce a maximum size for the generated command (e.g., 4 KB) before syntax checking. |
| **10. Document security posture** | Users need to know the library’s limits. | • Add a “SECURITY.md” with the above points, especially the sandbox warnings. |

---

## 5. Overall Security Rating  

| Aspect | Rating (Low / Medium / High) |
|--------|----------------------------|
| **Confidentiality (API key leakage)** | **High** (debug logging) |
| **Integrity (command injection)** | **Medium** (sandbox weakness, endpoint validation) |
| **Availability (DoS via syntax check)** | **Low** |
| **Overall** | **Medium‑High** – functional but requires hardening before deployment in environments where the API key is privileged or where untrusted users can trigger the `ollava_eval` path.

---

## 6. Conclusion  

The **Ollama Bash Lib** is a feature‑rich wrapper that works with Bash 3.2+. Its core functionality (building JSON, invoking `curl`, parsing responses) is reasonably safe, thanks to the use of **jq** for JSON encoding/decoding.  

However, the library presently **exposes the Ollama Turbo API key** in debug output, and its **sandbox for executing generated code is weak**, making it attractive for privilege‑escalation or data‑exfiltration attacks.  

By applying the mitigations outlined above—most critically sanitising debug logs, strengthening the execution sandbox, and tightening validation of external inputs—the script can be made suitable for production use in environments where confidentiality and integrity are required.  

--- 

**Prepared by:** *Security Analyst*  
**Date:** 2025‑08‑17 (compatible with Bash 3.2+)  
