# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.1


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review – Ollama Bash Library  
*(Bash v3.2+ compatible)*  

> **Purpose of review** – Evaluate the script for common Bash security pitfalls,  
> assess the robustness of its input handling, output sanitisation, and overall  
> resilience against accidental escalation or data leakage.  
> No audit of functional correctness is performed – only security‑related concerns.

---

## 1. Overview

* The library is a collection of functions that wrap `curl`, `jq`, `ollama`, and some
  shell utilities.  
* The script is intentionally *stateful* – `OLLAMA_LIB_*` globals hold runtime data,  
  and the library is meant to be sourced, not executed.  
* All public helpers expose their own minimal help text (`-h`) and guard against
  invalid parameters.

Key security touch‑points:

| Area | What it does | Security stance |
|------|--------------|-----------------|
| **Environment variables** | `OLLAMA_API`, `OLLAMA_HOST`, `OLLAMA_LIB_DEBUG`, `OLLAMA_TURBO_KEY` | Sensitive data is partially redacted. |
| **Command execution** | `curl`/`jq` wrapped in parameterised arrays; `eval` in `ollama_eval`. | Most commands are safe; `eval` is a deliberate risk. |
| **Input validation** | Regexes for URLs and tool definitions, JSON validation via `jq`. | Generally defensive, but some edge cases. |
| **Safe mode** | `OLLAMA_LIB_SAFE_MODE` drops ability to run eval/dump API keys. | Good defensive mechanism. |

---

## 2. Potential Vulnerabilities & Risks

| # | Issue | Why it matters | Script's mitigation | Recommendation |
|---|-------|----------------|--------------------|----------------|
| 1 | **Command injection via `ollama_tools_run`** | The *command* supplied by the user is executed as is with the argument string.  If an attacker can register a tool, they can trigger arbitrary code. | No input sanitisation; only JSON validity is checked. | *No safe fix* in a public library – add a comment that tools are untrusted and require admin approval.  Optionally add a whitelist or sandbox (e.g., `runuser -u sandbox` or `setfattr`) if needed. |
| 2 | **`eval` in `ollama_eval`** | Running user‑generated shell source code can lead to privilege‑escalation or data exfiltration. The script does ask for confirmation, but a malicious user could still bypass by invoking the script with `-e`. | Prompt + sandboxed `env -i` run (when Y/N). | Disable `/eval` in a non‑interactive environment or require a separate “unsafe” flag. Consider running the entire function in a distinct user namespace (e.g., `sudo -u nobody`). |
| 3 | **Sensitive data exposure via debug logging** | `OLLAMA_LIB_DEBUG` prints command arguments, API responses, and JSON payloads.  These may contain the API key or other secrets. | `_redact` removes `OLLAMA_LIB_TURBO_KEY`.  However other env vars (`OLLAMA_HOST`, `OLLAMA_AUTH`, etc.) are not redacted. | Extend `_redact` to mask any variable that contains `KEY`, `TOKEN`, `AUTH`, etc. or provide a global `REDACT_PATTERNS` array.  Alternatively, avoid logging entire payloads. |
| 4 | **Unvalidated user-supplied `tool_args_str`** | In `ollama_tools_run`, the `tool_args_str` is passed as a single positional param to the tool command.  If it contains spaces or special characters, it will be interpreted literally by the command, potentially producing unexpected behaviour. | JSON validation ensures it is a string, but not that it is safe. | Use `jq -r` to extract individual arguments and pass them as separate array elements.  Or, require that tools accept a JSON object and parse it internally. |
| 5 | **Risk of `curl` failure to respect user proxy settings** | The script ignores `$http_proxy`, `$https_proxy`, `curl`’s `--proxy` option, so proxy configuration may leak or block traffic. | None. | Respect proxy variables or provide a wrapper function for `curl`. |
| 6 | **Unbounded length of debug or error messages** | Functions like `_debug` print raw arguments from `$1`.  If these arguments are very large (e.g., a huge JSON payload), it could consume disk space or expose memory contents. | None specific. | Truncate or stream debugging output, e.g., `printf '%s' "${1:0:400}"`. |
| 7 | **Potential race condition on random model selection** | `ollama_model_random` uses `shuf -n1` which may be non‑re‑entrant if concurrent writers exist. | Low risk on typical single‑user use. | Use `jq -s -f` to pick a random element, or write a small safe `printf` pipeline with `shuf`. |
| 8 | **Missing `set -eu`** | The script uses `set -o pipefail` but not `set -euo pipefail`.  A typo or missing command might silently fail and cause downstream insecure behavior. | Most functions check exit status explicitly. | Optionally add `set -euo pipefail` in a dedicated `init` function, but keep it optional for scripts to override. |
| 9 | **Global variable manipulation** | Functions modify global arrays (`OLLAMA_LIB_MESSAGES`, `OLLAMA_LIB_TOOLS_*`).  Concurrent sources may lead to unexpected state. | Not a security risk per se. | Expose setter/getter helpers and document that the library is not thread‑safe. |
|10 | **Dependency on third‑party binaries** | `jq`, `curl`, `ollama` and sometimes `shuf`, `awk`, `sed` are assumed present.  A missing binary could cause the script to behave unpredictably. | Functions check existence for some (`_exists`). | Provide early fail checks in an `init` function that validates all required binaries. |

---

## 3. Safe Mode (`OLLAMA_LIB_SAFE_MODE`)

* `safe mode` disables `_debug`, `_ollama_eval` and `_debug` if the flag is set.  
* It **does not** prevent malicious users from registering tools or executing `eval` with `-e`.  
* Safe mode is a useful hygiene toggle but must be combined with other mitigations.

---

## 4. Input Validation & Sanitisation

| Function | Validation |
|----------|------------|
| `_is_valid_url` | Very permissive regex; does not check scheme after `://`. |
| `ollama_list`, `ollama_show`, others | Check that argument length is 1 and matches known flag (`-h`) otherwise error. |
| `_is_valid_json` | Uses `jq -e '.'` which rejects empty string, `false`, `null`. |
| `_is_valid_model` | Regex accepts `a-zA-Z0-9._:/-`. No check for path traversal or length exceeding limits. |

**Recommendation**: For user‑supplied model names, add a stricter whitelist or enforce a length limit (e.g., ≤127 chars).

---

## 5. Command Execution

* All external calls (`curl`, `jq`, `ollama`) are *parameterised* – no shell string interpolation that could be interpreted by `/bin/sh`.  
* `ollama_eval` is the *only* place where Bash’s `eval` is used intentionally; it is documented and requires user confirmation.  
* `ollama_tools_run` passes user data directly to the tool command.  Provide documentation that tool authors must ensure safety.

---

## 6. Sensitive Data Handling

* `OLLAMA_LIB_TURBO_KEY` is redacted in `_redact`.  
* `OLLAMA_HOST` and other env vars are *not* redacted – they could expose IP addresses or endpoints.  
* `ollama_app_vars` prints many env vars, but also redacts those containing `AUTH`, `TOKEN`, `KEY`.  

**Recommendation**:  
1. Add a function `_mask_secret "value"` that replaces any whitespace‑separated token with `[REDACTED]`.  
2. Apply it to any `printf` that spills out secrets such as `OLLAMA_LIB_TURBO_KEY`, `OLLAMA_AUTH`, `OLLAMA_HOST` (if it contains an API token).  
3. When writing to logs, avoid storing the content of `curl` responses to files.

---

## 7. Environmental Security

* The library explicitly sets `env -i` for sandboxed eval runs to limit the environment exposure.  
* No attempt to drop to a non‑privileged user is made; if the script runs as `root`, all commands (including tool commands) inherit that privilege.  

**Recommendation**:  
* Encourage users to source this library inside a restricted shell or container.  
* For production usage, require that `ollama_*` tool commands are executed with a unprivileged user (e.g., via `sudo -u nobody`).  

---

## 8. Audibility & Logging

* Debug output goes to `stderr` and can be captured.  
* Error messages include the redacted string.  
* No user‑supplied data is logged except via the debug functions—controlled by `OLLAMA_LIB_DEBUG`.

---

## 9. Recommendations

| Item | Action |
|------|--------|
| 1 | **Extend `_redact`** to mask any sensitive env vars (e.g., `OLLAMA_AUTH`, `OLLAMA_HOST`). |
| 2 | **Guard `ollama_eval`**: make the `eval` branch optional via an env flag (`ALLOW_EVAL=0`). |
| 3 | **Sanitise tool arguments**: split JSON array into arguments before executing. |
| 4 | **Validate URLs stricter**: require scheme and disallow protocols like `file:` or `ftp:` if not needed. |
| 5 | **Install a pre‑flight check**: a `ollama_init()` function that verifies `curl`, `jq`, `ollama`, `sh`, `awk`, `sed`, and `shuf`. |
| 6 | **Limit debug trace length**: truncate long payloads to e.g., 512 bytes. |
| 7 | **Add an audit‑log** option: prepend timestamp and redact secrets to a file (`lib.log`).  Keep it optional. |
| 8 | **Namespace commands**: prefix all exported functions with a strict namespace (`ollama_*`) to avoid collision. |
| 9 | **Document the library’s security stance** in a README – emphasize that it’s not sandboxed and that tools can run arbitrary code. |
|10 | **Consider a sandboxed execution path** for tool commands – e.g., `docker run --rm -e` or `chroot`. |

---

## 10. Quick Audit Checklist

- [ ] All external commands invoked via arrays (no `eval` except `ollama_eval` and `ollama_tools_run`).  
- [ ] JSON payloads validated with `jq`.  
- [ ] Sensitive env vars partially redacted.  
- [ ] `OLLAMA_LIB_SAFE_MODE` toggles debugging & eval.  
- [ ] Input validation for URLs and model names is present.  
- [ ] No shell injection via `${1:0:42}` or similar.  
- [ ] Bash 3.2 compatibility – uses only features available in that version.  
- [ ] The script handles missing `jq`/`curl` gracefully.  

---

## 11. Conclusion

The **Ollama Bash Library** demonstrates good defensive coding practices:

* **Safe input handling** for URLs, JSON, and command arguments.  
* **Controlled debug output** with partial redaction.  
* **Safe mode** that disables sensitive features.  
* **Explicit error handling** after each external call.

The primary security concerns arise from **user‑defined tools** and the **`eval`** path. These are intentional features but should be clearly documented as *high‑risk* and only used in trusted contexts. With the recommendations above, the library can safely be included in production scripts, especially when paired with a container or isolated execution environment.

Feel free to adapt the audit or add any additional checks specific to your deployment.
