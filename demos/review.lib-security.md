# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate -m "gpt-oss:120b" -p "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
**Version:** 0.46.1  
**Target Bash:** 3.2 or newer  

---

## 1. Overview  

The script provides a fairly large Bash “library” for interacting with the Ollama AI server (local or cloud).  It wraps `curl`/`jq` calls, maintains an in‑memory message history, and offers a set of convenience functions & aliases.  

From a security standpoint the main concerns are:

| Area | Why it matters |
|------|----------------|
| **Input validation & command injection** | Many functions accept user‑supplied strings that are later passed to `curl`, `jq`, or other external commands. |
| **Secret handling** | API keys are stored in environment variables and printed in debug logs unless redacted. |
| **External dependencies** | The script relies on `curl`, `jq`, `shuf`, `awk`, `sed`, `column`, `compgen` etc. Their presence and version affect correctness and security. |
| **Network security** | No explicit TLS/ certificate verification for HTTPS endpoints; default `curl` options may expose data to MITM. |
| **Error handling & exit status** | Inconsistent return‑code propagation and sometimes silent failures (e.g. missing `jq`). |
| **Shell compatibility** | Some Bash‑4+ features (associative arrays, `${var//pattern/repl}` with a variable pattern, `[[ ... =~ ... ]]` with a regex variable) are used; they work on Bash 3.2 but edge‑cases exist. |
| **Debug output leakage** | `_debug` prints potentially sensitive payloads (e.g. full JSON body) to `stderr`. |
| **Race conditions / temporary files** | None are created directly, but some pipelines use process substitution (`<(…)`) which may expose data via `/dev/fd` descriptors. |

The following sections detail each finding and provide concrete remediation advice.

---

## 2. Detailed Findings  

### 2.1 Input Validation & Command Injection  

| Function | Issue | Impact | Evidence |
|----------|-------|--------|----------|
| `_call_curl` | Validates `method` and `endpoint` but does not validate the **contents** of `json_body` beyond calling `_is_valid_json`.  A crafted JSON could contain malicious strings that later get interpolated into `curl` arguments (e.g., `$(rm -rf /)` if backticks are used). | Potential command injection via `curl` `-d "@-"` pipe. | The JSON is printed via `_debug` **before** being sent. |
| `ollama_api_get / post / ping` | Accepts arbitrary `api_path` values. While the function checks that the path begins with `/` and contains no spaces or backslashes, it still permits characters like `;` or `$(` that are harmless for the URL but could affect later string expansions. | Limited, but could affect downstream string handling. | Validation pattern: `[[ "$endpoint" != /* || "$endpoint" == *" "* || "$endpoint" == *"\\"* ]]`. |
| `_is_valid_url` | Simple regex permits only `http`/`https` and host:port. No check for dangerous characters in the host (e.g., `example.com@evil.com`). | Could be used for DNS rebinding or SSRF attacks. | Regex: `^(https?)://[A-Za-z0-9.-]+(:[0-9]+)?$`. |
| `ollama_model_unload` → `_ollama_chat_payload` | Model name is injected directly into a JSON payload built with `jq`. `jq` safely escapes strings, but the variable is also used in error messages that go to the console. | Low, but could expose model names to logs. | Uses `jq -c -n --arg model "$model"` which is safe. |
| `ollama_generate_json` and friends | Prompt and model are embedded in a JSON payload via `_ollama_generate_json_payload`. The payload is built with `jq`, which handles quoting correctly. However, the **debug** output (`_debug "json_payload: ${json_payload:0:120}"`) reveals raw user‑supplied data. | Information leakage (potentially secrets in prompts). | `_debug` prints redacted only if `_redact` finds the turbo key. |

**Recommendation**

* Centralise validation of all user‑supplied strings (model, prompt, endpoint).  
* Use `jq` for *all* JSON construction; never concatenate raw strings into JSON manually.  
* Reduce debug verbosity for production (`OLLAMA_LIB_DEBUG=0`).  
* When debug is enabled, ensure payloads are redacted (e.g., replace any user‑provided values with `[REDACTED]`).  

### 2.2 Secret / Credential Handling  

| Observation | Risk | Example |
|-------------|------|---------|
| `OLLAMA_LIB_TURBO_KEY` is stored in the environment and may be exported (`export OLLAMA_LIB_TURBO_KEY`). | If the script is sourced from a long‑running shell, the key is visible to any child process (`ps e` can reveal it). | `ollama_app_turbo` optionally exports the key. |
| `_debug` prints the full JSON body **including** the `Authorization: Bearer …` header if Turbo mode is active (the header is added to `curl_args`). | Debug logs could leak the API key to disk or to other users on the system. | `_debug "_call_curl: OLLAMA_LIB_API: $OLLAMA_LIB_API"` prints the URL; later `_debug "_call_curl: json_body: ${json_body:0:120}"` may contain the key if the user includes it in the payload. |
| `_redact` only replaces occurrences of `OLLAMA_LIB_TURBO_KEY` in a *single* string; other secret variable names (`OLLAMA_AUTH`, `CUDA_VISIBLE_DEVICES`, etc.) are not automatically redacted. | Secrets could appear in logs or error messages. | `_error` uses `_redact` but only for the turbo key. |

**Recommendation**

* Never export the Turbo key unless absolutely necessary. Prefer passing it via a temporary file descriptor or a `curl` `--header` built inline.  
* Extend `_redact` to replace any environment variable matching `*KEY*`, `*TOKEN*`, `*SECRET*`, `*PASS*`, etc.  
* Offer a “sanitize” mode that strips all environment variables from debug output.  
* Document that `OLLAMA_LIB_DEBUG` must be set to `0` in production.  

### 2.3 External Dependency Trust  

* **`jq`**, **`curl`**, **`shuf`**, **`awk`**, **`sed`**, **`column`**, **`compgen`** – all are invoked via `command -v`. If a malicious user can modify the `$PATH` they could replace any of these with a trojan that exfiltrates data.  
* No integrity checks (hash, package verification) are performed.  

**Recommendation**

* Verify that the required binaries are owned by root (or a trusted user) and are on a read‑only `PATH`.  
* At initialisation, capture the absolute path of each binary (`_exists`) and use that path later (e.g., `CURL=$(command -v curl)`).  
* Consider a “--strict‑deps” flag that aborts if any binary fails a SHA‑256 check (optional).  

### 2.4 Network Security  

* `curl` is invoked with `-s -N --max-time … -H 'Content-Type: application/json' -w '\n%{http_code}'`.  
* No `--tlsv1.2`, `--cacert`, or `--insecure` flags are set, meaning defaults apply. For HTTPS endpoints (Turbo mode) the default CA bundle is used, **but** the script never verifies the host name explicitly.  

**Recommendation**

* Force TLS version and certificate verification: add `--ssl-reqd --tlsv1.2` (or newer) and optionally allow the user to supply `--cacert`.  
* Provide a `OLLAMA_LIB_INSECURE` toggle that, when set, adds `-k` for users that knowingly want to skip verification, but default should be secure.  

### 2.5 Error Handling & Return‑Code Propagation  

* Many functions capture `$?` in a local variable (e.g., `error_curl=$?`) but then ignore it or continue execution.  
* `_call_curl` extracts `http_code` via `tail -n1` and `sed '$d'` – if the body contains newlines, the split may break.  
* Some functions (`ollama_generate`, `ollama_chat`) set `OLLAMA_LIB_STREAM=0` *after* a pipeline is started; if the pipeline fails early, the variable may remain set.  

**Recommendation**

* Use `set -euo pipefail` (with a guard for Bash 3.2 where `pipefail` may be unavailable).  
* After `_call_curl`, verify that the response contains a *single* HTTP status line; use `curl -w '%{http_code}' -o -` to separate body and code more reliably.  
* Ensure all functions `return` the exact status of the underlying operation, and document which non‑zero values mean what.  

### 2.6 Bash Compatibility (≥ 3.2)  

| Feature | Compatibility | Comments |
|---------|----------------|----------|
| `[[ string =~ regex ]]` with a *variable* regex (`$url_regex`) | Supported since Bash 3.0. | OK |
| `${var//pattern/replacement}` (parameter expansion) | Supported since Bash 3.0, but pattern cannot be a variable containing a slash unless quoted (handled correctly). | OK |
| Arrays (`myarr=()` and `${#myarr[@]}`) | Supported since Bash 2.0. | OK |
| `readonly -a` (not used) | — | — |
| `local` inside functions | Bash 3.0+ | OK |
| `command -v` | Bash 3.0+ | OK |
| `printf '%s' "$var"` with large strings | OK; no `%b` expansions. |
| `read -r -d '' var < <( … )` (process substitution) | Supported in Bash 3.2+. |
| `declare -A` (associative arrays) – **not used**, which is good for compatibility. | — | — |
| `(( var ))` arithmetic evaluation | Supported. |
| `[[ -n "${OLLAMA_LIB_TURBO_KEY}" ]]` used before the variable is exported – works. | — |

Overall the script **does not use Bash‑4‑only features**, so it should run on Bash 3.2+. The only possible snag is the optional `set -o pipefail` shim: `(set -o pipefail 2>/dev/null)` is fine, but the comment “If pipefail is supported” is accurate.

### 2.7 Debug / Logging Leakage  

* `_debug` writes to `stderr` unconditionally when `OLLAMA_LIB_DEBUG` > 0.  
* It prints the raw date string and any user‑supplied data (after optional redaction).  
* In pipelines (`ollama_generate_stream` etc.) the debug statements can intermix with streamed output, making parsing difficult and potentially leaking sensitive data to logs.

**Recommendation**

* Add a **redaction filter** to `_debug` that replaces any token matching `*KEY*`, `*TOKEN*`, `*SECRET*` with `[REDACTED]`.  
* Offer a separate `OLLAMA_LIB_LOGFILE` variable to redirect debug output to a secure, user‑only‑readable file, rather than leaking to the console.  

### 2.8 Temporary Files & Process Substitution  

* `ollama_chat_stream` uses `2> >( _ollama_thinking_stream )`.  
* The subshell inherits the parent’s environment, which may contain the turbo key.  

**Recommendation**

* Ensure that the `_ollama_thinking_stream` function does not inadvertently expose environment variables.  
* Prefer explicit redirection to a file descriptor created with `exec 3> >(…)` when possible, making the flow clearer.  

---

## 3. Recommendations Summary  

| Category | Action |
|----------|--------|
| **Input sanitisation** | Centralise validation of model names, prompts, and API paths. Use `jq` for *all* JSON creation. |
| **Secret handling** | Never export `OLLAMA_LIB_TURBO_KEY` unless required; extend `_redact` to mask any `*KEY*/*TOKEN*` patterns; disable debug in production. |
| **Dependency integrity** | Resolve absolute paths for external tools (`CURL=$(command -v curl)`) and optionally verify ownership/permissions. |
| **TLS/HTTPS** | Add `--tlsv1.2 --ssl-reqd` to `curl` invocations; allow custom CA bundle via `OLLAMA_LIB_CACERT`. |
| **Error handling** | Use `set -euo pipefail` (guarded for Bash 3.2) and propagate exit codes consistently. Separate body and HTTP code with `curl -w '%{http_code}' -o -`. |
| **Debug leakage** | Redact all secret patterns, optionally log to a protected file (`OLLAMA_LIB_LOGFILE`). |
| **Race/Temp files** | Avoid unnecessary process substitution; when used, keep it within the function’s scope. |
| **Compatibility** | No Bash‑4‐only features detected; keep the existing compatibility shim for `pipefail`. |
| **Documentation** | State clearly: “Do not enable `OLLAMA_LIB_DEBUG` on systems where other users can read stderr or logs.” Add a “hardening” checklist for deployment. |

Implementing the above mitigations will substantially reduce the attack surface without affecting the library’s primary functionality.

---

## 4. Sample Hardened Snippets  

Below are a few concrete code changes that illustrate the recommendations.

### 4.1 Secure `curl` wrapper  

```bash
# Global: path to trusted binaries
CURL=$(command -v curl) || { echo "curl not found" >&2; exit 1; }

# Secure _call_curl (excerpt)
_call_curl() {
    _debug "_call_curl: method=$1 endpoint=$2"
    local method=$1 endpoint=$2 json_body=$3
    local curl_args=(
        -s          # silent
        -S          # show errors
        -L          # follow redirects
        --tlsv1.2   # enforce TLS 1.2+
        --max-time "${OLLAMA_LIB_TIMEOUT}"
        -H "Content-Type: application/json"
        -w "\n%{http_code}"
    )
    # Add Authorization header only if key is set
    [[ -n "$OLLAMA_LIB_TURBO_KEY" ]] && curl_args+=( -H "Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}" )
    curl_args+=( -X "$method" "${OLLAMA_LIB_API}${endpoint}" )
    # send JSON via stdin
    if [[ -n "$json_body" ]]; then
        response=$("$CURL" "${curl_args[@]}" <<<"$json_body")
    else
        response=$("$CURL" "${curl_args[@]}")
    fi
    # Separate body / status
    http_code=${response##*$'\n'}
    body=${response%$'\n'*}
    (( http_code >= 400 )) && { _error "HTTP $http_code: $body"; return 1; }
    printf '%s' "$body"
}
```

### 4.2 Expanded Redaction  

```bash
_redact() {
    local msg=$1
    # List of secret‑like env‑var patterns
    local patterns='*KEY* *TOKEN* *SECRET* *PASS*'
    for pat in $patterns; do
        local val="${!pat}"
        [[ -n $val ]] && msg=${msg//$val/[REDACTED]}
    done
    printf '%s' "$msg"
}
```

### 4.3 Debug Logging to Secure File  

```bash
# If OLLAMA_LIB_LOGFILE is set, write debug there; otherwise to stderr
_debug() {
    (( OLLAMA_LIB_DEBUG )) || return 0
    local out=${OLLAMA_LIB_LOGFILE:-/dev/stderr}
    local date_string
    date_string=$(date '+%H:%M:%S:%N' 2>/dev/null || date '+%H:%M:%S')
    printf '[DEBUG] %s: %s\n' "$date_string" "$(_redact "$1")" >>"$out"
}
```

---

## 5. Conclusion  

The **Ollama Bash Lib** is a well‑structured and feature‑rich Bash library, but it processes untrusted input and handles credentials in ways that may expose secrets or enable injection attacks, especially when debug logging is enabled or when the script runs in a multi‑user environment.  

By tightening input validation, improving secret redaction, enforcing TLS verification, hardening external‑dependency handling, and making the debug path optional and safely logged, the library can be made robust for production use while remaining compatible with Bash 3.2+.  

Implementing the recommendations above will significantly raise the security posture without breaking any existing functionality.
