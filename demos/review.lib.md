# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.25


```bash
task="Act as an Expert Software Engineer.
Do a Code Review of this script.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# Code Review – **ollama‑bash‑lib**  

*Version examined: `0.42.25` (2025)*  

---  

## 1. Overall Impression  

The library is a fairly complete Bash wrapper around the Ollama HTTP API.  
It provides a consistent debugging/error‑handling scheme, decent documentation
in the form of per‑function comments, and a clear public‑API (`ollama_…`).  

The code is mostly functional, but there are several **bugs, portability
issues, and maintainability concerns** that should be addressed before the
library is used in production or released publicly.

---  

## 2. Strengths  

| Aspect | Comments |
|--------|----------|
| **Modular design** – internal helpers (`_debug`, `_error`, `_call_curl`) are isolated from user‑facing functions. |
| **Extensive inline documentation** – each function includes a usage block, inputs, outputs, and return‑code expectations. |
| **Debug flag support** – `$OLLAMA_LIB_DEBUG` toggles verbose output without affecting normal operation. |
| **Turbo‑mode handling** – the library can switch between local and cloud endpoints and stores the API key in an env var. |
| **Safe‑mode option** – an attempt to sanitise control characters before feeding JSON to `jq`. |
| **Message‑store** – an array‑based message buffer makes building multi‑turn chats straightforward. |

---  

## 3. Critical Issues  

### 3.1 Safe‑mode logic is inverted  

```bash
_escape_control_characters() {
    if [ "$OLLAMA_LIB_SAFE_MODE" -ne "1" ]; then
      #_debug "_escape_control_characters: Safe Mode OFF"
      echo "$1"
      return 0
    fi
    ...
}
```

*Problem*: The function **does nothing** when `SAFE_MODE` is *off* (the intended default) and only runs the escaping routine when it is *on*.  

*Impact*: Users who enable safe‑mode (`OLLAMA_LIB_SAFE_MODE=1`) get the expected behaviour, but the default path (`0`) still calls the function, which merely echoes the input – no escaping occurs. This defeats the purpose of safe mode and makes the flag confusing.

*Fix*: Invert the test (or rename the flag to `OLLAMA_LIB_ESCAPE_CTRL`). Example:

```bash
_escape_control_characters() {
    if [ "${OLLAMA_LIB_SAFE_MODE:-0}" -ne 1 ]; then
        _debug "_escape_control_characters: Safe mode disabled → passthrough"
        printf '%s' "$1"
        return 0
    fi
    # ... perform escaping ...
}
```

### 3.2 Unquoted parameter expansions & array length tests  

Many tests use `${#array[@]}` without quoting:

```bash
if [ ${#OLLAMA_LIB_MESSAGES[@]} -eq 0 ]; then
```

If the array is unset or the script is executed with `set -u`, an *unbound variable* error is raised.  

*Fix*: Always quote expansions, even numeric ones:

```bash
if [ "${#OLLAMA_LIB_MESSAGES[@]}" -eq 0 ]; then
```

The same pattern appears in numerous places (`$OLLAMA_LIB_TURBO_KEY`, `$OLLAMA_LIB_DEBUG`, etc.).  

### 3.3 Inconsistent use of `[` vs `[[`  

`[` does not support pattern matching or the `-eq` when operands are empty, leading to cryptic `integer expression expected` errors.  

*Recommendation*: Use Bash’s `[[ … ]]` for all conditional tests involving variables:

```bash
if [[ "${OLLAMA_LIB_DEBUG:-0}" -eq 1 ]]; then …
```

### 3.4 Potential command‑injection in JSON construction  

The library builds JSON payloads by concatenating already‑escaped JSON fragments stored in the global `OLLAMA_LIB_MESSAGES` array:

```bash
messages_array_json=$(printf ",%s" "${OLLAMA_LIB_MESSAGES[@]}")
messages_array_json="[${messages_array_json:1}]"
```

If a message contains characters that need JSON escaping (e.g., `"` or newlines) the *already‑escaped* fragment may break the resulting JSON if the escaping routine was bypassed (safe mode off).  

*Impact*: Badly formed API requests → API errors or, in worst case, injection attacks when the server interprets malformed JSON.

*Fix*: Build the `messages` array **entirely with `jq`**, which guarantees proper escaping:

```bash
local messages_json
messages_json=$(jq -nc --argjson msgs "$(printf '%s\n' "${OLLAMA_LIB_MESSAGES[@]}" | jq -s '.') '$msgs')
```

Or, more directly:

```bash
local messages_json
messages_json=$(jq -n --argjson msgs "$(printf '%s\n' "${OLLAMA_LIB_MESSAGES[@]}" | jq -s .)" '$msgs')
```

### 3.5 Global variable leakage  

Functions such as `ollama_chat_json` assign to `content` without `local`:

```bash
content=$(_escape_control_characters "$result" | jq -r ".message.content")
```

This pollutes the global namespace and can unintentionally overwrite a variable with the same name in a caller’s context.

*Fix*: Declare all intermediate variables as `local`:

```bash
local content
content=$(_escape_control_characters "$result" | jq -r ".message.content")
```

### 3.6 Unreliable random selection  

```bash
RANDOM="$(date +%N | sed 's/^0*//')"   # seed random with microseconds
echo "${models[RANDOM%${#models[@]}]}"
```

*Problems*:

1. Overwrites Bash’s built‑in `RANDOM` variable, breaking any later use of it.  
2. `date +%N` can produce values with leading zeros; the `sed` command strips them, but if the result is empty (e.g., on systems that don’t support `%N`), `RANDOM` becomes empty → syntax error.

*Fix*: Use a *local* variable for seeding and preserve Bash’s `RANDOM`:

```bash
local seed
seed=$(date +%s%N)   # seconds + nanoseconds (POSIX‑compatible)
RANDOM=$((seed % 32768))   # reseed
echo "${models[RANDOM % ${#models[@]}]}"
```

Or simply rely on Bash’s built‑in randomisation without manual seeding.

### 3.7 Incomplete error handling for optional dependencies  

The library assumes `jq`, `curl`, and `column` are present, but many functions do not verify their existence before using them. For example, `ollama_generate_json` calls `jq` unconditionally.

*Impact*: On a system lacking `jq`, the script will exit with an obscure “command not found” error.

*Fix*: Add a helper that checks for required commands at load time or before each public function:

```bash
_require() {
    local missing=()
    for cmd in "$@"; do
        command -v "$cmd" >/dev/null || missing+=("$cmd")
    done
    if (( ${#missing[@]} )); then
        _error "Missing required command(s): ${missing[*]}"
        return 1
    fi
}
```

and invoke e.g. `_require jq curl` at the top of functions that need them.

### 3.8 Return‑code confusion in `_call_curl`  

When a POST request includes a JSON body, the function does:

```bash
echo "$json_body" | curl "${curl_args[@]}"
local error_curl=$?
if [ "$error_curl" -gt 0 ]; then
    _error "_call_curl: curl error: $error_curl"
    return "$error_curl"
fi
return 0
```

If `curl` exits with a **non‑zero status**, the function returns that exact status.  
Later callers (e.g., `ollama_api_post`) treat any non‑zero as *error* and also return the same code, which is fine.  

However, for **GET** requests the function simply `curl "${curl_args[@]}"` without capturing the exit status, then returns whatever `curl` returns implicitly. This inconsistency makes debugging harder.

*Fix*: Capture the status for both branches:

```bash
local curl_output
curl_output=$(curl "${curl_args[@]}")
local curl_rc=$?
printf '%s' "$curl_output"
return "$curl_rc"
```

(Or use `curl -f` to make it exit on HTTP errors.)

### 3.9 Use of `printf '%s' "$result" | jq -r .error` without guarding against *non‑JSON* output  

If the API returns plain text (e.g., when Ollama is not running), `jq` will exit with status 4, and the function reports a generic “error”.  
A more user‑friendly message could be added.

### 3.10 Documentation typos & consistency  

* `ollama_show_json` comment ends with `json, to stdoutF` (extra “F”).  
* Some comments claim “Return 0 on success, 1 on error” but the implementation returns the actual curl exit code (e.g., 7 for connection refused).  

While not functional bugs, they create confusion for callers.

---  

## 4. Recommendations & Best‑Practice Improvements  

Below are concrete steps to improve reliability, security, and maintainability.

### 4.1 Refactor the “core” helpers  

Create a small *initialisation* block at the top of the script:

```bash
# ------------------------------------------------------------------
#  Initialization
# ------------------------------------------------------------------
set -o errexit   # abort on unhandled errors
set -o pipefail  # propagate failures through pipes
set -o nounset   # treat unset variables as errors
# Optional: set -o errtrace for better stack traces
```

Wrap all helper functions in a namespace (e.g., prefix `ollama_` for public, `_ollama_` for private) to avoid name clashes.

### 4.2 Consolidate environment‑variable defaults  

```bash
: "${OLLAMA_HOST:=http://localhost:11434}"
: "${OLLAMA_LIB_API:=${OLLAMA_HOST}}"
: "${OLLAMA_LIB_DEBUG:=0}"
: "${OLLAMA_LIB_STREAM:=0}"
: "${OLLAMA_LIB_SAFE_MODE:=0}"
```

Using `:` ensures the variable is always defined, removing the need for many `-z` checks.

### 4.3 Centralise command‑dependency checks  

```bash
_ensure_deps() {
    _require curl jq
    # column is optional – only for `ollama_lib_about`
}
_ensure_deps   # run when the library is sourced
```

### 4.4 Safer JSON construction with `jq`  

All payloads should be built via `jq`:

```bash
json_payload=$(jq -n \
    --arg model "$1" \
    --arg prompt "$2" \
    --argjson stream "$OLLAMA_LIB_STREAM" \
    '{model:$model, prompt:$prompt, stream:$stream}')
```

When adding a message:

```bash
ollama_messages_add() {
    local role=$1 content=$2
    OLLAMA_LIB_MESSAGES+=("$(jq -nc --arg role "$role" --arg content "$content" '{role:$role, content:$content}')")
}
```

This eliminates manual escaping bugs.

### 4.5 Improve streaming handling  

The current stream functions rely on `jq -j '.response'` which discards newlines.  
If the user wants to preserve the exact streaming output, use `jq -r` (raw output) and avoid `-j`:

```bash
jq -r '.response'   # prints each chunk as it arrives, preserving newlines
```

Also, the `while IFS= read -r -d '' chunk` construct is unnecessary; `jq` already streams correctly.

### 4.6 Add unit‑tests  

Create a `tests/` directory with **BATS** (Bash Automated Testing System) or plain Bash test scripts that:

* Verify that `ollama_lib_version` returns the expected string.  
* Confirm that `ollama_messages_add` correctly JSON‑escapes special characters.  
* Mock `curl` (using a wrapper script) to exercise error paths (connection failure, non‑200 HTTP).  

Continuous Integration (GitHub Actions) can run these tests on every push.

### 4.7 Reduce global state  

Expose a `ollama_new_context` function that returns a *opaque* identifier (e.g., an associative array name) and stores per‑context data (`messages`, `stream`, `safe_mode`) there. This would enable multiple concurrent chats within the same shell.

### 4.8 Minor style clean‑ups  

* Use `local` for *every* variable inside functions.  
* Prefer `printf '%s\n'` over `echo` for predictable handling of backslashes and `-n`.  
* Quote all parameter expansions, even when they appear inside `[[ … ]]`.  
* Use `$'\n'` or `printf '\n'` instead of literal newlines inside `printf` format strings.  

---  

## 5. Summary of Action Items  

| # | Issue | Suggested Fix |
|---|-------|----------------|
| 1 | Safe‑mode logic inverted | Invert test or rename flag; ensure default is *no escaping*. |
| 2 | Unquoted `${#array[@]}` tests | Quote all expansions. |
| 3 | Use of `[` with possibly empty vars | Switch to `[[ … ]]`. |
| 4 | JSON construction from raw strings | Build payloads exclusively with `jq`. |
| 5 | Global variable leakage (`content`, `result`) | Declare all intermediate vars as `local`. |
| 6 | Overwriting Bash’s built‑in `RANDOM` | Use a local seed variable; avoid manual reseeding. |
| 7 | Missing dependency checks | Add `_require` helper and call at load time. |
| 8 | Inconsistent `_call_curl` return handling | Capture status for both GET and POST paths. |
| 9 | Poor error messages for non‑JSON API replies | Detect non‑JSON and emit user‑friendly error. |
|10 | Documentation typos & mismatched return‑code description | Clean up comments; document real exit‑codes. |
|11 | Lack of tests | Implement BATS tests for core functions. |
|12 | Global state prevents concurrent chats | Consider a context object / associative array. |
|13 | Miscellaneous style (echo vs printf, quoting, local) | Apply consistent Bash best‑practice style. |

Addressing the items above will make the library:

* **More robust** – fewer runtime crashes, safer handling of edge‑cases.  
* **More secure** – proper JSON escaping prevents injection attacks.  
* **Easier to maintain** – clear separation of public vs private functions, reduced global state.  
* **Better user experience** – helpful error messages and deterministic exit codes.

---  

### Closing Note  

The author has done a commendable job providing a functional wrapper around a modern HTTP API using only Bash and common Unix tools. With the corrections and refinements suggested, the library can become a reliable component for scripts that need to interact with Ollama in both local and cloud (Turbo) configurations.  

Happy coding! 🚀  
