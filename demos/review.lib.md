# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.27


```bash
task="Act as an Expert Software Engineer.
Do a Code Review of this script.
Require that script works in Bash v3 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:20b" "$task\n\n$(cat "$file")"
```
# Bash Script Code‑Review  
**Target environment:** Bash 3 or higher (i.e. Bash 3.1+).  

Below is a line‑by‑line / section‑by‑section review with focus on portability, correctness, and best practices.

---

## 1. Global / Header

```bash
#!/usr/bin/env bash
```

* **Good** – uses the shebang that works on most Linux/Unix systems.  
* However, the comment header contains the line `# Ollama Bash Lib - A Bash Library to interact with Ollama`.  
  That is fine, no issues.

---

## 2. Global Variables

```bash
OLLAMA_LIB_API="${OLLAMA_HOST:-"http://localhost:11434"}"
```

* Uses `${VAR:-default}` – supported in Bash 3.  
* **Recommendation** – For readability, quote the default:  
  `OLLAMA_HOST=${OLLAMA_HOST:-http://localhost:11434}`  
  (the inner quotes are not needed unless the default contains whitespace).

```bash
OLLAMA_LIB_MESSAGES=()  # Array of messages
```
* Arrays are supported in Bash 3.1+.  

---

## 3. Helper Functions

### 3.1 `_debug`

```bash
_debug() {
  (( OLLAMA_LIB_DEBUG )) || return
  printf "[DEBUG] $(date '+%H:%M:%S:%N'): %s\n" "$1" >&2
}
```

* **Portability** – `date '+%N'` (nanoseconds) is **GNU date only**.  
  On BSD/macOS it might not exist, causing the function to fail.  
  *Fix*: Use `date '+%H:%M:%S'` or provide a fallback.

| Change | Reason |
|--------|--------|
| `date '+%H:%M:%S:%N'` → `date '+%H:%M:%S'` | Works on all `date` versions. |
| Add a conditional check for `%N` existence if nanoseconds are required. | Preserve precision when available. |

### 3.2 `_error`

```bash
_error() {
  printf "[ERROR] %s\n" "$1" >&2
}
```

* **Works** – no issues.

### 3.3 `_required`

```bash
_required() {
  local cmd="$1"
  if [[ -z "$cmd" ]]; then
    _debug '_require called without a command name. Usage: _require "command"'
    return 1
  fi
  command -v "$cmd" >/dev/null
  local command_error=$?
  if (( "$command_error" > 0 )) then
    return 0 # command exists
  fi
  return 1 # command is missing
}
```

This function contains **two fatal bugs**:

| Problem | Detail | Fix |
|---------|--------|-----|
| **Reversed logic** | Returns `0` (= success) when command is missing, and `1` (= failure) when found. | Use `if (( command_error  != 0 )); then return 1; else return 0; fi`. |
| **Bad `if` syntax** | `if (( "$command_error" > 0 )) then` – missing `;` or newline before `then`. | `if (( command_error > 0 )); then … fi`. |

**Portability note** – `local` is Bash 3‑friendly, but the `(( ))` arithmetic syntax is fine in Bash 3.

### 3.4 `_escape_control_characters`

```bash
_escape_control_characters() {
  if [ "$OLLAMA_LIB_SAFE_MODE" -ne "1" ]; then
    echo "$1"
    return 0
  fi
  ...
  printf -v chr '\\%03o' "$b"
  out+="$(printf '%b' "$chr")"
  ...
}
```

#### Issues

1. **`printf -v`** – **requires Bash 4+**. Bash 3 does not support `-v`.  
2. **Efficiency** – `printf '%b'` processes each byte individually; for long strings this is a bit slow but acceptable.

#### Fix (compatible with Bash 3)

```bash
# Inside the loop where $b is a decimal byte value
chr=$(printf '\\%03o' "$b")
out+=$(printf '%b' "$chr")
```

This eliminates the need for `printf -v` and still gives the same result.

3. **`if [ "$OLLAMA_LIB_SAFE_MODE" -ne "1" ]; then`**  
   Works fine but could be more robust:

```bash
if [[ "$OLLAMA_LIB_SAFE_MODE" -ne 1 ]]; then
```

### 3.5 General Comments on Helpers

* All debug prints use `$1`, but any multiline strings will lose line breaks.  
  In most cases this is fine, but if the debug message contains newlines, formatting may get messy.  
* There is no `set -e` or `set -u`; the script deliberately continues even on errors (which may be intentional, but document the choice).

---

## 4. API Wrapper Functions

### 4.1 `_call_curl`

```bash
_call_curl() {
  _debug "_call_curl: [$1] [$2] [${3:0:120}]"
  _debug "_call_curl: OLLAMA_LIB_API: $OLLAMA_LIB_API"
  ...
  if [[ -n "${json_body}" ]]; then
    curl_args+=( "-d" "@-" )
    echo "$json_body" | curl "${curl_args[@]}"
    local error_curl=$?
    if [ "$error_curl" -gt 0 ]; then
      _error "_call_curl: curl error: $error_curl"
      return "$error_curl"
    fi
    return 0
  fi
  curl "${curl_args[@]}"
}
```

* Uses `-N` for all calls – it's harmless but unnecessary for non-streaming requests.  
* **Potential issue** – if `${json_body}` contains a single dash (`-`), `curl_args+=( "-d" "@-" )` will make curl read from stdin, but `echo "$json_body"` will strip leading/trailing newlines if any.  
  *Fix*: `printf '%s' "$json_body" | curl ...` or `printf '%s\n' "$json_body" | ...`.

* The function mixes `printf` debug with `printf` inside the loop; keep consistent.

### 4.2 `ollama_api_get`, `ollama_api_post`

Straightforward wrappers; no portability problems.

### 4.3 `ollama_api_ping`

```bash
ollama_api_ping() {
  _debug 'ollama_api_ping'
  if [[ -n "${OLLAMA_LIB_TURBO_KEY}" ]]; then
    _debug "ollama_api_ping: function not available in Turbo Mode"
    return 0
  fi
  local result
  if ! result="$(ollama_api_get "")"; then
    _debug "ollama_api_ping: result=ollama_api_get failed"
    return 1
  fi
  if [[ "$result" == "Ollama is running" ]]; then
    return 0
  fi
  _debug "ollama_api_ping: unknown result: [${result:0:42}...]"
  return 1
}
```

* Calling `ollama_api_get ""` (empty endpoint) may return an error or a server health page depending on the server version.  
  *Potential improvement:* Accept a health‑check endpoint `/api/health` or `/api/version`.  
  *But functionally fine.*  

---

## 5. Model Generation Functions

### 5.1 `ollama_generate_json`

```bash
local stream_bool=true
if [[ "$OLLAMA_LIB_STREAM" -eq "0" ]]; then
  stream_bool=false
fi
...
json_payload="$(jq -c -n --arg model "$1" \
    --arg prompt "$2" \
    --argjson stream "$stream_bool" \
    '{model: $model, prompt: $prompt, stream: $stream}')"
```

* The `$stream_bool` variable is a shell value (`true`/`false`).  
  *`jq --argjson` expects JSON, so passing the string “true” or “false” *works* because jq parses them as booleans.*  
  *Better to use the `true`/`false` shell syntax without quotes, or pass `--argjson stream "$stream_bool"` as is.*

* **Issue** – If `$1` (model) or `$2` (prompt) contain single quotes, `jq` will handle them through `--arg` (which quotes appropriately).  
  *Good.*  

### 5.2 `ollama_generate`

```bash
result="$(ollama_generate_json "$1" "$2")"
...
if ! _escape_control_characters "$result" | jq -r ".response"; then
```

* `result` is captured in a variable; if the JSON contains newlines, `result` will preserve them (fine).  
* `_escape_control_characters` may produce a huge string which is then passed to `jq`.  
  *No issue.*  

### 5.3 `ollama_generate_stream_json`

```bash
OLLAMA_LIB_STREAM=1
if ! ollama_generate_json "$1" "$2"; then
  ...
fi
OLLAMA_LIB_STREAM=0
```

* Works, but does *not* capture `stdout` into a variable.  
  *Potential improvement*: Provide a return value or stream directly to caller.  
  *Though intended to just forward output.*  

### 5.4 `ollama_generate_stream`

```bash
if [[ "$OLLAMA_LIB_SAFE_MODE" -eq 1 ]]; then
  ollama_generate_json "$1" "$2" |
    _escape_control_characters |
    jq -j '.response' |
    while IFS= read -r -d '' chunk; do
      printf '%s' "$chunk"
    done
else
  ollama_generate_json "$1" "$2" |
    jq -j '.response'
fi
```

* **Bug** – `-d ''` is *read until a null byte*. The `jq -j` output contains no null bytes, so `read` will block until EOF, putting the *entire* stream into a single `chunk`.  
  *Result*: The loop runs once, printing the whole output – effectively the same as `jq -j`. The streaming behavior is lost.  
  *Fix*: Remove the `while` and just pipe directly:  
  ```bash
  ollama_generate_json "$1" "$2" | _escape_control_characters | jq -j '.response'
  ```  
  If you truly need incremental processing, use `jq --stream` or process in chunks via `awk` or `sed`.  

* **Other** – In the safe‑mode branch the `printf '%s' "$chunk"` is redundant; just `cat` would work.

---

## 6. Message Functions

### 6.1 `ollama_messages`

```bash
if [[ ${#OLLAMA_LIB_MESSAGES[@]} -eq 0 ]]; then
  _debug "ollama_messages: no messages"
  return 1
fi
printf '%s\n' "${OLLAMA_LIB_MESSAGES[@]}"
```

* **Issue** – The function returns `1` when there are no messages, making the calling code think an error occurred.  
  *Better*: Return `0` even if empty, or document that `1` indicates "no messages".  
  *Also* consider `if (( ${#OLLAMA_LIB_MESSAGES[@]} == 0 ));` for Bash 3 arithmetic syntax.  

### 6.2 `ollama_messages_add`

```bash
json_payload="$(jq -c -n \
      --arg role "$1" \
      --arg content "$2" \
      '{role: $role, content: $content}')"
OLLAMA_LIB_MESSAGES+=("$json_payload")
```

* Works; no portability concerns.

### 6.3 `ollama_messages_clear`, `ollama_messages_count`

* Straightforward and correct.

---

## 7. Chat Functions

### 7.1 `ollama_chat_json`

```bash
local messages_array_json
messages_array_json="$(printf ",%s" "${OLLAMA_LIB_MESSAGES[@]}")"
messages_array_json="[${messages_array_json:1}]"
```

* **Potential bug** – If any message contains a comma, the join will still work because commas inside each JSON object are part of the string; they won't break the array syntax.  
  **Note:** If a message contains a newline, this will also be part of the array and may break the JSON format. Messages are expected to be single‑line JSON – fine.  

### 7.2 `ollama_chat_stream`

```bash
OLLAMA_LIB_STREAM=1
if ! ollama_chat "$1"; then
  ...
fi
```

* `ollama_chat` sets `OLLAMA_LIB_STREAM=0` internally; calling that after setting it to `1` will immediately clear it, so the call actually runs a *non‑streaming* chat.  
  *Fix*: Replace `ollama_chat` with the streaming variant (`ollama_chat_stream_json` or `ollama_chat_stream_json`), or avoid resetting `OLLAMA_LIB_STREAM` within `ollama_chat`.  

---

## 8. List / Model / Process / Show Functions

* Mostly thin wrappers invoking an external program (`ollama`) – no portability issues.  
* `ollama_list_array` uses `read -r -a` and `ollama list | awk...` – works under Bash 3.

* **Potential issue** – The `awk` command used to filter the header (`NR > 1`) assumes the output header is exactly one line. If the format changes, the filtering might break. A more robust approach would be to parse columns directly with `cut -d " " -f1`.  

---

## 9. App Functions

### 9.1 `ollama_app_turbo`

```bash
local host_api
...
export OLLAMA_HOST="$host_api"
export OLLAMA_LIB_API="$host_api"
```

* **Bug** – `OLLAMA_HOST` should be the *host* **without** the API path (`https://ollama.com`).  
  `ollama_app_turbo` sets it correctly.  
  *However*, `_call_curl` uses `${OLLAMA_LIB_API}${endpoint}`.  
  When in Turbo mode, `OLLAMA_LIB_API` becomes `https://ollama.com`.  
  The endpoint is `/api/generate`, so the full URL is `https://ollama.com/api/generate` – correct.  
  No issue.

### 9.2 `ollama_app_installed`

```bash
return "$(_required "ollama")"
```

* Because `_required` is inverted, this function will return `0` when `ollama` is *missing* and `1` when found – opposite of the documented behavior.  
  *Need to patch `_required` first.*

---

## 10. Miscellaneous

### 10.1 Use of `set -e` / `set -u`

* The script intentionally continues on errors (e.g., optional dependencies).  
  *If strictness is desired, consider adding `set -euo pipefail` with appropriate checks for Bash 3.*

### 10.2 Quoting and word splitting

* The script generally quotes variables properly.  
  *Minor suggestion:* Use `printf` instead of `echo` for debug messages to avoid `-e`/`-n` side effects.

---

## 11. Summary of Critical Issues (Bash 3)

| # | Issue | Location | Fix |
|---|--------|----------|-----|
| 1 | `_required` returns incorrect status (reversed logic) and contains invalid `if` syntax. | `_required` | Correct logic: `if (( command_error != 0 )); then return 1; else return 0; fi`. |
| 2 | Use of `printf -v` in `_escape_control_characters`, not supported in Bash 3. | `_escape_control_characters` | Replace with `chr=$(printf '\\%03o' "$b")`. |
| 3 | `while IFS= read -r -d ''` in `ollama_generate_stream` prevents streaming. | `ollama_generate_stream` | Remove the loop or use a different streaming mechanism. |
| 4 | `ollama_chat_stream` resets `OLLAMA_LIB_STREAM` inside `ollama_chat`. | `ollama_chat_stream` | Use streaming variant directly or avoid resetting. |
| 5 | `ollama_messages` returns `1` when empty (treated as error). | `ollama_messages` | Return `0` or document expected behavior. |
| 6 | `date '+%N'` may not exist on BSD/macOS. | `_debug` | Replace or add fallback. |
| 7 | `ollama_chat_json`: `json_payload` built by concatenating array elements; if an element contains newline, JSON breaks. | `ollama_chat_json` | Document that messages must be single-line or use jq's `-s` to construct array. |
| 8 | Several debug prints use `$(date '+%H:%M:%S:%N')` which may include a newline. | `_debug` | Acceptable but ensure no formatting issues. |

---

## 12. Recommendations for Improvement

| Category | Recommendation |
|----------|----------------|
| **Portability** | Replace Bash‑4+ features (`printf -v`, `${...:+...}`) with Bash‑3 compatible alternatives. |
| **Error handling** | Use explicit return codes, and avoid returning non‑zero for normal conditions (e.g., empty message list). |
| **Readability** | Group related functions into sections; add more comments explaining behavior, especially for streaming logic. |
| **Testing** | Add unit tests (e.g., using `bats`) covering: CLI presence, API call responses, safe mode handling, streaming behavior. |
| **Safety** | Escape user-provided inputs when constructing JSON; although `jq --arg` handles quoting, verify that no injection is possible. |
| **Performance** | In `ollama_generate_stream`, consider streaming via `jq --stream` rather than buffering entire output. |

---

## 13. Final Verdict

The library is a solid foundation for interacting with Ollama from Bash.  
After correcting the identified bugs and ensuring Bash 3 compatibility, it will function correctly across a wide range of environments.  
Implementation of the suggested fixes will make the code more robust, maintainable, and portable.
