# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.40


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – **Ollama Bash Lib**  
*Version 0.42.40 – Bash ≥ 3.2*  

---  

## 1. Overview  

The library provides a set of Bash functions that wrap the **Ollama** REST API (via `curl`) and the local `ollama` CLI. It also implements convenience helpers for building JSON payloads with **jq**, handling streaming responses, and maintaining an in‑memory message buffer.

The review focuses on **security‑relevant aspects** (input validation, command injection, information leakage, privilege handling, etc.) while confirming that the script remains functional on **Bash 3.2** or later.

---  

## 2. Compatibility with Bash 3.2  

| Feature | Bash 3.2 support | Comment |
|--------|------------------|---------|
| `local` variables | ✅ | Available |
| Arrays (`arr=()`; `${#arr[@]}`) | ✅ | Supported |
| Process substitution `< <(...)` | ✅ | Present since Bash 2 |
| `${var:offset:length}` substring syntax | ✅ | Supported |
| `[[ … ]]` test command and `[[ -n … ]]` | ✅ | |
| `printf -v` (not used) | – | N/A |
| Associative arrays | **Not used** | Good, they would break on < 4 |
| `declare -A` | – | N/A |
| `(( … ))` arithmetic | ✅ | |
| `read -r -s` (silent read) | ✅ | |
| `command -v` | ✅ | |
| `[[ … =~ … ]]` (regex) | Not used | – |
| `compgen`, `column` (external tools) | Not part of Bash, but optional | The script gracefully degrades if missing. |

> **Result:** The library uses only features that exist in Bash 3.2, so it should run unchanged on that version and newer.

---  

## 3. Threat Model  

| Asset | Potential Adversary | Goal |
|-------|---------------------|------|
| **Local shell environment** (variables, functions) | Malicious user of the same account, compromised script runner | Escalate privileges, exfiltrate data, execute arbitrary commands |
| **Ollama API endpoint** | Remote attacker controlling the API (Man‑in‑the‑middle) | Inject malicious JSON, cause code execution on the host |
| **Generated commands** (`ollama_eval`) | Attacker who can influence the prompt or model selection | Achieve command injection via the `eval` call |
| **API key (`OLLAMA_LIB_TURBO_KEY`)** | Any process that can read the environment | Leak credential, abuse the cloud service |
| **Message buffer (`OLLAMA_LIB_MESSAGES`)** | Untrusted input added via `ollama_messages_add` | Poison JSON payloads for later chat calls |

---  

## 4. Findings  

### 4.1 Input Validation & Sanitisation  

| Function | Issue | Impact |
|----------|-------|--------|
| **`ollama_eval`** (and alias `oe`) | Directly runs the string returned by `ollama_generate` with `eval`. No validation of the generated command. | **Critical** – an attacker who can influence the model output (e.g., by providing a crafted prompt or by controlling the model) can execute arbitrary commands with the privileges of the user running the script. |
| **Model name parameters** (`ollama_generate*`, `ollama_chat*`, `ollama_model_unload`, `ollama_show`) | Model name is passed verbatim to the API payload (via `jq --arg`) – safe for the HTTP request – **but** many CLI wrappers (`ollama show "$1"`, `ollama list`, `ollama ps`) invoke the `ollama` binary with the model string unquoted (`"$1"` is quoted, good). However, no whitelist or sanitation prevents a model name such as `-h` or `--version` which could change the behaviour of the CLI. | **Medium** – may cause unexpected CLI flags, information disclosure, or denial‑of‑service. |
| **Message buffer** (`ollama_messages_add`) | Content is taken verbatim and placed into a JSON object via `jq`. If the caller supplies a string containing malicious JSON fragments, they will be escaped by `jq` (safe). However, the buffer is later interpolated into a JSON payload with `--argjson messages "$messages_array_json"` where `$messages_array_json` is built by concatenating `"$json_payload"` strings. This relies on proper quoting; because the array is assembled with `printf ",%s" "${OLLAMA_LIB_MESSAGES[@]}"`, each element is already a valid JSON string, so injection risk is low. | **Low** – current method is safe, but future modifications should keep the same pattern. |
| **Turbo mode API key** (`ollama_app_turbo`) | The key is stored in a *global* shell variable `OLLAMA_LIB_TURBO_KEY` and exported as part of `OLLAMA_HOST` indirectly. It is never explicitly `export`ed, but any child process (e.g., `curl`) inherits environment variables automatically. | **Medium** – other processes run by the same user can read the key from the environment (`ps e` or `/proc/<pid>/environ`). Consider restricting its exposure (e.g., using a temporary file with restrictive permissions). |
| **`_call_curl`** – `curl` options | Uses `-f` (fail on HTTP error) and `-s` (silent). No explicit timeouts (`--max-time`, `--connect-timeout`). | **Low** – could lead to hanging scripts, which can be a denial‑of‑service vector. |
| **`_debug`** – prints raw arguments | In debug mode, arbitrary data (including the API key) may be written to `stderr`. | **Low–Medium** – enabling debug in production could leak sensitive data. |

### 4.2 Command Injection  

*Only* `ollama_eval` invokes `eval`. All other functions use `curl` or `jq` with data passed via standard input (`-d "@-"`) or through `--arg`, which safely escape special characters. No other `eval`, `source`, or back‑ticks are present.

### 4.3 Information Leakage  

| Vector | Details |
|--------|---------|
| **Debug output** (`OLLAMA_LIB_DEBUG=1`) | `_debug` prints timestamps, API endpoint, payload snippets, and the length of the turbo key (`(${#OLLAMA_LIB_TURBO_KEY} characters)`). If debug is left on, an attacker with console access can see the key length and API URLs. |
| **Error messages** (`_error`) | Errors are printed to `stderr` but do not contain sensitive data. |
| **`ollama_lib_about`** – function list | Uses `compgen`. No sensitive data is exposed, but the function list may reveal internal helpers to an attacker. This is benign. |

### 4.4 Privilege & Environment Handling  

* No `set -e`, `set -u`, or `set -o pipefail`. This makes the script tolerant of failures, reducing the chance of unintended early termination (good for resilience) but also means that errors may go unnoticed if callers do not check return codes.  
* Global variables are not namespaced beyond the `OLLAMA_LIB_` prefix, reducing accidental collisions.  

### 4.5 External Dependencies  

| Dependency | Security considerations |
|------------|--------------------------|
| `curl` | Must be up‑to‑date to avoid known TLS bugs. The script does not enforce TLS verification (`-k` is not used, good). |
| `jq` | Used for JSON generation/validation. If an attacker could replace `jq` with a malicious binary earlier in `$PATH`, they could impact the script. Recommend using absolute path (`/usr/bin/jq`) or verifying existence with a checksum. |
| `column`, `compgen` | Optional, not security‑critical. |
| `ollama` CLI | Directly executed with user‑supplied arguments. Same concerns as model name handling apply. |

---  

## 5. Recommendations  

### 5.1 Eliminate or Harden `eval`  

* **Option A – Remove** `ollama_eval` from the library (or keep it behind a very explicit opt‑in flag).  
* **Option B – Sandbox**:  
  * Run the generated command in a subshell with reduced privileges (`set -o noclobber; ...`) or via `bash -c` with `-o pipefail`.  
  * Validate the command string before execution:  
    ```bash
    if [[ "$cmd" =~ ^[[:alnum:]/._-]+$ ]]; then
        eval "$cmd"
    else
        _error "Generated command contains unsafe characters"
        return 1
    fi
    ```  
  * Better yet, avoid `eval` entirely and ask the user to run the command manually.

### 5.2 Input Sanitisation for Model Names  

* Whitelist allowed characters (e.g., `[a-zA-Z0-9._-]`) before using a model name in any CLI call.  
* Provide a helper:  
  ```bash
  _sanitize_model() {
    [[ "$1" =~ ^[a-zA-Z0-9._-]+$ ]] && printf '%s' "$1"
  }
  ```

### 5.3 Protect the Turbo API Key  

* Store the key in a temporary file with `chmod 600` and read it only when needed:  
  ```bash
  export OLLAMA_LIB_TURBO_KEY_FILE=$(mktemp)
  chmod 600 "$OLLAMA_LIB_TURBO_KEY_FILE"
  echo "$api_key" > "$OLLAMA_LIB_TURBO_KEY_FILE"
  # later: curl -H "Authorization: Bearer $(<"$OLLAMA_LIB_TURBO_KEY_FILE")"
  ```  
* Avoid exporting it as an environment variable; pass it via a header each time.

### 5.4 Tighten Debug Logging  

* Do **not** log sensitive values (API key length, full payload).  
* Optionally filter:  
  ```bash
  _debug() {
    (( OLLAMA_LIB_DEBUG )) || return
    local msg="$1"
    # redact possible keys
    msg="${msg//${OLLAMA_LIB_TURBO_KEY}/<REDACTED>}"
    printf "[DEBUG] %s\n" "$msg" >&2
  }
  ```

### 5.5 Add Strict Error Handling  

* At the top of the library (or in a wrapper script) enable:  
  ```bash
  set -o errexit   # -e
  set -o nounset   # -u
  set -o pipefail
  ```  
* Provide a `ollama_lib_init` function that callers can source, which sets these options *after* the library has been loaded.

### 5.6 Verify External Binaries  

* Use `command -v` to locate `jq`, `curl`, and `ollama`. If you want to be extra safe, compare their SHA‑256 hashes on first run.  
* Example:  
  ```bash
  _exists jq || { _error "jq is required"; return 1; }
  ```

### 5.7 Network‑Side Hardening  

* Add explicit timeouts to `curl` (e.g., `--max-time 30 --connect-timeout 5`).  
* If TLS is used (Turbo mode), enforce `--tlsv1.2` and `--cipher` suites as needed.

### 5.8 Documentation Updates  

* Clearly state that **`ollama_eval` executes arbitrary code** and must only be used with trusted input.  
* Document the expected character set for model names and any limits on message size.

---  

## 6. Conclusion  

The **Ollama Bash Lib** is well‑structured and deliberately avoids Bash‑4‑only features, making it compatible with Bash 3.2+. Most functions safely construct JSON payloads using `jq` and communicate with the Ollama API via `curl` without exposing obvious injection vectors.

The **primary security concern** is the `ollama_eval` function, which runs unvalidated AI‑generated code with `eval`. This poses a **critical command‑injection risk** and should be removed, sandboxed, or heavily validated before execution.

Other moderate risks include:

* Potential misuse of model names as CLI flags.  
* Exposure of the Turbo API key through the environment and debug output.  
* Lack of explicit network time‑outs.

By applying the recommendations above—especially sanitising model names, protecting the API key, hardening debug logging, and either eliminating or sandboxing `ollama_eval`—the library will meet a strong security posture while remaining fully functional on Bash 3.2 and newer.
