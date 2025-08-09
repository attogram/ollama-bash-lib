# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.41


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
*Version: 0.42.41*  
*Target interpreter: Bash ≥ 3.2*  

---

## 1. Executive Summary  

| Aspect | Rating (1‑5) | Comments |
|--------|--------------|----------|
| **Correctness for Bash 3.2** | **4** | Most constructs (arrays, `local`, `[[ … ]]`) are supported, but a few Bash‑4‑only features are used (`declare -g`, `printf -v`, `mapfile`, `**` globstar not present). The library will run on Bash 3.2, but some edge‑cases (e.g., associative arrays) are absent – the script already avoids them, so compatibility is acceptable. |
| **Input Validation & Sanitisation** | **3** | JSON payloads are built with `jq`, which is safe, but many user‑supplied strings are interpolated directly into URLs, file names, and command lines without validation (e.g., `ollama_api_get "$endpoint"`). |
| **Command Injection** | **2** | The `ollama_eval` function uses `eval "$cmd"` on data returned from the model. This is a **high‑risk** vector: a compromised or malicious model response can execute arbitrary commands on the host. |
| **Credential Handling** | **2** | The Turbo API key is stored in an environment variable (`OLLAMA_LIB_TURBO_KEY`). Environment variables are visible to any child process (including `ps` on some systems) and may be logged inadvertently. |
| **Debug / Logging** | **2** | Debug output is printed to **stderr** and may contain sensitive data (full JSON payloads, API keys, URLs). When `OLLAMA_LIB_DEBUG=1` in production this can lead to credential leakage. |
| **Error Handling** | **3** | Errors are reported, but the script often continues execution after a failed curl request (e.g., downstream `jq` runs on empty data). |
| **Dependency Management** | **3** | The script assumes the presence of `curl`, `jq`, `ollama`, `bash` and optionally `column`. No checks for minimum versions or for safe fall‑backs. |
| **Overall Security Posture** | **2.5 / 5** | The library is functional but contains several high‑impact issues (eval, credential leakage, insufficient input sanitisation). It is **not safe for untrusted input** or production environments without hardening. |

---

## 2. Detailed Findings  

### 2.1 Compatibility with Bash 3.2  

| Construct | Bash 3.2 Support | Observation |
|-----------|------------------|-------------|
| Arrays (`array=()`, `array+=()`) | ✅ | Supported. |
| `local` in functions | ✅ | Supported. |
| `[[ … ]]` tests | ✅ | Supported. |
| `${#var}` length expansion | ✅ | Supported. |
| `${RANDOM%${#array[@]}}` modulo operation | ✅ | Supported. |
| **Missing**: associative arrays, `declare -g`, `printf -v` – not used, so OK. |
| **Potential Issue**: `read -r -s` works, but Bash 3.2 may not support `-s` in some minimal builds; a fallback could be added. |

> **Recommendation** – Add a sanity check at the top of the script:

```bash
# Ensure we are running on Bash >= 3.2
if (( BASH_VERSINFO[0] < 3 )) || { (( BASH_VERSINFO[0] == 3 )) && (( BASH_VERSINFO[1] < 2 )); then
    echo "Ollama Bash Lib requires Bash 3.2 or later." >&2
    exit 1
fi
```

---

### 2.2 Input Validation & Sanitisation  

| Function | Input | Validation | Issue |
|----------|-------|------------|-------|
| `ollama_api_get`, `ollama_api_post` | `$1` endpoint path (e.g., `/api/chat`) | None | If a caller supplies a path containing spaces, newlines or `..` it could be interpreted as an unexpected URL. |
| `ollama_generate_json`, `ollama_chat_json` | Model name `$1`, user prompt `$2` | No validation on the *model* string. Model names may contain characters that break the HTTP request (e.g., `?`, `&`, spaces). |
| `ollama_eval` | `$1` task, `$2` model (optional) | No validation. | The task string is later interpolated into a prompt sent to the model; while JSON building is safe, the *result* is executed with `eval`. |
| `ollama_app_turbo` | `$1` mode (`on`/`off`) | Simple case‑matching – safe. |
| `ollama_model_unload` | Model name `$1` | No validation. |

**Impact** – An attacker controlling any of those arguments could cause malformed requests, information leakage (via error messages), or in worst case influence the content that is passed to `eval`.

**Recommendation**  

* Add a generic validator for model names and endpoint strings, e.g.:

```bash
_is_valid_model_name() {
    [[ $1 =~ ^[a-zA-Z0-9._-]+$ ]]
}
```

* Reject or escape any characters that are not allowed before constructing URLs or JSON.

---

### 2.3 Command Injection  

**Critical Issue – `ollama_eval`**  

```bash
cmd="$(ollama_generate "$model" "$prompt")"
...
eval "$cmd"
```

* The model’s response is taken verbatim and executed in the caller’s shell.  
* If the model (or an attacker feeding a crafted prompt) returns a malicious payload such as `rm -rf /; echo hacked`, the script will execute it with the privileges of the user running the script.  

**Mitigations**  

1. **Never use `eval` on external data**. Instead, treat the response as plain text and run it via a safer mechanism (e.g., `bash -c` with strict `set -euo pipefail` and proper quoting), or better yet, **require explicit confirmation** and display the command before execution (already done) **but still avoid eval**.  

2. If execution is absolutely required, run the command in a **restricted subshell** using `bash -r` (restricted mode) or Docker/Firejail sandbox.  

3. At minimum, **sanitize** the response:

```bash
# Allow only a whitelist of safe characters (letters, digits, spaces, ./_-)
if [[ $cmd =~ ^[[:alnum:]_./\ -]+$ ]]; then
    eval "$cmd"
else
    _error "ollama_eval: command contains disallowed characters"
    return 1
fi
```

---

### 2.4 Credential / Secret Management  

* Turbo API key (`OLLAMA_LIB_TURBO_KEY`) is stored in an environment variable. This is inherited by **all child processes**, which may leak via:

  * `ps -ef` (on some platforms, the environment is visible).  
  * Core dumps.  
  * Logging of child processes that inadvertently echo their environment.

* The key is also echoed in debug output (`_debug "OLLAMA_LIB_TURBO_KEY: (${#OLLAMA_LIB_TURBO_KEY} characters)"`).  

**Recommendations**

1. Store the key in a **file with restrictive permissions** (`chmod 600`) and read it only when needed.  

2. Zero out the variable after use:

```bash
local api_key
read -r -s api_key
export OLLAMA_LIB_TURBO_KEY="$api_key"
...
# After the request:
unset OLLAMA_LIB_TURBO_KEY
```

3. Disable debug output in production (`OLLAMA_LIB_DEBUG=0`) or strip any line that prints the key.

---

### 2.5 Debug Logging  

* The `_debug` function prints JSON payloads, URLs, and the length of the API key.  

* When `OLLAMA_LIB_DEBUG=1`, these messages can be captured in log files or terminal histories, leaking potentially sensitive data.  

**Mitigation** –  

* Redact sensitive fields before logging (`jq 'del(.model, .prompt, .api_key)'`).  
* Provide a separate “safe debug” mode that omits payload contents.  

Example:

```bash
_debug() {
  (( OLLAMA_LIB_DEBUG )) || return
  local prefix="[DEBUG] $(date '+%H:%M:%S')"
  # Redact API key if present
  local msg="${1//${OLLAMA_LIB_TURBO_KEY}/<REDACTED>}"
  printf "%s: %s\n" "$prefix" "$msg" >&2
}
```

---

### 2.6 External Command Usage  

| Command | Safety Considerations |
|--------|-----------------------|
| `curl` | Uses `-f` (fail on HTTP errors) and `-sN`. The payload is sent via stdin (`-d @-`). This is generally safe, but the **command line** includes the full URL (`${OLLAMA_LIB_API}${endpoint}`) which may contain untrusted data. |
| `jq` | Relies on correct JSON. No version check – older `jq` may lack `-e` or `-r` behaviours. |
| `read -r -s` | On very old Bash (pre‑3.2) `-s` may not exist; script would fail. |
| `eval` | Already flagged. |
| `ps`, `ps aux` | Not used, but environment leakage was discussed. |
| `column` | Optional for formatting; missing it only degrades output. |

**General Recommendation** – Verify command existence before use (already done for most) **and** check versions where relevant (e.g., `jq --version | cut -d. -f1-2`).

---

### 2.7 Error Handling  

* Many functions call `_call_curl` and then immediately test `$?`. If curl fails, subsequent pipelines (`jq`, `printf`) may still be executed on empty strings, producing confusing error messages.  

* Functions often return `1` for any error, losing granularity (e.g., network vs. JSON parse vs. API‑level error).  

**Improvements**

1. Use a **centralised error handling** function that captures the error source and returns a distinct exit code.  

2. Adopt `set -euo pipefail` **in a subshell** for internal helper functions to abort on any failure, then trap the status to translate it to library‑specific codes.

Example wrapper:

```bash
_with_error_handling() {
    set -euo pipefail
    "$@"
}
# Usage:
_with_error_handling ollama_api_get '/api/version'
```

---

### 2.8 Dependency & Environment Checks  

* `_exists` checks for command presence but does not verify that the tool is **trusted** (e.g., an attacker could put a malicious `curl` earlier in `$PATH`).  

* No verification that required environment variables (`OLLAMA_HOST`, etc.) are set to safe values.  

**Recommendation** – Perform a **sanity check** at library load:

```bash
_required_commands="curl jq"
for cmd in $_required_commands; do
    if ! _exists "$cmd"; then
        _error "Required command '$cmd' not found in PATH."
        return 1
    fi
done
```

Consider allowing the user to specify a **whitelisted PATH** or use absolute paths (e.g., `$(command -v curl)`).

---

## 3. Recommendations & Hardening Checklist  

| # | Action | Rationale |
|---|--------|-----------|
| 1 | **Remove or sandbox `eval`** in `ollama_eval`. | Prevent remote code execution. |
| 2 | **Redact secrets** in debug output and avoid storing API keys in env vars. | Mitigate credential leakage. |
| 3 | **Validate all external inputs** (model names, endpoints, user‑supplied strings). | Stop malformed URLs and injection. |
| 4 | **Add Bash version guard** at top of script. | Ensure minimum feature set. |
| 5 | **Zero‑out sensitive variables** after use (`unset OLLAMA_LIB_TURBO_KEY`). | Reduce process‑environment exposure. |
| 6 | **Implement whitelist‑based command execution** when running generated code (e.g., allow only `cat`, `grep`, `awk`…). | Limit damage if a generated command is executed. |
| 7 | **Centralise error handling** with distinct exit codes. | Easier auditing and logging. |
| 8 | **Check versions of `jq` and `curl`** for needed flags (`-e`, `-f`). | Prevent runtime failures on older systems. |
| 9 | **Avoid exporting large amounts of library state** (e.g., `OLLAMA_LIB_MESSAGES`) unless needed. | Reduce attack surface. |
|10| **Document security‑related environment variables** (e.g., `OLLAMA_LIB_DEBUG=0` for production). | Encourage secure defaults. |

---

## 4. Sample Hardened Snippets  

### 4.1 Safe `ollama_eval` (no `eval`)

```bash
ollama_eval() {
    _debug "ollama_eval: task='$1' model='$2'"
    local task="$1"
    local model="${2:-$(ollama_model_random)}"
    local prompt='Write a bash one‑liner ...'   # unchanged

    local cmd
    cmd="$(ollama_generate "$model" "$prompt")"

    # Basic whitelist: allow only characters that are safe in a simple one‑liner
    if [[ ! $cmd =~ ^[[:alnum:]_./\ -]+$ ]]; then
        _error "Generated command contains unsafe characters"
        return 1
    fi

    printf 'Command:\n\n%s\n\nRun command (y/n)? ' "$cmd"
    read -r permission
    if [[ $permission == y ]]; then
        # Execute in a restricted subshell (no eval)
        bash -c "$cmd"
        return $?
    fi
    return 0
}
```

### 4.2 Redacted Debug

```bash
_debug() {
    (( OLLAMA_LIB_DEBUG )) || return
    local ts
    ts=$(date '+%H:%M:%S')
    local msg="${1//${OLLAMA_LIB_TURBO_KEY}/<REDACTED>}"
    printf "[DEBUG] %s: %s\n" "$ts" "$msg" >&2
}
```

### 4.3 Input Validation Helper

```bash
_is_valid_model_name() {
    [[ $1 =~ ^[a-zA-Z0-9._-]+$ ]]
}
```

Use it before any API call that receives a model name.

---

## 5. Conclusion  

The **Ollama Bash Lib** provides a convenient wrapper around the Ollama HTTP API, but the current implementation contains several security weaknesses that could lead to privilege escalation, credential exposure, and remote code execution—especially the use of `eval` on untrusted model output.  

By applying the mitigations above—**removing `eval`, sanitising inputs, protecting secrets, tightening debug logging, and adding robust error handling**—the library can be made suitable for production use and for environments where untrusted data may be processed.

---

*Prepared by:*  
**[Your Name], Expert Security Professional**  
*Date: 2025‑08‑09*  
