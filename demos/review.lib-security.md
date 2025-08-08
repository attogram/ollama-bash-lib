# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.32


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
*Version: 0.42.32*  
*Reviewed: 2025‑08‑08*  

---

## 1. Overview  

The script is a Bash library that provides a thin wrapper around the **Ollama** API (both local and cloud‑based “Turbo” mode). It offers functions for:

* Basic HTTP GET/POST via `curl`  
* Prompt/response handling (including streaming)  
* Message queuing for chat‑style interactions  
* Model administration (list, unload, show, etc.)  
* “Turbo” mode handling that stores an API key in `OLLAMA_LIB_TURBO_KEY`  

The library is intended to be sourced by user scripts, not executed directly.

---

## 2. Threat Model  

| Actor | Goals | Attack Surface |
|-------|-------|----------------|
| **Local user** (non‑privileged) | Accidental misuse, privilege escalation, leaking secrets | Environment variables, hidden API key, debug output |
| **Malicious user** (has ability to modify or inject code into a script that *sources* this lib) | Execute arbitrary commands, exfiltrate API key, SSRF, DOS | Unsanitised inputs (model names, prompts, host URL), external command execution, `curl` handling |
| **Remote attacker** (reachable via network) | Exploit SSRF to reach internal services, cause DoS on Ollama server | `OLLAMA_HOST` override, insufficient TLS verification |

*Assumption*: The library is used on a trusted host; the main risks revolve around **data leakage**, **command injection**, and **server‑side request forgery (SSRF)** arising from user‑controlled variables.

---

## 3. Findings  

| # | Category | Description | Severity |
|---|----------|-------------|----------|
| **1** | **Credential Exposure – Debug Logging** | When `OLLAMA_LIB_DEBUG=1`, `_debug` prints the length of `OLLAMA_LIB_TURBO_KEY` but not the key itself. However other debug messages print full JSON payloads and API URLs, which may contain the **Bearer token** in the `Authorization` header. If logs are accessible to other users, the token can be harvested. | **Medium** |
| **2** | **SSRF via `OLLAMA_HOST`** | `OLLAMA_HOST` can be set arbitrarily (environment or `ollama_app_turbo`). The library then concatenates it with API endpoints without validation, allowing an attacker to point the library at an internal service (e.g., `http://169.254.169.254`). | **High** |
| **3** | **Insufficient Input Validation – Model/Prompt** | Model names and prompts are passed directly into JSON payloads constructed with `jq`. While `jq` safely escapes strings, the *array* construction for chat messages builds a raw JSON string (`messages_array_json`) by concatenating pre‑escaped fragments. If a message JSON fragment is malformed (e.g., contains an unescaped `]`), the resulting payload can break the JSON structure and cause the server to return an error that may leak internal information. | **Low** |
| **4** | **Missing Dependency Checks** | Functions that rely on external utilities (`jq`, `column`, `head`, `tail`, `awk`, `sort`) do not verify their presence before use (except for a few). If a required binary is missing, the script may fail with a non‑zero exit code, potentially leaving partial data processed, or it may fall back to insecure behaviour. | **Low** |
| **5** | **Error‑Handling Inconsistency** | Most functions capture `curl`’s exit status, but `_call_curl` does **not** use `curl --fail` or `--show-error`. HTTP error codes (e.g., 4xx/5xx) are treated as success if the TCP connection succeeds, leading callers to assume a valid JSON payload when the body contains an HTML error page. | **Medium** |
| **6** | **Potential Command Injection via `OLLAMA_LIB_TURBO_KEY`** | The bearer token is inserted into a `curl` header using a Bash array (`curl_args+=( -H "Authorization: Bearer ${OLLAMA_LIB_TURBO_KEY}" )`). Bash arrays protect against word‑splitting, but if the token contains a newline, it creates a **new argument** that could be interpreted as an extra `-H` or even a new command. Tokens are typically a single line, but a malicious user could craft a value containing `\n` to inject additional `curl` options. | **Medium** |
| **7** | **Unrestricted Readability of Environment Variables** | The script exports `OLLAMA_HOST` and sets `OLLAMA_LIB_API` as regular shell variables. Any child process can read them, potentially exposing the API endpoint (and possibly the token) to other programs. | **Low** |
| **8** | **Streaming Loop Edge‑Case** | `ollama_generate_stream` uses `while IFS= read -r -d '' chunk; do … done`. The delimiter is NUL, which `curl` never emits for JSON streams, causing the loop to read until EOF and then exit. However, if the server sends a NUL (unlikely), the loop would split the stream incorrectly. Not a security issue but a **robustness** concern. | **Info** |
| **9** | **No `set -euo pipefail`** | The script does not enable strict mode, increasing the chance of silently ignoring errors (e.g., undefined variables, pipe failures). | **Low** |

---

## 4. Recommendations  

### 4.1. Harden Credential Handling  
* **Never log the Authorization header** (or the full JSON payload) when `DEBUG` is enabled. Replace the line in `_debug` that prints the payload with a sanitized version that masks the token:  

  ```bash
  _debug() {
    (( OLLAMA_LIB_DEBUG )) || return
    local msg="${1//${OLLAMA_LIB_TURBO_KEY}/********}"
    printf "[DEBUG] $(date '+%H:%M:%S:%N'): %s\n" "$msg" >&2
  }
  ```

* Store the Turbo token in a **restricted file** (`chmod 600`) and read it on demand, rather than keeping it in a global variable.

### 4.2. Validate & Restrict `OLLAMA_HOST`  
* Add a whitelist or at least enforce **scheme** (`http://` or `https://`) and **hostname/IP** format.  

  ```bash
  _validate_host() {
    [[ $1 =~ ^https?://[a-zA-Z0-9._-]+(:[0-9]+)?$ ]] || return 1
  }
  ```

* Call this validator whenever `OLLAMA_HOST` or `OLLAMA_LIB_API` is set (e.g., in `ollama_app_turbo`).

### 4.3. Strengthen `curl` Usage  
* Use `--fail --show-error --silent` to let HTTP error codes cause a non‑zero exit status.  

  ```bash
  curl_args+=( --fail --show-error )
  ```

* Add `--tlsv1.2` and, when using the cloud endpoint, enforce hostname verification (`--cacert` or `--capath`).

### 4.4. Sanitize the Turbo Token  
* Strip newlines before using the token:  

  ```bash
  OLLAMA_LIB_TURBO_KEY=${OLLAMA_LIB_TURBO_KEY//$'\n'/}
  ```

* Optionally base64‑encode the token on storage and decode just before use.

### 4.5. Dependency Checks  
* Create a helper `_require` to abort early if a required binary is missing:

  ```bash
  _require() {
    for cmd in "$@"; do
      if ! _exists "$cmd"; then
        _error "Required command not found: $cmd"
        return 1
      fi
    done
  }
  ```

* Call `_require jq column` at library load time or inside the functions that need them.

### 4.6. Strict Bash Mode  
Add at the top of the file (after the shebang):

```bash
set -euo pipefail
IFS=$'\n\t'
```

* `-u` catches unset variables (prevents accidental injection).  
* `-e` aborts on non‑zero exit status.  
* `-o pipefail` propagates failures through pipelines.

### 4.7. Safe Construction of Chat Message Array  
Instead of hand‑crafting a JSON string, let `jq` build the array:

```bash
json_payload=$(jq -n \
  --arg model "$model" \
  --argjson messages "$(printf '%s\n' "${OLLAMA_LIB_MESSAGES[@]}" | jq -s '.')" \
  --argjson stream "$stream_bool" \
  '{model: $model, messages: $messages, stream: $stream}')
```

This removes the need for manual string concatenation and ensures the array is always valid JSON.

### 4.8. Limit Exposure of Environment Variables  
* Do **not** `export OLLAMA_HOST` unless required by an external tool.  
* Prefer to keep `OLLAMA_LIB_API` as a **local variable** within the library.

### 4.9. Logging of Errors  
* Include the HTTP status code on failure to aid debugging without revealing payload data:

  ```bash
  if ! curl ...; then
    local rc=$?
    _error "curl failed (exit=$rc, HTTP=$HTTP_STATUS)"
  fi
  ```

  (Capture status via `-w '%{http_code}'`.)

---

## 5. Secure Coding Best Practices (Bash)  

| Practice | Why it matters |
|----------|----------------|
| **Prefer arrays over string concatenation for command arguments** | Prevents word‑splitting and globbing. |
| **Quote all variable expansions** (`"$var"`) | Avoids unintended globbing or command injection. |
| **Never trust external input** (environment, arguments) – validate/sanitize. |
| **Use `jq` for JSON handling** – never rely on manual string building. |
| **Limit debugging output in production** – provide a whitelist of safe fields. |
| **Store secrets outside of the process environment** (e.g., in a file with restrictive permissions). |
| **Set `umask` appropriately** (`umask 077`) before creating files that may contain secrets. |
| **Use `mktemp -u` / `mktemp` when temporary files are needed** (not applicable here, but good practice). |
| **Avoid `eval` and `source` of untrusted scripts** – they are the most common Bash injection vectors. |

---

## 6. Conclusion  

The **Ollama Bash Lib** is generally well‑structured and avoids many classic Bash pitfalls (e.g., it uses arrays for `curl` arguments). However, the following high‑impact issues need remediation:

1. **SSRF risk** stemming from an unvalidated `OLLAMA_HOST`.  
2. **Potential leakage of the Turbo API token** via debug logs and header injection.  
3. **Insufficient handling of HTTP error responses** that can lead to misleading success indications.

Implementing the recommendations above—especially host validation, hardened credential handling, and stricter `curl` options—will raise the security posture from *moderate* to *low* risk and make the library safer for both personal and production use.  

--- 

*Prepared by: [Your Name], Security Engineer*  
*Date: 2025‑08‑08*  
