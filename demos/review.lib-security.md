# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.0


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Security Review of the **Ollama Bash Lib** Script  
*(Target Bash v3.2 or higher)*  

> **TL;DR**  
> The library is largely safe, but a few areas can be tightened:  
> * a regex‑based “dangerous command” detector that does not work on many platforms,  
> * blind use of `eval` for user‑generated code,  
> * possible leakage of the API key when the script is sourced from an interactive session,  
> * unvalidated external host URLs,  
> * optional debug output that may expose prompts and other secrets.  

Below is a detailed, actionable review grouped into categories of concern.

---

## 1. Overview

| Feature | Current Status | Potential Risk |
|---------|---------------|----------------|
| API Key handling | Stored in `$OLLAMA_LIB_TURBO_KEY` (local variable) | Key is never exported, but any `export` to a subshell could leak it. |
| Debug logging | Controlled by `$OLLAMA_LIB_DEBUG` | Prompts (sensitive text) are logged when debug is enabled. |
| Input validation | `model` names validated with regex | URL, endpoint, and prompt strings are largely unchecked. |
| External commands | Requires `curl`, `jq`, `ollama`, `awk`, `head`, `sort`, `sed` | Missing binaries cause silent failures or undefined behavior. |
| Command injection | Uses `eval` on user‑generated shell code | Can execute arbitrary commands. |
| Regex‑based safety check | Matches “dangerous” token list | Relies on unsupported `\b`, `\s` syntax; may miss or mismatch. |
| Bash version | Uses features available in 3.2+ | Portable but not fully “strict mode”. |

---

## 2. Sensitive Data Handling

| Area | Observation | Recommendation |
|------|-------------|----------------|
| **API key** | Stored only in memory; never exported. | *Good.* Add a comment for maintainers: "Key is intentionally not exported to prevent inadvertent leakage to child processes." |
| **Debug logs** | `_debug` outputs the *entire* prompt, which may include secrets or personal data. | Disable debug in production or filter prompts before logging. Consider a new env var `OLLAMA_LIB_DEBUG_LEVEL` with “0=none,1=normal,2=full” and drop prompts at level 1. |
| **Redaction** | `_redact` replaces occurrences of `$OLLAMA_LIB_TURBO_KEY` with `[REDACTED]`. | Extend redaction to cover `$OLLAMA_HOST` if it might contain a token; otherwise leave as is. |

---

## 3. Input Validation

| Function | Validated Input | Issues | Fixes |
|----------|-----------------|--------|-------|
| `_is_valid_model` | Model name | Regex is fine, but it allows any combination of the listed characters, including `:` which can be used to inject a URL path segment. | Consider tightening to `[a-zA-Z0-9._-]+` or explicitly reject `:`. |
| Any *endpoint* (`ollama_api_get`, `ollama_api_post`) | User passes arbitrary endpoint strings | No host‑validation. Attackers could craft `../` to target other server endpoints or cause DNS rebinding if the host can be set through env. | Validate that `endpoint` starts with `/`. Store a whitelist of allowed endpoints or check against this list. |
| `ollama_generate` etc. | Prompt contains user text | A prompt is passed to the AI model; it is not sanitized. This is expected. | No change needed. |
| `ollama_eval` | `$task` | Passed to the AI; the AI may output shell code. No direct injection here. | Validate that the generated command does not contain dangerous words (see next section). |

---

## 4. External Command Usage

| Command | Status | Notes / Fixes |
|---------|--------|--------------|
| `curl` | Required | `_call_curl` checks if `curl` exists; however, no *strict* error handling. | Use `command -v` check at library load and exit with an informative error if missing. |
| `jq` | Required for JSON | `_is_valid_json` does not handle missing `jq`; any failure will silently surface in calling functions. | Add a preprocessor check for `jq`, and fail gracefully with a clear message. |
| `ollama` | Required for many APIs | Same as above. | Preload check for `ollama`. |
| `awk`, `head`, `sort`, `sed`, `column` | Optional | Functions call them but silently assume success. | Validate exit status for each; return explicit errors. |
| `read -s` | Safe for key input | Good. |

---

## 5. Command Injection & Eval

The central security weakness is the blind use of `eval` in `ollama_eval` and the regex “dangerous” token scan.

| Problem | Why it matters |
|---------|----------------|
| **Blind `eval`** | The generated command string is executed with `eval "$cmd"`. Even with the token check, many dangerous commands (e.g. `rm -rf /`, `sh`, `bash`, `sudo`) can be constructed and the regex may miss them, especially if they contain characters the regex doesn't catch. |
| **Regex flaw** | The regex `"$dangerous[*]"` uses `\b`, `\s`, and unescaped `|`. Bash does **not** support `\b` and `\s` in its `[[ =~ ... ]]` extended regex. Consequently the detector is ineffective on Bash ≥ 3.2 (which lacks Perl-like syntax). It may also wrongly flag benign tokens. |

### Fixes

1. **Remove `eval`**  
   *Instead of `eval "$cmd"`, use `bash -c "$cmd"` only after thoroughly sanitizing the command.*  
   *Even then, consider not executing arbitrary user‑generated shell code; a safer approach is to return the command string to the caller and let them decide. Or write a minimal parser that only accepts a predefined set of safe commands.*

2. **Improved Dangerous‑Command Detection**  
   ```bash
   local dangerous_regex='(^| )('
   for d in "${dangerous[@]}"; do
     dangerous_regex+="${d}|"
   done
   dangerous_regex=${dangerous_regex%|} # remove trailing |
   dangerous_regex+=')( |$)'
   if [[ "$cmd" =~ $dangerous_regex ]]; then
     ...
   fi
   ```
   *Use Bash word boundaries `(^| )` and `( |$)` instead of `\b`. Escape regex meta‑characters (`*`, `?`, `$`) in the list if they occur.*

3. **Sanitize the generated command**  
   *Strip leading/trailing whitespace, double quotes, and redirection operators to prevent command injection via `eval`.*

4. **Add a safety flag**  
   *Expose an environment variable `OLLAMA_SAFE_EVAL=0/1`. When enabled, skip eval and merely output the command.*

---

## 6. Environmental Context & Host Validation

The script allows the user to override the API host via `OLLAMA_HOST` and `ollama_app_turbo`. This could be abused:

- An attacker could set `OLLAMA_HOST` to a private network service containing a secret or a malicious endpoint, while the API key (stored in `OLLAMA_LIB_TURBO_KEY`) gets sent to it.

### Recommendations

| Fix | Implementation |
|-----|----------------|
| **Restrict `OLLAMA_HOST` to localhost or a safe domain** | Add function `validate_host()` that accepts `$OLLAMA_HOST` and returns an error if it doesn't match `^(http|https)://(localhost|127\.0\.0\.1|ollama\.com)(:?[0-9]+)?$`. |
| **Warn on external host** | If the host is non‑localhost and `OLLAMA_TURBO_MODE` is off (i.e., API key not set), print a warning. |
| **Export only for user scripts** | When the library is sourced, do *not* export `OLLAMA_HOST`; keep it local to the script to avoid leaking to child processes. |

---

## 7. Debugging & Logging

The debug system logs all calls with the prompt and potentially secret data.

| Issue | Fix |
|-------|-----|
| **Unbounded prompt logging** | Add `if (( OLLAMA_LIB_DEBUG >= 2 )); then _debug ...` and only log prompts if debug level is high. |
| **Unfiltered logs in production** | Recommend disabling `OLLAMA_LIB_DEBUG` by default. Provide an environment variable `OLLAMA_LIB_DEBUG=0`. |
| **Potential log file exposure** | Avoid writing logs to `/tmp/...` or any mount with sticky bits; just output to stderr. |

---

## 8. Bash‑Strict Mode & Early Validation

Adding strict mode improves reliability and reduces silent failures, especially in libraries that may be sourced by arbitrary environments.

```bash
# At the very beginning of the library
set -euo pipefail
IFS=$'\n\t'           # Prevent word‑splitting on spaces

# If you want to allow unset variables in specific cases, wrap subshells with
# local -u <var> or use ${var:-default}.
```

> **Note**: Some of the library’s functions deliberately rely on `||` error handling; with `set -e` those need to be wrapped in `if` statements or `|| return`. Make sure no existing function breaks.

---

## 9. Testing & Continuous Integration

| Test | What to validate |
|------|------------------|
| **Unit tests for `_is_valid_json`** | Pass valid/invalid JSON, empty string, very large payloads. |
| **Endpoint validation** | Ensure that endpoints that do not start with `/` are rejected. |
| **Dangerous‑token regex** | Test with `rm -rf /`, `ssh`, `pkill`, `sh`, and with escaped forms. |
| **API key redaction** | Verify that `_debug` or `_error` messages never contain the raw key. |
| **Turbo mode handling** | Confirm that the key is not exported when toggling on/off. |
| **Command execution safety** | Provide a known dangerous command to `ollama_eval`; verify that it is blocked or flagged. |
| **Compatibility** | Run with `bash 3.2` and with newer Bash to confirm syntax is supported. |

CI pipelines should run these tests on each commit.

---

## 10. Summary of Recommendations

| Area | Action |
|------|--------|
| **Dangerous‑command detection** | Replace \b/\s regex with Bash‑safe construction. Optionally drop eval entirely. |
| **Eval usage** | Either refuse to evaluate or add a strict sanitization pass. |
| **Host validation** | Force `OLLAMA_HOST` to an allowed list; warn otherwise. |
| **Debug level** | Add `OLLAMA_LIB_DEBUG_LEVEL` and suppress prompt logs at normal level. |
| **External binary checks** | Perform them at library load and fail with clear messages. |
| **Strict mode** | Add `set -euo pipefail` and adjust functions accordingly. |
| **Unit testing** | Implement tests for core functions, especially edge cases. |
| **Documentation** | Update comments to emphasize security trade‑offs. |

Implementing these changes will make the library robust against common shell‑related vulnerabilities, protect sensitive credentials, and provide clear safety boundaries for users while still enabling the powerful integration with the Ollama API.
