# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3


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

*Prepared by: Expert Security Professional*  
*Target Bash version: ≥ 3.2*  
*Date: 2025‑08‑16*  

---

## 1. Overview  

The script implements a fairly large Bash‑only client library for the **Ollama** AI service.  
It offers:

* HTTP API wrappers (`curl`)  
* JSON handling (`jq`)  
* Convenience helpers for chat, generation, model management, etc.  
* A “Turbo” mode that stores an API‑key in the environment variable `OLLAMA_LIB_TURBO_KEY`.  

Overall the code is well‑structured, uses functions, and tries to avoid global side‑effects.  
Nevertheless, a library that talks to a remote service and executes generated code is a high‑risk component. The review below focuses on **security‑relevant aspects** (input validation, command injection, secret handling, privilege escalation, auditability, and compatibility with Bash 3.2+).

---

## 2. Threat Model  

| Actor | Goal | Attack Vector |
|------|------|---------------|
| **Untrusted user** (or attacker with access to a terminal where the library is sourced) | Execute arbitrary commands on the host | Supplying malicious model prompts, JSON bodies, or environment variables that are later passed to `curl`, `jq`, or `eval` |
| **Network attacker** | Intercept or tamper with API traffic | Man‑in‑the‑middle when `OLLAMA_LIB_API` points to an insecure HTTP endpoint |
| **Credential leakage** | Steal the Turbo API key (`OLLAMA_LIB_TURBO_KEY`) | Logs, debug output, or process environment inspection |
| **Privilege‑escalation** | Run privileged commands via the library | Exploiting the sandboxed `env -i … bash -r -c "$cmd"` call or the “dangerous‑token” detection that is incomplete |

---

## 3. Findings  

### 3.1. Input Validation & Injection  

| Area | Issue | Impact | Current Mitigation |
|------|-------|--------|--------------------|
| **API endpoint (`_call_curl`)** | Validates that the endpoint starts with `/` and contains no spaces or backslashes, but does not reject characters like `;`, `&`, `$`, backticks, or `$(…)`. These can be interpreted by the shell when the endpoint is later expanded in `curl "${OLLAMA_LIB_API}${endpoint}"`. | Remote code execution (RCE) if a malicious caller manipulates `$2` of `_call_curl`. | Basic validation; insufficient for Bash 3.2+ where `${var}` is expanded unquoted in the array. |
| **JSON bodies** | `_call_curl` runs `printf '%s' "$json_body" | curl … -d @-`. Provided the JSON is valid (checked by `_is_valid_json`), the content is safe for `curl`. However, any *string* value inside the JSON that later becomes a shell command (e.g., in `ollama_eval`) can be malicious. | Potential RCE via later eval. | No sanitisation; relies on downstream checks. |
| **Model name (`_is_valid_model`)** | Accepts any alphanumeric + `._:/-`. Acceptable, but does not guard against *path traversal* if a downstream command later interprets the value as a file name. | Limited – only a risk if the model name is used in file‑system context. | None required for current use‑case. |
| **Generated code (`ollama_eval`)** | Accepts model‑generated Bash code, runs a **syntax check**, a **dangerous‑token heuristic**, and finally executes it inside `env -i … bash -r -c "$cmd"`. The checks are *best‑effort* only: the regex does not cover all destructive commands, and the syntax check does not guarantee safety (e.g., `eval "$(cat /etc/passwd)"` is syntactically valid). | **High** – attacker can cause privileged actions if the library runs as root, or leak data. | Prompt “Run command (y/N)?” and a primitive token list – not sufficient. |
| **`read -r -n 1` in `_ollama_thinking_stream`** | Reads a single character from stdin without checking the result; if stdin is not a terminal, it can block or read unintended data. | Denial‑of‑service (DoS). | No mitigation. |

### 3.2. Secret / Credential Handling  

| Issue | Impact | Current Behaviour |
|-------|--------|-------------------|
| **Turbo API key exposure** | The key is stored in the environment variable `OLLAMA_LIB_TURBO_KEY`. Even though `_redact` replaces it in debug/error output, the variable is still visible to any child process (e.g., `curl`, `jq`, `ps` of other users) and to anyone who can read `/proc/<pid>/environ`. | Possible credential leakage. |
| **Debug output (`_debug`)** | When `OLLAMA_LIB_DEBUG` is set to 1 or 2, verbose messages (including URLs and request bodies) are printed to `stderr`. If the body contains other secrets (e.g., `OLLAMA_AUTH`) they are not redacted. | Information leakage. |
| **No secure storage** | The key is never persisted to a file with restricted permissions; it is only held in memory. This is fine, but the script never offers a way to read the key back, which is good. | No direct issue, but users may be tempted to export the variable globally, increasing exposure. |

### 3.3. Use of External Commands  

| Command | Risk | Observations |
|---------|------|--------------|
| `curl` | Network traffic may be sent over **plain HTTP** (`http://localhost:11434`) by default, exposing data in clear‑text on the local network (or loopback). | Consider forcing HTTPS when possible; at least document the risk. |
| `jq` | Required for JSON handling – safe, but binary may be replaced by a malicious version in `PATH`. | Use `command -v jq` (already done) but consider verifying checksum if high security needed. |
| `shuf` / `awk` (random model) | No security impact; fallback to `awk` is acceptable. |
| `timeout` | Not present on all systems – fallback to `bash -n`, which may be slower but still safe. |
| `env -i … bash -r -c "$cmd"` | Removes most environment, but `PATH` still points to system directories; a compromised `bash` binary could be used. Also, `-r` (restricted) mode is **not** a security sandbox – it only disables some builtins. | **Do not rely on `bash -r` as a sandbox**. |
| `read -r` (password prompt) | Reads the Turbo key without disabling terminal echo if the terminal does not support `-s`. | Minor usability issue; not a security bug. |

### 3.4. Privilege‑Escalation / Sandbox Weakness  

* The library does **not** attempt to drop privileges. If the script is sourced by a root shell, any generated command executed by `ollama_eval` runs with root privileges.  
* The “dangerous‑token” list is incomplete (`systemctl\s+poweroff`, `-delete`, etc.) and is matched **only** against the plain command string, not against sub‑shells or complex pipelines (`$(rm -rf /)`).  

### 3.5. Compatibility with Bash 3.2  

| Feature | Bash 3.2 support | Comment |
|---------|-----------------|---------|
| `local` in functions | ✔ | Present. |
| `declare -a` (not used) | N/A | No associative arrays – good. |
| `[[ … =~ … ]]` regex matching | ✔ (POSIX ERE) | Works, but note that Bash 3.2’s regex engine is limited (no `\b` word‑boundary). The script uses `\b` in the dangerous‑token regex; on Bash 3.2 this **fails** (treated as literal `\b`). → token detection will not work on the minimum supported version. |
| `printf '%s'` with `${var:0:42}` substring expansion | ✔ (parameter expansion introduced in 2.0) |
| `command -v` | ✔ |
| Process substitution `<( … )` | ✔ |
| `PIPESTATUS` (array) | ✔ |
| `shopt -s inherit_errexit` (not used) | N/A |

**Conclusion:** The script *runs* under Bash 3.2, but a few features (e.g., `\b` in regex) degrade in usefulness.  

---

## 4. Recommendations  

| Category | Action | Rationale |
|----------|--------|-----------|
| **Input sanitisation** | *Strictly quote* all expansions when building `curl` arguments: `curl "${curl_args[@]}"` is already used, but the URL concatenation should be `"$OLLAMA_LIB_API${endpoint}"` **inside double quotes** and **validated** against a whitelist of allowed characters (`[A-Za-z0-9._:/-]`). Reject any characters that may affect the shell (`; & | $ \` \$(…)`). | Prevent command injection through crafted endpoint strings. |
| **Endpoint validation** | Replace the current check with a regex: `[[ $endpoint =~ ^/([A-Za-z0-9._/-]+)$ ]]`. | Guarantees the endpoint cannot contain characters that the shell would interpret. |
| **Secure Turbo key handling** | • Do **not** export `OLLAMA_LIB_TURBO_KEY` by default. <br>• When export is requested, use a *named pipe* or temporary file with `chmod 600` instead of environment variable. <br>• Zero the variable after the request: `unset OLLAMA_LIB_TURBO_KEY` or `printf -v OLLAMA_LIB_TURBO_KEY ''`. | Reduces exposure to other processes and to `ps`/`/proc`. |
| **Debug output** | Extend `_redact` to also mask `OLLAMA_AUTH`, `OLLAMA_HOST`, and any other env vars that may contain secrets. | Avoid accidental leakage. |
| **Network security** | If `OLLAMA_LIB_API` starts with `http://` and the host is not `localhost`, emit a warning or refuse the connection unless the user explicitly sets `OLLAMA_LIB_ALLOW_INSECURE=1`. | Prevent accidental clear‑text transmission. |
| **Sandboxing generated code** | • **Never** execute model‑generated code without a proper sandbox. Consider: <br> – Using `firejail` or `bubblewrap` if present. <br> – Running inside a Docker container (or `nsjail`). <br>• If a sandbox cannot be provided, at minimum: replace `bash -r -c "$cmd"` with `bash -c "$(printf '%s' "$cmd" | sed 's/[\'\"]/\\&/g')"` and run under an unprivileged user (`sudo -u nobody`). | Mitigates privilege‑escalation if the library runs with higher rights. |
| **Dangerous‑token detection** | • Extend the token list to include `rm -rf`, `>`, `>>`, `|`, `$(…)`, backticks, `exec`, `eval`, `source`, `.` and any `systemctl` sub‑commands. <br>• Use a *full‑command* parser rather than a simple regex (e.g., `bash -c "type -t $first_word"`). | Improves coverage against destructive commands. |
| **Regex compatibility** | Replace `\b` with an explicit word‑boundary expression that works in Bash 3.2: `(^|[^[:alnum:]_])(${dangerous[*]})($|[^[:alnum:]_])`. | Makes token detection functional on the supported minimum version. |
| **Error handling** | Use `set -euo pipefail` at the top of the script (or inside a wrapper) to abort on unset variables and failed pipelines. Add explicit checks after every command that might fail (e.g., after `printf` pipelines). | Prevents silent failures. |
| **Logging & Auditing** | Provide an optional audit log file (configurable via `OLLAMA_LIB_LOG`) where all API requests and responses (redacted) are recorded with timestamps. | Helps operators detect abuse. |
| **Code‑review hardening** | Add `shellcheck` compliance (run `shellcheck` on the script). Fix reported issues such as: <br>• Unquoted expansions (`printf '%s' "$result" | jq …`). <br>• Use of `read -r -n 1` without timeout. | Improves overall script robustness. |
| **Documentation** | Clearly state the security implications of using `ollama_eval` and Turbo mode, and recommend **never** to run the library as root. | Sets correct user expectations. |

---

## 5. Security Rating  

| Criterion | Score (0‑5) | Comments |
|-----------|-------------|----------|
| **Input validation / Injection resistance** | 2 | Basic checks present, but key vectors remain. |
| **Credential protection** | 2 | Key is redacted in logs but exposed in environment. |
| **Execution sandbox** | 1 | Relies on a weak “restricted Bash” sandbox and a limited token list. |
| **Network confidentiality** | 3 | Allows insecure HTTP; no enforcement of TLS. |
| **Compatibility & Portability** | 4 | Works on Bash 3.2+, but some regex features degrade. |
| **Overall** | **2.4 / 5** | Functional but **not ready for production** where untrusted input may be processed. |

---

## 6. Final Thoughts  

The **Ollama Bash Lib** is a solid foundation for interacting with the Ollama API from Bash, but the **security posture** is currently **low to moderate**. The most critical issues are:

* **Unrestricted execution of model‑generated Bash code** – a direct RCE pathway.  
* **Exposure of the Turbo API key** via the environment and debug output.  
* **Insufficient validation of API endpoints** that could be abused for shell injection.  

Addressing the recommendations above—especially implementing a robust sandbox for generated commands and tightening secret handling—will move the library into a **secure‑by‑design** stance suitable for use in multi‑user or production environments.  

--- 

*End of Review*  
