# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.7


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review of **Ollama Bash Lib**  

**Version:** 0.43.7  
**Target Bash version:** ≥ 3.2  

---

## 1. Executive Summary  

The library provides a convenient wrapper around the Ollama HTTP API.  It is **feature‑rich** but contains several security‑relevant patterns that should be hardened before it is used in production or by untrusted users:

| Severity | Issue |
|----------|-------|
| **High** | Un‑controlled `eval` of AI‑generated code (`ollama_eval`). |
| **High** | Potential leakage of the Turbo API key via logs, environment, or process listings. |
| **Medium**| Insufficient sanitisation of user‑supplied data that becomes part of HTTP request paths or JSON bodies. |
| **Medium**| Inconsistent quoting / reliance on Bash 3.2 features that may behave differently on older systems. |
| **Low**   | Weak validation of model names & JSON payloads, and error handling that can expose internal state. |

The remainder of this document details each finding, explains the underlying risk, and proposes concrete mitigations that remain compatible with Bash 3.2.

---

## 2. Threat Model  

| Actor | Goal | Capability |
|-------|------|------------|
| **Malicious user** (local) | Execute arbitrary commands with the privileges of the script runner. | Access to the shell, ability to craft input that ends up in `eval` or HTTP requests. |
| **Network attacker** | Intercept or tamper with API traffic. | Ability to control network path between client and Ollama server (Man‑in‑the‑Middle). |
| **Insider** (devops) | Harvest the Turbo API key or other secrets. | Access to the host where the script is executed, ability to read environment or process list. |

---

## 3. Detailed Findings  

### 3.1. Use of `eval` – **High Risk**

```bash
ollama_eval() {
    …
    eval "$cmd"
}
```

* The function accepts a *generated* command line from the Ollama model, asks the user for confirmation, then executes it with `eval`.  
* `eval` runs the *entire* string as Bash code, meaning any newlines, shell metacharacters, or command substitutions are honoured.  
* Even with a simple “y/N” prompt, an attacker who can influence the model prompt (or who can manipulate the model itself) can cause arbitrary code execution.

**Mitigation**

* Replace `eval` with a **strict whitelist** of allowed commands.  
* Execute the command in a sandboxed environment (e.g., `bash -c "$cmd"` with `set -euo pipefail` and `ulimit` restrictions) or, preferably, use a dedicated container/VM.  
* If the purpose is only to run a *single* external command, split the string on whitespace and use `exec` with an array to avoid word‑splitting and metacharacter interpretation.  
* Record the *exact* command that was executed for audit purposes.

### 3.2. Secret (Turbo API key) Exposure – **High Risk**

* The variable `OLLAMA_LIB_TURBO_KEY` holds a bearer token.  
* It is printed in the debug output (`_debug "OLLAMA_LIB_TURBO_KEY: (${#OLLAMA_LIB_TURBO_KEY} characters)"`) – while the value is not displayed, the **presence** of the variable is logged.  
* The key is stored in plain‑text **environment variables** (`export OLLAMA_HOST`, `export OLLAMA_LIB_API`). On many systems, environment variables are visible to any process belonging to the same user (`ps eww`, `/proc/<pid>/environ`).  

**Mitigation**

* Never export the secret. Keep it in a **shell‑local** variable; pass it to `curl` via a header *directly* (`curl -H "Authorization: Bearer $OLLAMA_LIB_TURBO_KEY"`).  
* Remove/blank the variable after each use (`unset OLLAMA_LIB_TURBO_KEY`).  
* Redact the key in all logs, not only `_redact`. Consider hashing the key before printing its length.  
* Provide an optional “secure mode” that refuses to run unless the key is stored in a dedicated file with restrictive permissions (e.g., `~/.ollama_key`).

### 3.3. Insufficient Input Validation  

| Function | Input | Risk |
|----------|-------|------|
| `_call_curl` | `$endpoint` (2nd argument) | If an attacker controls the endpoint (e.g., `"; rm -rf /;"`), it becomes part of the URL, leading to request smuggling or unintended requests. |
| `ollama_generate_json`, `ollama_chat_json` | Model name, prompt, messages | Model name is validated by `_is_valid_model`, but the **prompt** and **message contents** are passed verbatim to `jq` for JSON creation. If they contain newline‑terminated strings, they may break the JSON payload or trigger jq errors. |
| `ollama_eval` | Prompt built from user‑supplied task (`$1`) | The prompt is concatenated to a multi‑line string without any escaping; it may contain characters that affect the model’s output in unpredictable ways. |

**Mitigation**

* Strictly **whitelist** allowed characters for any string that becomes part of a URL path: `[a-zA-Z0-9._:-]+` (already used for model names). Apply the same rule for other user‑provided strings that become part of paths.  
* Use `printf '%s' "$raw"` and pipe through `jq -Rs` when building JSON from arbitrary strings, guaranteeing proper escaping.  
* Consider rejecting inputs that contain control characters (`$'\n'`, `$'\r'`, `$'\t'`) unless explicitly needed.

### 3.4. Dependency Handling & Error Disclosure  

* Many functions abort with `_error` that prints the **raw error message** (e.g., “jq Not Found”, “curl error: 22”).  
* While helpful for debugging, these messages may reveal the presence/absence of utilities, the exact command line, or internal state to an attacker who can trigger them.  

**Mitigation**

* When `OLLAMA_LIB_DEBUG=0` (default), route errors to **stderr** without additional context, or optionally to a log file that is only readable by the owner.  
* Provide a `--quiet` mode that suppresses all non‑essential output.

### 3.5. Use of `IFS` Without Restoration  

```bash
local IFS='|'
local danger_regex="\b(${dangerous[*]})\b"
if [[ "$cmd" =~ $danger_regex ]]; then …
```

* Changing `IFS` globally (even inside a function) can affect later word splitting in the same shell session.  

**Mitigation**

* Save and restore: `local oldIFS=$IFS; IFS='|'; …; IFS=$oldIFS`.  
* Alternatively, build the regex without relying on `IFS`, e.g., `danger_regex="\b($(printf '%s|' "${dangerous[@]}" | sed 's/|$//'))\b"`.

### 3.6. Compatibility with Bash 3.2  

| Feature | Bash 3.2 Support | Comments |
|---------|----------------|----------|
| Arrays (`ARR=()`, `${ARR[@]}`) | ✅ | Introduced in Bash 2.0. |
| `${var//search/replace}` | ✅ | Available since Bash 3.0. |
| `local -a` (array local) | ❌ (not used) | Good – script avoids it. |
| `printf -v` | ❌ (not used) | Fine. |
| `PIPESTATUS` | ✅ | Present in Bash 2.0+. |
| `[[ ... =~ regex ]]` | ✅ | Available. |
| `${#var}` for string length | ✅ | Available. |
| `read -r -s` (silent) | ✅ | Works. |

Overall the script **runs on Bash 3.2**, but pay attention to the following:

* The `[[ -z "${OLLAMA_LIB_TURBO_KEY}" ]]` test works, but avoid `${#array[@]}` in contexts where Bash 3.2’s `${#array[@]}` returns **length of first element** if the array is not declared (rare). The script declares the array globally, so OK.  
* The `printf '%s' "$json_body" | curl "${curl_args[@]}"` uses process substitution (`< <(…)`) elsewhere, which is supported in Bash 3.2.  

### 3.7. Logging & Redaction  

* `_redact` only replaces the *exact* API key value. If the key appears in a *quoted* form, or with surrounding whitespace, it will not be removed.  
* No hashing or partial masking (e.g., show only first/last 4 characters) – accidental logging of the full key could still happen.

**Mitigation**

* Implement a more robust redaction routine that uses a regular expression to match the key regardless of surrounding characters: `msg=${msg//${OLLAMA_LIB_TURBO_KEY}/[REDACTED]}` is fine for literal matches, but also run `msg=$(echo "$msg" | sed "s/${OLLAMA_LIB_TURBO_KEY}/[REDACTED]/g")`.  
* Consider **never** logging the secret, even in debug mode.

---

## 4. Recommendations (Actionable)

| # | Recommendation | Why / How |
|---|----------------|-----------|
| 1 | **Remove or sandbox `eval`** in `ollama_eval`. Replace with a whitelist or a separate executor (Docker, chroot). | Prevents arbitrary code execution. |
| 2 | **Never export** the Turbo API key. Keep it in a local variable and pass it to `curl` directly. Unset after each request. | Reduces secret exposure via `/proc/*/environ` and `ps`. |
| 3 | **Improve redaction**: centralise logging through a helper that always strips any occurrence of the secret before writing to stdout/stderr. | Avoid accidental leakage in debug logs. |
| 4 | **Validate all user‑supplied strings** that become part of URLs or JSON. Use whitelists for characters and `jq -Rs` for JSON escaping. | Stops request smuggling / malformed JSON attacks. |
| 5 | **Restore `IFS`** after it is temporarily changed. Use a local variable to preserve the original value. | Prevents side‑effects on later word splitting. |
| 6 | **Add a “quiet”/“safe” mode** that suppresses non‑essential output and hides internal errors from the caller. | Limits information disclosure to an attacker. |
| 7 | **Document dependency versions** (curl ≥ 7.30, jq ≥ 1.5) and provide fallback checks that exit cleanly with a user‑friendly message. | Guarantees predictable behaviour on older systems. |
| 8 | **Rate‑limit / timeout network calls** (e.g., `curl --max-time 30`) to avoid DoS if the API endpoint hangs. | Improves resilience. |
| 9 | **Audit the `dangerous` token list** and make it configurable. Consider using `declare -a` and quoting when constructing the regex. | Prevents false positives/negatives when scanning commands. |
|10| **Add unit tests** for each public function, especially those that build JSON payloads and those that parse responses. | Guarantees future changes do not introduce regressions. |

---

## 5. Conclusion  

The **Ollama Bash Lib** is a functional and well‑structured wrapper, but it contains **high‑impact security weaknesses** primarily around the execution of AI‑generated code and handling of sensitive credentials. By applying the mitigations above—especially removing `eval`, protecting the Turbo API key, and tightening input validation—the library can be safely used in environments where Bash 3.2 is the minimum shell version.

--- 

*Prepared by:*  
**Security Analyst – Bash Hardening Specialist**  
*Date:* 2025‑08‑11  

---
