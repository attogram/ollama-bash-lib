# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.43


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Security Review – Ollama Bash Library  
**Target Bash version:** ≥ 3.2  

---

## 1.  Overview  

The script implements a fairly large Bash “library” for interacting with the Ollama API (both local and cloud‑based).  
It provides helper functions for:

* HTTP calls via `curl` (`_call_curl`, `ollama_api_*`)  
* JSON handling via `jq` (`_is_valid_json`, payload builders)  
* Message‑stack management (`ollama_messages_*`)  
* Chat / generation endpoints (streaming & non‑streaming)  
* Miscellaneous utilities (model listing, version info, environment inspection)  

Overall the code is well‑structured, uses arrays, and makes good use of `curl` argument arrays to avoid word‑splitting issues.  

Nevertheless, a number of security‑relevant concerns and hardening opportunities exist, especially around **input handling**, **command execution**, and **environment exposure**.

---

## 2.  Security Findings  

| # | Area | Issue | Severity | Explanation |
|---|------|-------|----------|-------------|
| 1 | **`ollama_eval` / `oe`** | **Unsanitised `eval` of LLM‑generated code** | Critical | The function obtains a one‑liner from the LLM (`ollama_generate`) and, after a simple *y/n* prompt, runs `eval "$cmd"`. The LLM output is **untrusted**; a compromised or malicious model can embed malicious shell syntax, arbitrary commands, or code that modifies the environment. |
| 2 | **`read` for permission** | No strict validation of the answer | Medium | The script accepts any string equal to `y`. An attacker could supply `yes`, `Y`, or a trailing newline to bypass the prompt if the script is wrapped in another automation. |
| 3 | **Environment variable exposure** | `OLLAMA_LIB_TURBO_KEY` stored in a normal shell variable (visible to `ps`/`/proc`) | Medium | When Turbo mode is enabled, the API key is stored in a plain variable and later exported as `OLLAMA_HOST`. If the script is run with `set -x` (debug) or the process is inspected (e.g., via `ps eww`), the key could be read. |
| 4 | **Lack of strict Bash options** | No `set -euo pipefail`, no `IFS` sanitisation | Medium | Errors are not fatal by default; the script may continue with partially‑initialised state, leading to undefined behaviour. |
| 5 | **External command reliance without fallback** | Functions assume presence of `jq`, `curl`, `ollama`, `column`, `compgen` | Low | If any of these binaries are missing or replaced with malicious versions (e.g., via a compromised `$PATH`), the script may fail or execute malicious code. |
| 6 | **Potential command injection in `_call_curl`** | `json_body` is piped via `echo "$json_body"` | Low | `echo` interprets back‑slash escape sequences (e.g., `\n`, `\c`). A crafted payload containing `\c` could truncate the JSON sent to the server. Using `printf %s` would be safer. |
| 7 | **`_exists` uses `command -v`** | May be tricked by alias or function shadowing | Low | An attacker who can influence `$PATH` could place a malicious executable earlier in the path, causing the script to call the wrong program. |
| 8 | **Array handling for messages** | No bounds checking | Low | A very large number of messages could exhaust memory, leading to denial‑of‑service. |
| 9 | **Error handling of `jq`** | `_is_valid_json` treats any non‑zero exit‑code as an error but still proceeds in callers that ignore the return value | Low | Calls that do not check the result (e.g., `ollama_generate_stream`) may process malformed JSON. |
|10| **Use of `RANDOM%${#array[@]}`** | In Bash 3.2, `$RANDOM` is 0‑32767 and not cryptographically strong | Low | For non‑security‑critical random model selection it is fine, but it should be noted that it is not suitable for security‑critical randomness. |

---

## 3.  Compatibility with Bash 3.2  

| Feature | Compatibility | Comments |
|---------|----------------|----------|
| Indexed arrays (`ARR=()`, `ARR+=()`) | ✅ | Supported since Bash 2.0 |
| `local` in functions | ✅ | Supported |
| `[[ … ]]` test construct | ✅ | Supported |
| `${var:-default}` parameter expansion | ✅ | Supported |
| Process substitution `< <(...)` | ✅ | Supported |
| `$(( ))` arithmetic expansion | ✅ | Supported |
| `command -v` | ✅ | Supported |
| `printf -v` (not used) | — | Not required |
| `declare -A` (associative arrays) | **Not used** | Good – avoided for compatibility |
| `${BASH_VERSION}` usage | ✅ | Variable exists |
| `(( OLLAMA_LIB_DEBUG ))` arithmetic test | ✅ | Works |

Overall the script should run unchanged on Bash 3.2. The only possible snag is the use of `[[ -n "${OLLAMA_LIB_TURBO_KEY}" ]]` where the variable may be undefined; Bash treats an undefined variable as empty, which is fine.  

**Conclusion:** No Bash‑3.2 incompatibilities were detected.

---

## 4.  Recommendations  

### 4.1  Eliminate / Harden `eval`  

* **Never** directly `eval` output from an LLM.  
* Replace the interactive flow with a **sandboxed execution** (e.g., run the command in a subshell with `set -euo pipefail` and a restricted `PATH`).  
* If execution is absolutely required, prompt the user *twice* and display the command in a read‑only manner, or require explicit `sudo`/`chmod` to run it.

```bash
if [[ "$permission" == y ]]; then
    printf '%s\n' "Running under restricted PATH..."
    PATH="/usr/bin:/bin" bash -c "$cmd"
fi
```

### 4.2  Strengthen Permission Prompt  

```bash
read -r -p "Run command (y/N)? " permission
case "$permission" in
    [Yy]) ;;    # proceed
    *) return 0 ;;
esac
```

### 4.3  Protect Sensitive Variables  

* Store the Turbo API key in a **temporary file with restrictive permissions** (`mktemp -p "$HOME/.config/ollama"`) and read it only when needed.  
* Unset it (`unset OLLAMA_LIB_TURBO_KEY`) as soon as the request finishes.  
* Do **not** export the key; avoid `export OLLAMA_HOST` if it leaks via environment.

### 4.4  Adopt Strict Bash Options  

Add at the very top of the library (or require the caller to source it with these set):

```bash
set -euo pipefail
IFS=$'\n\t'   # safer field splitting
```

Wrap any function that must tolerate failures with `set +e`/`set -e` locally.

### 4.5  Verify External Dependencies  

Provide a **bootstrap check** before any API call:

```bash
_require_cmd() {
    local cmd=$1
    if ! command -v "$cmd" >/dev/null 2>&1; then
        _error "Required command '$cmd' not found"
        return 1
    fi
}
```

Call `_require_cmd curl` and `_require_cmd jq` early, and abort if missing.

### 4.6  Safer JSON Transmission  

Replace:

```bash
echo "$json_body" | curl "${curl_args[@]}"
```

with:

```bash
printf '%s' "$json_body" | curl "${curl_args[@]}"
```

`printf` does not interpret back‑slash escapes.

### 4.7  Harden `_exists`  

Prefer `type -P` over `command -v` to avoid functions/aliases:

```bash
_exists() { type -P "$1" >/dev/null 2>&1; }
```

### 4.8  Limit Message Stack Size  

Add a simple guard:

```bash
MAX_MESSAGES=1024
ollama_messages_add() {
    (( ${#OLLAMA_LIB_MESSAGES[@]} < MAX_MESSAGES )) || {
        _error "Message stack limit reached"
        return 1
    }
    ...
}
```

### 4.9  Log Sensitive Operations Carefully  

When `OLLAMA_LIB_DEBUG=1`, the script prints request payloads – this could expose API keys or confidential prompts. Recommend disabling debug in production or redacting sensitive fields:

```bash
_debug() {
    (( OLLAMA_LIB_DEBUG )) || return
    local msg=$1
    # simple redaction example
    msg=${msg//"${OLLAMA_LIB_TURBO_KEY}"/'[REDACTED]'}
    printf "[DEBUG] %s\n" "$msg" >&2
}
```

### 4.10  Document Threat Model  

Add a **Security Considerations** section in the README describing:

* The risk of running LLM‑generated code.  
* The importance of protecting the Turbo API key.  
* Recommendations for running the library inside a container or isolated environment.

---

## 5.  Summary of Action Items  

| Action | Priority |
|--------|----------|
| Remove or sandbox `eval` in `ollama_eval` / `oe`. | **Critical** |
| Harden the user confirmation prompt. | Medium |
| Store Turbo API key securely and avoid exporting it. | Medium |
| Add `set -euo pipefail` (or require callers to set). | Medium |
| Verify required commands early and abort if missing. | Low |
| Replace `echo` with `printf` for JSON payloads. | Low |
| Use `type -P` in `_exists` to avoid alias hijacking. | Low |
| Impose a maximum size on `OLLAMA_LIB_MESSAGES`. | Low |
| Redact sensitive data when `DEBUG` is enabled. | Low |
| Update documentation with security guidance. | Low |

Implementing the *critical* fix (removing arbitrary `eval`) eliminates the biggest attack surface. The remaining mitigations further reduce risk, improve robustness, and keep the library friendly for Bash 3.2 environments.
