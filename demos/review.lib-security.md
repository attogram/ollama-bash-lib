# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.34


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review – Ollama Bash Library  
**Target**: Bash script that provides a library for interacting with the local Ollama LLM server.  
**Scope**: The whole public‑facing script (functions that are exported to users).   
**Target Compatibility**: Bash v3.x or later (Linux, macOS, BSD, Cygwin, Windows‑WSL, etc.)

---

## 1. Threat Model

| Threat | Description |
|--------|-------------|
| **Command‑Injection** | Arbitrary shell commands may be injected via parameters that are not shell‑quoted. |
| **Privilege Escalation** | If the script runs as a privileged user, an attacker may abuse its ability to execute external commands. |
| **Data Exposure** | Sensitive values (API key, host URL, user input) could be leaked via logs or environment variables. |
| **Denial‑of‑Service** | Resource exhaustion (memory, CPU) or malformed inputs that break the script. |
| **Supply‑Chain/Substitution** | Replacement of external utilities (`curl`, `jq`, `awk`, etc.) by hostile binaries. |
| **Information Leakage** | Debug or error messages may reveal internal state or secrets. |

The script is typically used *client‑side* and is not exposed to untrusted input except via user controlled variables (`OLLAMA_HOST`, `OLLAMA_LIB_TURBO_KEY`, prompts, etc.).  
All user‑provided data passes through `jq -n --arg ...` or is piped into `curl -d @-`, which is safe against shell‑command injection. The main vectors are thus:

| Vector | Risk | Current Status |
|--------|------|----------------|
| **Environment Variables** (`OLLAMA_HOST`, `OLLAMA_LIB_TURBO_KEY`, etc.) | If attacker controls the shell (e.g., via `~/.bashrc`), arbitrary values may be set. | Script does not validate, but the values are only used as *data* for `curl`. |
| **External Command Replacement** (`curl`, `jq`, `awk`, `ps`, `sed`, `head`, `tail`, etc.) | Attacker may prepend a malicious binary to `$PATH`. | No signing/verification – risk present. |
| **Debug Mode** (`OLLAMA_LIB_DEBUG=1`) | Logs can reveal the host URL and raw JSON payloads. | `debug` prints everything to *stderr* – not suppressed unless debug is disabled. |

---

## 2. Findings

### 2.1. Safe Handling of User Input (Low Risk)

- **JSON Payload Construction** uses `jq -n --arg ...`, which properly escapes the values.  
  *No command injection here.*

- **Prompt Strings** are passed as arguments to `jq`; no evaluation occurs.  
  *Safe.*

- **API Endpoint (`$2`)** is a path string; it’s concatenated with `$OLLAMA_LIB_API` within the same Bash assignment, no shell execution.  
  *Safe.*

### 2.2. External Command Use (Medium–High Risk)

| Command | Vulnerability | Remarks |
|---------|---------------|---------|
| `curl` | If a malicious `curl` binary is executed, arbitrary shell commands may run. | `curl` is invoked with a `-X` and `@-`, no shell execution. However, the attacker can supply a path that shadows `/usr/bin/curl`. |
| `jq` | Similar to above; can be hijacked on the PATH. | The script uses `jq -r`. |
| `od -v -tuC` | If replaced, could modify the output and potentially break the escaping logic. | Not a critical risk but may lead to incorrect behavior or information leakage. |
| `awk`, `printf`, `head`, `tail`, `sed`, `read`, `printf` | Standard utilities – risk only if `PATH` is compromised. | Low probability on most systems. |
| `awk` to parse model names | No command injection involved; only reading data. | Safe. |

**Recommendation**:  
- Consider tightening `$PATH` at the beginning of the script (e.g., `PATH="/usr/bin:/bin"`).  
- Optionally, resolve full paths with `command -v curl jq` and store them in variables; then call those paths explicitly.  
- Add a `--fail` flag to `curl` to treat non‑2xx HTTP responses as errors.

### 2.3. Information Leakage (Medium Risk)

- **Debug Logging**: `_debug` prints timestamps, raw JSON payloads, and endpoint URLs to `stderr`.  
  If an attacker can access or read the terminal (or if executed in a shared environment), secrets could leak.  
  *Current status*: `OLLAMA_LIB_DEBUG` is `0` by default, but the user can enable it.  
  *Recommendation*:  
  - Never log the API key (`OLLAMA_LIB_TURBO_KEY`) or any part of it.  
  - Mask secrets in debug output (e.g., replace `OLLAMA_LIB_TURBO_KEY` with `***`).  
  - Make debug mode opt‑in and perhaps automatically disabled when running in non‑interactive shells.

- **Environment Export**: `ollama_app_turbo` exports `OLLAMA_HOST`; if that variable contains a secret (e.g., `https://token@host`), the secret becomes visible to child processes.  
  *Recommendation*: avoid export unless necessary; use local overrides only.

### 2.4. Unvalidated or Dangerous Input

| Function | Input | Validation / Issue |
|----------|-------|-------------------|
| `ollama_app_turbo` | `$1` (`on`/`off`) | Accepts many case variants; safe. |
| `ollama_generate_json` / others | Prompt string | No sanitization of control characters; relies on `_escape_control_characters`. |
| `ollama_chat_json` | `messages` array | The array is constructed via `${OLLAMA_LIB_MESSAGES[@]}` and passed through `jq`; safe. |
| `ollama_list_array` | None | Just reads local output. |
| `ollama_model_unload` | `model` | No validation against allowed names; but `jq -n` escapes. |

Overall, user input is properly escaped; no immediate injection risk.

### 2.5. Bash 3 Compatibility

The script uses Bash features that are available in Bash 3.x:

- Arrays (`declare -a`, `append`, `${#array[@]}`).
- Parameter expansion `${var:offset:length}`.
- `read -a` and `read -r -d ''`.
- Process substitution `< <(...)` (Bash 3+).
- Associative arrays do **not** exist (the script doesn’t use them) → safe.

**Potential issue**:  
- Bash 3 lacks `printf -v`. The script uses `printf -v chr '\\%03o' "$b"`; this is *not* supported in Bash 3.  
  *Result*: the script will fail under Bash 3.  
  **Fix**: Replace with a POSIX‑compatible construct, e.g.:

  ```bash
  chr=$(printf '\\%03o' "$b")
  out+=$chr
  ```

  or simply use:

  ```bash
  out+=$(printf '\\%03o' "$b")
  ```

### 2.6. Error Handling and Exit Codes (Low Risk)

- Most functions properly capture the return value of the last command.  
- Some functions (e.g., `_escape_control_characters`) ignore failures silently.  
- There is no `set -e`, `set -u`, or `set -o pipefail`; errors may propagate or be missed.  
  *Recommendation*: add a guard line (`set -euo pipefail`), then adjust functions that need to ignore specific errors.

### 2.7. Denial‑of‑Service / Resource Exhaustion

- `_escape_control_characters` builds a string by concatenating bytes. For very large inputs this can consume substantial memory, but Bash string concatenation is already O(n^2).  
  *Mitigation*: Limit maximum payload size (e.g., 10 MB) before processing, or stream directly instead of loading entire JSON.

- `curl -N` runs with no buffering; a long or infinite streaming response could exhaust output buffers.  
  *Mitigation*: set a timeout (`--max-time`).

### 2.8. Miscellaneous Observations

| Area | Comment |
|------|---------|
| **Missing `set -o pipefail`** | Some pipelines might mask errors (e.g., `curl` succeeds but `jq` fails). |
| **Use of `jq` for JSON** | No version check; older `jq` may not support `--argjson`. |
| **Exporting `OLLAMA_HOST`** | Might leak host details to child processes; not critical but should be treated carefully. |
| **Use of `head -n+1`** | `head -n 1` is equivalent and more portable. |
| **`OLLAMA_APP_TURBO`** | Prompts user for API key *in the script itself*. If used in a script source context (sourcing the library), this may produce unwanted interactive prompts. Consider decoupling user interaction from library logic. |

---

## 3. Recommendations

| Area | Priority | Recommendation |
|------|----------|----------------|
| **Path Sanitization** | High | Resolve full paths for all external commands once at the start (`CURL=$(command -v curl)`, etc.) and use those full paths. |
| **Bash 3 Compatibility** | High | Replace `printf -v` with a POSIX‑compatible alternative. |
| **Debug Output** | Medium | Remove or mask secrets in debug logs. Use environment variable or config flag to enable debug only for development. |
| **Argument Validation** | Low | Validate `OLLAMA_HOST` for a proper URL scheme (`^https?://`). |
| **Error Propagation** | Medium | `set -o pipefail` and `set -euo pipefail`. Adjust functions that need to capture errors. |
| **Timeouts** | Medium | Add `--max-time 60` or user‑configurable timeout to `curl`. |
| **Input Size Limit** | Low | Reject payloads over a configurable size to avoid memory exhaustion. |
| **Supply‑Chain** | Medium | Add optional checksum verification for critical external utilities (`curl`, `jq`). |
| **User Prompts** | Low | Separate interactive prompts from library logic – use a dedicated “setup” script. |
| **API Key Handling** | Medium | Do not export `OLLAMA_LIB_TURBO_KEY`; keep it local. If exported, mask it in logs. |
| **Script Documentation** | Low | Add `# shellcheck disable=SC2015` and other disables as needed to pass shellcheck. |
| **Version Checks** | Low | Check that the `jq` version supports required options; if not, provide a fallback or error message. |

---

## 4. Summary

The script is **functionally safe** for normal use. User‑controlled data is properly escaped, and the most dangerous vectors (command injection, data leakage) are mitigated by design. However, there are a few areas where the library could be hardened:

1. **Path Hijacking** – Use absolute paths for all external utilities.  
2. **Bash 3 Compatibility** – Replace non‑portable constructs.  
3. **Debug Leakage** – Ensure secrets are never logged.  
4. **Error Handling** – Adopt stricter Bash modes to surface hidden failures.  
5. **Resource Limits** – Avoid memory exhaustion for large prompts.  

Implementing the above fixes will raise the security posture of the library to a level suitable for production deployments, especially in shared or privileged environments.
