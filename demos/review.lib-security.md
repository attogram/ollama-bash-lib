# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.38


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
*Version: 0.42.38*  
*Target Shell: Bash ≥ 3.2*  

---  

## 1. Overview  

The script is a fairly large Bash library that wraps the Ollama HTTP API (via `curl`) and the local Ollama CLI. It provides helpers for:

* API calls (`ollama_api_*`)  
* Model generation / chat (JSON & streaming)  
* Message queue handling  
* Utility functions (debug, error, existence checks, etc.)  
* “Turbo” mode that injects a bearer token into the `Authorization` header  

All functions are exported as regular Bash functions; a user sources the file and then calls the public `ollama_*` functions.  

The review focuses on **security‑relevant aspects** (input handling, command injection, secret exposure, privilege escalation, external‑dependency trust, error handling, and compatibility with Bash 3.2).  

---  

## 2. Threat Model  

| Actor | Goal | Attack Surface |
|------|------|----------------|
| **Untrusted user** (e.g., a downstream script that sources the lib) | Execute arbitrary commands, read environment, or exfiltrate secrets. | Functions that evaluate data (`eval`), embed user‑supplied strings into `curl`/`jq`, or print secrets. |
| **Network attacker** | Intercept or tamper with API traffic. | Use of HTTP (plain‑text) when `OLLAMA_HOST` is not set to HTTPS; lack of certificate verification. |
| **Malicious dependency** (e.g., compromised `jq`, `curl`) | Leverage the library to run arbitrary code. | No integrity verification of external binaries. |
| **Local privileged attacker** | Elevate privileges via the library when run as root. | Use of `ollama` CLI which may have set‑uid binaries (unlikely, but possible). |

---  

## 3. Findings  

### 3.1 Input Validation & Command Injection  

| Function / Area | Issue | Impact | Evidence |
|-----------------|-------|--------|----------|
| **`ollama_eval`** (alias `oe`) | Uses `eval "$cmd"` on data returned from the Ollama model. The model’s output is under *untrusted* control. No sanitisation is applied before `eval`. | Arbitrary code execution (RCE) if a malicious model or manipulated response is supplied. | `eval "$cmd"` is the critical line. |
| **`_call_curl`** | Builds a `curl` argument array, but when a JSON body is present it does `echo "$json_body" | curl … -d @-`. If `$json_body` contains newline‑terminated `-d` options or other shell‑special characters, they are **not** interpreted because data is piped, however the preceding `echo` may interpret back‑slash escape sequences (`-e` is *not* used, but POSIX `echo` behaviour is undefined). | Potential data corruption; low risk of injection because data is never passed to the shell again. | `echo "$json_body"` – safer to use `printf '%s' "$json_body"` |
| **`ollama_app_turbo`** – reading API key | Reads the key with `read -r -s api_key`. The variable is subsequently exported (`export OLLAMA_HOST`) but **never exported** as a secret; it stays in the process environment and may be visible to other processes via `/proc/<pid>/environ`. | Exposure of the bearer token to other local users. | `OLLAMA_LIB_TURBO_KEY="$api_key"` – stored in a normal variable, later used in request header (`-H "Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}"`). |
| **`ollama_generate_*`, `ollama_chat_*`** | The model name and prompt are passed directly to `jq` in a JSON payload (`--arg model "$1" --arg prompt "$2"`). This is safe because `jq` treats them as literal strings. However the `model` argument is later used in path building (`ollama_api_post '/api/generate' …`) – no path sanitisation. | If a malicious user can control the model name, they could cause the library to request arbitrary API endpoints (`/api/../..`). The script does not validate that `$1` contains only allowed characters. | No validation present. |
| **`ollama_model_unload`** – uses `$1` directly in JSON payload (safe via `jq`). No other issues. | — | — |
| **`ollama_app_vars`**, **`ollama_lib_about`**, **`ollama_lib_version`** – only read environment variables, no injection risk. | — | — |

#### Summary  

*The only *critical* command‑injection vector* is `ollama_eval` (`eval`). All other functions pass data to external programs via argument arrays or through `jq` which safely escapes strings.  

### 3.2 Secret / Credential Handling  

| Issue | Detail |
|------|--------|
| **Bearer token stored in plain variable** | `OLLAMA_LIB_TURBO_KEY` is kept in memory as a normal shell variable and is exported to child processes indirectly when `curl` is invoked. Other local users with permission to read the process environment can dump it (`cat /proc/<pid>/environ`). |
| **No secure storage** | The script never offers a way to read the key from a file with restrictive permissions, nor does it erase the variable after use (`unset OLLAMA_LIB_TURBO_KEY` only when turbo mode is turned off). |
| **Potential leakage via debugging** | When `OLLAMA_LIB_DEBUG=1`, the script prints many internal values (including the *length* of the token, but **not the token itself**). However other debug prints may expose full JSON payloads that contain the token in the `Authorization` header (header line is printed via `_debug`). The token itself is not printed, but the debug output could be captured in logs. |

### 3.3 Network Security  

| Issue | Detail |
|------|--------|
| **Insecure default API URL** | `OLLAMA_LIB_API="${OLLAMA_HOST:-http://localhost:11434}"` uses plain HTTP. When running on a LAN, traffic could be sniffed or tampered with. |
| **No TLS verification options** | The `curl` command does not pass `--cacert`, `--cert`, or even `--tlsv1.2`. If a user points `OLLAMA_HOST` to an HTTPS endpoint with a self‑signed cert, `curl` will reject it unless the user disables verification elsewhere. |
| **Turbo mode forces HTTPS** | `host_api='https://ollama.com'` – good, but the token is sent in a plain `Authorization: Bearer …` header. No additional protection. |

### 3.4 External Dependency Trust  

| Dependency | Concern |
|------------|---------|
| `jq` (JSON parsing/creation) | Required for almost every API call. No version check; older versions may have bugs. |
| `curl` (HTTP client) | Same as above. |
| `ollama` CLI (local management) | If a malicious user replaces the binary, they could gain arbitrary code execution. The library does not verify signatures. |
| `od`, `printf`, `read` | Core utilities, generally safe. |
| `column` (optional for `ollama_lib_about`) | Not security‑critical. |

### 3.5 Safe‑Mode & Control‑Character Escaping  

*`_escape_control_characters`* is used to sanitise JSON strings when `OLLAMA_LIB_SAFE_MODE=1`. The implementation appears robust, but it **uses `od` and pipes through `while read`** which are safe for the intended purpose. No obvious buffer overflow or injection.  

### 3.6 Error Handling & Return Codes  

* Most functions correctly propagate `curl`/`jq` exit codes.  
* Some functions (`ollama_generate`, `ollama_chat`) capture command output into a variable, then inspect it; if the command fails, the variable may be empty, leading to possibly misleading debug messages but not a security problem.  

### 3.7 Compatibility with Bash 3.2  

| Feature | Bash 3.2 Support |
|---------|-----------------|
| **Arrays** (`OLLAMA_LIB_MESSAGES=()`, `array+=()`) – supported since Bash 3.0. |
| **`local` inside functions** – supported. |
| **`printf -v`** – introduced in Bash 3.1, so safe for ≥3.2. |
| **`[[ ... =~ ... ]]` regex operator** – available since Bash 3.0. |
| **`declare -A` (associative arrays)** – **not used**, so fine. |
| **`${var//pattern/repl}`** (parameter expansion) – present. |
| **`<(process substitution)`** – available. |
| **`<(command)`** – available. |
| **`$(...)` command substitution** – universal. |
| **`read -r -s`** – supported. |
| **`(( ))` arithmetic** – supported. |

The script **does not rely on Bash 4‑specific features** (namely associative arrays or `|&`). It should work on Bash 3.2+.  

---  

## 4. Recommendations  

Below are actionable mitigations, grouped by severity.

### 4.1 Critical – Eliminate Arbitrary `eval`

* **Remove or guard `eval`** in `ollama_eval`.  
  * Prefer `bash -c "$cmd"` only after strict validation (e.g., whitelist allowed characters, commands).  
  * Or, ask the user to **review** the command before execution and execute it via a subshell without `eval` (e.g., `bash -c "$cmd"` still runs the string, but you can first run `printf '%s\n' "$cmd"` for user confirmation).  

* If keeping `eval` is essential, **document** the risk heavily and enforce `set -o errexit` / `set -o nounset` in scripts that source the lib.

### 4.2 High – Protect the Turbo API Key  

* Store the bearer token in a **temporary file** with `chmod 600` and read it with `curl` using `--header @file`, then `shred` the file.  
* Alternatively, use **`declare -r`** to make the variable read‑only after assignment, and **unset** it immediately after the request.  
* When debugging is enabled, explicitly **avoid printing the token** or its length.

### 4.3 Medium – Secure Network Communication  

* Change the default API URL to **HTTPS** (if Ollama supports it) or at least make the default `http://` a clear, documented choice and encourage users to set `OLLAMA_HOST` to a secure endpoint.  
* Add optional parameters: `OLLAMA_LIB_CURL_OPTS` that can include `--cert`, `--cacert`, `--tlsv1.2`, or `--insecure` (the last one must be opt‑in).  
* Warn the user when `OLLAMA_HOST` is an insecure scheme and `OLLAMA_LIB_DEBUG` is off.

### 4.4 Medium – Validate External Input  

* **Model name** (`$1` for most `ollama_*` functions) – enforce a whitelist: `[[ $model =~ ^[a-zA-Z0-9_./-]+$ ]]`. Reject or sanitize otherwise.  
* **Prompt strings** – they are passed to Ollama; no need for validation, but note that they may contain newlines and other control characters that later get escaped (safe mode).  

### 4.5 Low – Harden Dependency Use  

* Check that required binaries exist and have **reasonable versions**:  
  ```bash
  _requires_cmd() {
    local cmd=$1 min=$2
    if ! command -v "$cmd" >/dev/null; then
      _error "Required command $cmd not found"
      return 1
    fi
    # optional: version check via "$cmd --version"
    return 0
  }
  ```  
* Consider offering a **fallback** when `jq` is missing (return a clear error).  

### 4.6 Low – Improve Debug Logging  

* Redact any potentially sensitive data (API keys, full JSON payloads that contain secrets).  
* Prefix debug lines with a timestamp only when `OLLAMA_LIB_DEBUG` is set, as already done.  

### 4.7 Low – Code Clean‑up  

* Remove the deprecated `_DEPRECATED_escape_control_characters` function; keep only the current implementation.  
* Consolidate duplicate code (e.g., the pattern for building a JSON payload with `jq` can be a helper).  
* Add a `set -euo pipefail` guard at the top of the script **only if the library is sourced in a `set -e`‑aware context**, or provide a wrapper that enables safe mode for the caller.  

---  

## 5. Summary of Security Posture  

| Category | Rating |
|----------|--------|
| **Command Injection** | **Critical** – `eval` in `ollama_eval`. |
| **Credential Exposure** | **High** – bearer token stored in a plain variable, echoed in debug output. |
| **Network Confidentiality** | **Medium** – default to HTTP, no TLS verification options. |
| **Input Validation** | **Medium** – model names unsanitised, prompts passed unchecked (acceptable). |
| **Dependency Trust** | **Low‑Medium** – no integrity checks for `curl`, `jq`, `ollama`. |
| **Compatibility** | **Good** – works on Bash 3.2+. |

If the **critical** `eval` issue is mitigated and the **high** token‑handling risk is addressed, the library will be suitable for typical local‑host usage. For environments where the library is exposed to untrusted users or runs with elevated privileges, the recommended hardening steps should be applied.  

---  

## 6. Suggested Minimal Patch (Illustrative)

```bash
# --- Replace eval in ollama_eval -------------------------------------------------
ollama_eval() {
  _debug "ollama_eval: [${1:0:42}] [${2:0:42}]"
  local task="$1" model="${2:-$(ollama_model_random)}"

  local prompt='Write a bash one‑liner ...'   # unchanged
  local cmd
  cmd="$(ollama_generate "$model" "$prompt")"
  _debug "ollama_eval: cmd: [${cmd:0:240}]"

  if [[ -z "$cmd" ]]; then
    _error 'ollama_eval: generate failed'
    return 1
  fi

  printf 'Command:\n\n%s\n\nRun command (y/n)? ' "$cmd"
  read -r permission
  [[ $permission != y ]] && return 0

  # ----- NEW: strong validation before execution -------------------------------
  if [[ $cmd =~ ^[[:print:][:space:]]+$ && ${#cmd} -lt 4096 ]]; then
    # optional: whitelist of allowed tools (grep, awk, sed, etc.)
    _debug "ollama_eval: executing command"
    bash -c "$cmd"
    return $?
  else
    _error "ollama_eval: suspicious command – execution aborted"
    return 127
  fi
}
# ------------------------------------------------------------------------------

# --- Secure handling of turbo key ------------------------------------------------
ollama_app_turbo() {
  ...
  if [[ -z "$OLLAMA_LIB_TURBO_KEY" ]]; then
    read -r -s api_key
    # store in a temporary file with restrictive perms
    local keyfile
    keyfile=$(mktemp -p "${TMPDIR:-/tmp}" ollama_key.XXXXXX) || return 1
    printf '%s' "$api_key" >"$keyfile"
    chmod 600 "$keyfile"
    export OLLAMA_LIB_TURBO_KEY_FILE="$keyfile"
  fi
  ...
  # when making the request
  _call_curl() {
    ...
    if [[ -n "$OLLAMA_LIB_TURBO_KEY_FILE" ]]; then
      curl_args+=( -H "Authorization: Bearer $(<"$OLLAMA_LIB_TURBO_KEY_FILE")" )
    elif [[ -n "$OLLAMA_LIB_TURBO_KEY" ]]; then
      curl_args+=( -H "Authorization: Bearer $OLLAMA_LIB_TURBO_KEY" )
    fi
    ...
  }
  # cleanup after request
  trap '[[ -n $OLLAMA_LIB_TURBO_KEY_FILE ]] && shred -u "$OLLAMA_LIB_TURBO_KEY_FILE"' EXIT
}
# ------------------------------------------------------------------------------
```

*The above patch is illustrative only; a full implementation should also address debug‑output redaction and model‑name validation.*  

---  

**Prepared by:**  
*Security Analyst – Bash‑Script Hardening*  

*Date: 2025‑08‑09*   (review performed for Bash ≥ 3.2 compatibility).  
