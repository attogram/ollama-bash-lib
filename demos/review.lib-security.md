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
# Security Review – Ollama Bash‑Lib
*Author: Expert Security Professional*  
*Target environment: Bash **v3.2+** (macOS / Linux)*  

---

## Executive Summary

The **Ollama Bash‑Lib** is a fairly feature‑rich library for interacting with the Ollama API, providing high‑level wrappers for most common workflows (models, lists, chats, generation, etc.).  

While the code is clean, well commented and mostly safe, it does contain several **security‑related weaknesses** that could be exploited when:

1. The library is run by an attacker, or,
2. An unauthenticated user supplies arbitrary inputs.

Below is a systematic assessment and actionable recommendations for each class of risk.

---

## Table of Contents
1. [Input Validation](#input-validation)  
2. [Command Injection / Eval](#command-injection--eval)  
3. [Secrets & Sensitive Data](#secrets--sensitive-data)  
4. [Sanitizing / Redacting](#sanitizing--redacting)  
5. [External Dependencies & Environment](#external-dependencies--environment)  
6. [Handling of Untrusted Data & Error Paths](#handling-of-untrusted-data--error-paths)  
7. [Portability / Bash‑3.2 Compatibility](#portability--bash-32-compatibility)  
8. [Recommendations & Mitigations](#recommendations--mitigations)  
9. [Checklist](#checklist)

---

## 1. Input Validation

| Function | Issue | Impact | Mitigation |
|----------|-------|--------|------------|
| `_is_valid_model()` | Regex `^[a-zA-Z0-9._:-]+$` accepts an empty string (handled later) and a range `a-z` is fine, but the hyphen is treated as *range* because it is not escaped. | Acceptable in this context; only a small risk of an unintended range in future edits. | Escape the hyphen: `^[a-zA-Z0-9._:-]+$` → `^[a-zA-Z0-9._: -]+$` or more explicitly `^[a-zA-Z0-9._:\\-]+$`. |
| `ollama_messages_add()` | Accepts arbitrary content for the `content` field, then uses `jq`. `jq` will safely encode it, but if content contains newline it can break the message array formatting. | Minor: message array may become broken JSON if multiline content is used. | Trim or escape newlines (`tr '\n' ' '`), or accept only single‑line messages. |
| `ollama_app_turbo()` | `OLLAMA_HOST` and `OLLAMA_LIB_API` can be set by the user to arbitrary URLs (including HTTPS or any IP). | **Information leakage / redirect** – malicious user could make API calls to a third‑party endpoint. | Validate scheme (`^https?://`) and, optionally, restrict to localhost or a whitelist of domains. |
| `ollama_eval()` | No validation of the user’s chosen `model` beyond `_is_valid_model`. The model name is embedded verbatim into a JSON payload. | Not a direct injection risk, but an attacker could supply a model that behaves maliciously. | Keep strict whitelist or allow user explicitly to enable only safe “demo” models. |
| `ollama_generate*()` | `model` and `prompt` arguments are passed directly into JSON without further sanitisation. Since `jq` handles them, injection is unlikely. | No additional risk. | Verify prompt length to avoid DoS. |

---

## 2. Command Injection / Eval

| Function | Issue | Impact | Mitigation |
|----------|-------|--------|------------|
| `ollama_eval()` | Executes `${cmd}` unsafely via `eval`. Even after a regex filter for “dangerous” tokens, the current regex logic is flawed – `\b` is not a word‑boundary in Bash BREs, and the final regex may match literally or not at all. Consequently, the filter has **no real effect**. | Any model output can run arbitrary shell code, including `rm -rf /`, network exfiltration, or privilege escalation if the script runs as an administrator. | **Never use `eval` on untrusted data.** Instead: <br>- Use `[["$cmd" =~ ^[a-zA-Z0-9/_.-]+$]]` to whitelist strictly or <br>- Echo the command to the user, and if approved, use `bash -c "$cmd"`. <br>- Alternatively, run the command in a restricted sandbox (chroot, Docker, `noexec` mount). |
| `ollama_app_turbo()` | The user is prompted to enter a secret key via a silent read; however, this key is never exported, so it is **not** exposed to child processes. This is good. | No immediate risk. | None. |
| `ollama_list_array()` / others | Use `read -r line` correctly. No injection. | – | – |

**Overall:** `ollama_eval` is the primary security flaw. Even the confirmation prompt (`Run command (y/N)?`) can be bypassed accidentally or maliciously, so the library must enforce a hardened execution path.

---

## 3. Secrets & Sensitive Data

| Function | Issue | Impact | Mitigation |
|----------|-------|--------|------------|
| `_redact()` | Only redacts `${OLLAMA_LIB_TURBO_KEY}` substring. If the key appears in a larger string, other partial secrets could leak (e.g., environment strings). | Log or debug output could leak parts of the API key. | Use full string comparison: `if [[ "$msg" == *"$OLLAMA_LIB_TURBO_KEY"* ]]; then` or apply `sed 's|${OLLAMA_LIB_TURBO_KEY}|[REDACTED]|g'` to `printf`. |
| All `_debug`/`_error` functions | Output *full* messages to `stderr`. These messages can contain IPs or other system details, which might be useful to an attacker. | Information disclosure. | Suppress or mask such details in production; add a flag to disable debug output entirely. |
| `OLLAMA_LIB_TURBO_KEY` | Stored in a shell variable without `export`; this limits leakage, but the user can still view it via `echo $OLLAMA_LIB_TURBO_KEY`. | Leakage if the library is loaded into an interactive shell. | Document that the key is visible; optionally provide a function to clear it after use. |
| In `ollama_app_turbo()`, the key is sent as `Header: Authorization: Bearer $key`. Header may be logged by some reverse proxies. | Not a script bug, but network leakage. | Use HTTPS for all API calls (`curl --fail --location --silent --request ... --header="Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}"` with `--tlsv1.2` to enforce secure transport). |

---

## 4. Sanitizing / Redacting

- **Redaction** currently only checks for a specific variable; any other secret environment variables (e.g., `SSH_AUTH_SOCK`, `AWS_SECRET_ACCESS_KEY`) can leak through debug output.  
- **Sanitizing user input** for commands: No validation for shell metacharacters, thus a model could inject semicolons, backticks, or `$(...)`.  
- **Logging**: All debug statements use `printf` which respects `%s`; still, any shell metacharacter inside the debug string might affect how the debug output is parsed by a human or log analyzer.  

**Recommendation:** Add a generic redaction helper that scans for all private env vars and removes them from any string output to `stderr`.

---

## 5. External Dependencies & Environment

| Dependency | Status | Potential Risk | Mitigation |
|------------|--------|----------------|------------|
| `curl` | Required for HTTP calls. | **Version mismatch** or `curl` misconfigured (e.g., with `-s -f`). | Verify output of `curl --version` at startup; enforce minimum version. |
| `jq` | Required for JSON manipulation. | **Untrusted JSON parsing** – but jq is safe; ensure you use `-r` where needed. | Check jq version; warn if version < 1.5. |
| `ollama` binary | Required for various functions. | If attacker replaces the binary with a malicious tool, all functions break. | Verify checksums or path security (`/usr/local/bin/ollama`). |
| `awk`, `shuf`, `sort`, `head`, `tail`, `sed`, `timeout` | Optional; used in a few places. | If `PATH` is compromised, you could run malicious replacements. | Sanitize `PATH` early or use absolute paths. |
| **Environment variables** (`OLLAMA_HOST`, `OLLAMA_AUTH`, `OLLAMA_TURBO_KEY`, etc.) | Mutable by user. | Setting a malicious value can affect script’s behavior. | Add sanity checks; optionally provide a “safe mode” to override defaults. |

---

## 6. Handling of Untrusted Data & Error Paths

| Function | Flaw | Outcome | Recommendation |
|----------|------|---------|----------------|
| `_call_curl()` | Uses `-f` but still prints error output via `curl`'s stderr. If a server returns a custom error page containing secrets, the user might see it. | **Leak of potential sensitive info** | Capture stderr to a temp file, check exit code, then pipe error to log only; not echo to user. |
| `_is_valid_json()` | Returns 0 for any truthy JSON, including an empty array or object. | Might mask real errors (e.g., model returns `[{"error":"bad prompt"}]`). | Add JSON schema validation for specific API responses. |
| `ollama_lib_about()` | Calls `compgen` and `column`. If `column` fails, you print functions unsorted. | Minor formatting issue, no security impact. | Wrap these in `||true` as a fallback. |
| `ollama_eval()` | If `timeout 1 bash -n <<<"$cmd"` takes > 1s, the timeout will return non‑zero, causing a false fail. | User may be prevented from running legitimate commands. | Reduce timeout or remove the syntax check; or use `bash -n` without timeout. |
| `ollama_list_array()` | Uses `awk` and `sort`. If input has very long lines, it may consume memory. | DOS by memory exhaustion. | Enforce a maximum line length; or stream with `head -n`. |

---

## 7. Portability / Bash‑3.2 Compatibility

- The script relies on **`[[`**, **parameter expansion with `${var:-default}`**, **`local`** in functions, and **`printf`** – all available in Bash 3.2.
- Uses `IFS=` and `read -r` correctly.
- The only non‑portable feature is the *newline expansion* in `ollama_eval()` when echoing `cmd` back. Bash 3.2 supports this.
- Functions like `timeout` are **Linux‑specific**; macOS (`timeout` is not installed by default). The script will fail if `timeout` is absent.  
  **Recommendation:** Detect absence of `timeout` and either bypass the syntax check or fall back to `sleep 1` or an alternative.  

- **Set -e** is not used, which is safe because the script handles errors manually.

Overall, the script should run on Bash 3.2+ with the noted adjustments.

---

## 8. Recommendations & Mitigations

| Area | Specific Fixes | Why? |
|------|----------------|------|
| **Eval** | Replace `eval "$cmd"` with `printf '%s\n' "$cmd"`. If user approves, run `bash -c "$cmd"` *in a sandbox* (e.g., `sudo -u nobody bash -c "$cmd"`). | Prevent arbitrary code execution. |
| **Regex** | Update dangerous regex to a proper ERE with word boundaries: `[\b]*`. Use `[[ "$cmd" =~ (^|[[:space:]])(${dangerous[*]})($|[[:space:]]) ]]`. | Accurate detection of dangerous tokens. |
| **Redaction** | Extend `_redact()` to iterate over a list of known secret variables, e.g., `for var in OLLAMA_LIB_TURBO_KEY OLLAMA_AUTH; do ... done`. | Avoid leaking any secrets. |
| **Environment Sanitisation** | Sanity‑check `OLLAMA_HOST` for `^https?://` and reject non‑local or blacklisted hosts. | Prevent accidental outbound connections. |
| **Dependencies** | Verify the presence and version of `curl`, `jq`, and `ollama` at startup; abort if not found. | Guard against malicious replacements. |
| **Error Logging** | Capture `curl` stderr to a tempfile and log only the exit code; do not echo raw server response to user. | Avoid accidental disclosure of server secrets. |
| **Timeout** | Use `command -v timeout >/dev/null || bash -c 'sleep 1'` as fallback; or eliminate the timeout entirely for syntax checks. | Avoid accidental failure on systems lacking `timeout`. |
| **Input Length Checks** | Limit prompt length (`[[ ${#prompt} -lt 2048 ]]`) to mitigate DOS. | Protect against memory exhaustion. |
| **Code Review** | Add automated linting (shellcheck, shfmt) in CI pipeline. | Catch stray unquoted variables or missing error checks. |
| **Unit Tests** | Add tests for each public function using a dummy Ollama API endpoint. | Ensure changes preserve functionality. |

---

## 9. Checklist

> **☑** Ensure `eval` is removed or sandboxed.  
> **☑** Replace the dangerous regex with a robust implementation.  
> **☑** Expand redaction to all confidential env vars.  
> **☑** Validate `OLLAMA_HOST` and restrict to safe domains.  
> **☑** Verify external tools (`curl`, `jq`, `ollama`) exist and are correct version.  
> **☑** Restrict debug output or disable in production.  
> **☑** Add a check for `timeout` utility; provide fallback.  
> **☑** Add length limits on prompts and input strings.  
> **☑** Run `shellcheck` and add CI linting step.  
> **☑** Unit‑test all public exports against a mock server.  

Once the above changes are incorporated, the library will be significantly more secure while still remaining compatible with Bash 3.2+.
