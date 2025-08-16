# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2


```bash
task="Act as an Expert Software Engineer.
Do a Code Review of this script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
# <thinking>
# The user wants a code review of the script, ensuring it works on Bash v3.2+. Output in markdown. Need to examine issues: portability, Bash 3.2 compatibility (no associative arrays, no ${var//...} maybe works, but need to check features like [[ ]] and arithmetic, arrays, process substitution <(...). Bash 3.2 supports arrays, but not some newer features like ${var^^} lower/upper case, but not used. Some constructs: "${var//"${OLLAMA_LIB_TURBO_KEY}"/'[REDACTED]'}" requires pattern replacement, supported. Use of (( OLLAMA_LIB_DEBUG )) arithmetic expansion, works. Use of ${BASH_VERSION} might work. The script uses some constructs: "local -a"? not. Use of ${var:0:120} substring, works in Bash 3.2? Yes substring expansion works. Use of "printf '%s' "$json_body" | curl "${curl_args[@]}"". Bash 3.2 supports arrays. Use of "${!array[@]}"? Not seeing. Use of "${OLLAMA_LIB_MESSAGES[@]}" works.

Potential issues: Use of "shopt -s inherit_errexit"? Not present. Use of "pipefail" is set -o pipefail, available in Bash 3.2? I think pipefail support added earlier? Not sure. I think pipefail exists in Bash 3.0+. Should be fine.

Process substitution: < <(...) used in ollama_list_array and in other functions: while IFS= read -r line; do ... done < <(ollama list | awk ...) - That is supported.

Use of "timeout" command may not be present; code handles absence.

Use of "printf '%s' "$result" | jq -r '.error // empty'" etc.

Potential bug: In _call_curl, they check json_body validity even when json_body is empty? They call _is_valid_json "$json_body". If json_body empty, jq will read empty string, which may error: _is_valid_json will attempt to pipe empty string to jq -e '.' which will cause error (jq: error: Invalid numeric literal at <stdin>:1). That would cause error. For GET requests they pass no json_body, causing error. However earlier they check if json_body empty? They call _call_curl "GET" "$1". So json_body is empty, but _call_curl then does _is_valid_json "$json_body". That will cause failure. Indeed they should skip JSON validation when body empty. So bug.

Also in _call_curl they limit method to GET or POST; they use curl -X "$method". For GET they also pass -d maybe not. Fine.

Another issue: In _call_curl they use: curl_args+=( "-X" "${method}" ) # GET or POST. For GET they also include -d if json_body present (won't). okay.

The use of _debug date_string: they rely on date '+%H:%M:%S:%N', %N not available on some platforms (BSD). They fallback.

Potential quoting issues: In _ollama_thinking_stream they read -r -n 1 chunk && [[ -n "$chunk" ]]; they then cat >&2. Might not handle empty streams.

Return codes: some functions use return $?, fine.

The script uses "printf '%s\n' "$result"" but prints with newline.

Check OLLAMA_LIB_DEBUG default 0, fine.

Potential missing quotes around variables in arrays expansions.

Overall good but adjustments needed for Bash 3.2: Use of ${array[@]} with quoting may cause word splitting; but fine.

Need to mention that they use 'local' inside functions, which is fine.

Potential use of "declare -A" not present.

Thus code review includes positive aspects, suggestions, bug fixes (JSON validation for empty bodies, proper error handling, consistent quoting, avoid process substitution for portability, handle missing jq more gracefully, unify exit codes, improve documentation, ensure OLLAMA_LIB_MESSAGE array JSON escaping, maybe use printf '%s' instead of echo.

Will produce markdown sections: Summary, Compatibility, Style, Bugs/Issues, Recommendations, Conclusion.
# </thinking>

# Code Review – **Ollama Bash Lib**  

**Target Bash version:** ≥ 3.2  

---

## 1️⃣ Overview  

The script implements a fairly complete Bash “library” for talking to the Ollama API.  
It supplies:

* Low‑level helpers (`_debug`, `_error`, `_exists`, `_is_valid_json`, `_call_curl` …)  
* High‑level API wrappers (`ollama_generate*`, `ollama_chat*`, model/ps/show utilities, etc.)  
* Convenience aliases (`og`, `oc`, `oap` …)  

Overall the code is well‑structured, heavily commented, and makes good use of Bash features such as arrays, process substitution, and function‑scoped locals.

---

## 2️⃣ Compatibility with Bash 3.2  

| Feature | Bash 3.2 support | Status |
|---------|------------------|--------|
| Arrays (`myarray=()`, `${array[@]}`) | ✅ | OK |
| `local` inside functions | ✅ | OK |
| Parameter substitution `${var//search/replace}` | ✅ | OK |
| Substring `${var:0:42}` | ✅ | OK |
| Arithmetic `(( … ))` | ✅ | OK |
| Process substitution `< <(...)` | ✅ (available since 2.x) | OK |
| `set -o pipefail` | ✅ (added in 3.0) | OK |
| `[[ … ]]` test command | ✅ | OK |
| `printf %s` with quoted arguments | ✅ | OK |
| **Potential incompatibility**: none of the constructs require Bash 4+ (no associative arrays, no `declare -n`, no `${var^^}`).  

**Conclusion:** The script should run on Bash 3.2 **provided** the external commands (`curl`, `jq`, `sed`, `awk`, `date`, etc.) are present.

---

## 3️⃣ Strengths  

| Area | Comments |
|------|----------|
| **Modular design** – All internal helpers are prefixed with `_` and documented. |
| **Debug/Redaction** – `_debug` respects `OLLAMA_LIB_DEBUG` and uses `_redact` to hide the Turbo API key. |
| **Graceful fallback** – `_debug` attempts `date +%N` and falls back when unsupported. |
| **Streaming support** – Separate functions for JSON vs. text streaming (`*_stream*`). |
| **Safety checks** – `_exists`, `_is_valid_json`, and optional `timeout` for syntax validation in `ollama_eval`. |
| **Extensive help strings** – Each public function contains a usage comment block. |
| **Convenient aliases** – Short one‑letter commands (`og`, `ocj`, `ot`, …). |
| **Portability** – No Bash‑4‑only syntax, making it usable on older macOS/BSD systems. |

---

## 4️⃣ Issues & Bugs  

| # | Location | Problem | Impact | Suggested Fix |
|---|----------|----------|--------|----------------|
| 1 | `_call_curl` (line 122‑129) | Calls `_is_valid_json "$json_body"` **even when `$json_body` is empty** (e.g. a GET request). `jq` on an empty string exits with error → `_call_curl` aborts GETs. | GET requests (`ollama_api_get`, `ollama_api_ping`, `ollama_list_json`, …) always fail. | Skip JSON validation when `$json_body` is empty: `[[ -n $json_body ]] && _is_valid_json "$json_body" || true`. |
| 2 | `_call_curl` (line 150‑157) | When a JSON body is present, `curl` is invoked with `-d @-` and the body is piped via `printf`. If the body contains new‑lines, `printf` does not preserve them correctly in all locales. | Rare, but malformed payload could be sent. | Use `printf '%s' "$json_body"` **or** `cat <<<"$json_body"` – both are already used, but ensure `printf '%s'` is retained. No functional change needed, just note the intent. |
| 3 | `_ollama_thinking_stream` – reads a *single* character (`-n 1`) before deciding to emit tags. If the stream starts with whitespace, the function may skip the tags. | Thinking output may be suppressed for some streams. | Remove the `-n 1` guard and simply wrap the whole stdin: `printf '# <thinking>\n'; cat; printf '# </thinking>\n\n'`. |
| 4 | `ollama_messages` – builds a JSON array by concatenating array elements with `printf "%s," … | If any element itself contains a comma, the resulting JSON is still valid (elements are already JSON objects), but no quoting is applied. The function **does not escape** possible embedded newlines in the stored messages, which may break downstream `jq` parsing. | Store messages already JSON‑escaped (already done via `jq -c -n …`), so risk is low, but document the requirement. |
| 5 | `ollama_eval` – dangerous‑command detection uses a regex built from an array and `\b` word‑boundary. Bash 3.2 regex engine does **not** understand `\b`. | The detection may miss dangerous tokens on Bash 3.2. | Replace `\b` with a more portable pattern: `(^|[[:space:][:punct:]])(${dangerous[*]})($|[[:space:][:punct:]])` or just use `grep -E`. |
| 6 | `ollama_app_turbo` – prompts for API key with `read -r -s api_key`. In Bash 3.2 the `-s` (silent) flag is supported, but the prompt may not be flushed correctly on some terminals. | Minor UI annoyance. | Add `printf '\n'` after reading or use `stty -echo` / `stty echo` pair for full compatibility. |
| 7 | Many functions return the **raw exit status of external commands** (e.g. `curl`, `jq`). If those programs return values ≥ 128 (signal termination), the script will propagate them unchanged, which may be confusing for callers expecting `0/1`. | Minor – documentation should note that non‑zero values are passed through. |
| 8 | `ollama_lib_about` – uses `column` if present, otherwise plain `compgen`. `column` may not be installed on minimal systems. | No functional break, just formatting. | Already handled; fine. |
| 9 | `ollama_model_random` – uses `shuf` if present; otherwise falls back to an `awk` one‑liner. The `awk` version depends on `srand()` being available – it is, but on very old `awk` implementations this could fail. | Very low risk. |
|10| In many places the script uses `${var:0:120}` to truncate for debug output. Substring expansions on **uninitialized variables** produce empty strings, which is fine, but the truncation may cut off multi‑byte UTF‑8 characters, producing garbled debug output. | Cosmetic. | Use `${var:0:120}` only for ASCII‑safe debugging, or skip truncation. |

---

## 5️⃣ Recommendations & Improvements  

### 5.1 Fix the GET‑request JSON validation bug  

```bash
# Inside _call_curl, before JSON validation
if [[ -n $json_body ]]; then
    if ! _is_valid_json "$json_body"; then
        _error "_call_curl: JSON body is invalid: [${json_body:0:120}]"
        return 1
    fi
fi
```

### 5.2 Stream‑thinking wrapper  

Replace the whole function with a simpler, always‑execute version:

```bash
_ollama_thinking_stream() {
    printf '# <thinking>\n' >&2
    cat >&2
    printf '# </thinking>\n\n' >&2
}
```

### 5.3 Portable dangerous‑command detection  

```bash
local danger_regex='(^|[[:space:][:punct:]])(rm|mv|dd|mkfs|shred|shutdown|reboot|init|kill|pkill|killall|umount|mount|userdel|groupdel|passwd|su|sudo|bash|/bin/sh)($|[[:space:][:punct:]])'
if [[ $cmd =~ $danger_regex ]]; then
    printf '⚠️ WARNING: dangerous token "%s" detected\n' "${BASH_REMATCH[2]}"
fi
```

### 5.4 Consistent quoting  

Ensure every variable expansion that may contain spaces or newlines is quoted, especially when passed to external commands:

```bash
curl "${curl_args[@]}" <<<"$json_body"
# or
printf '%s' "$json_body" | curl "${curl_args[@]}"
```

### 5.5 Documentation updates  

* Add a note in the header that `jq` is required for *all* API calls (even GET) because the script validates JSON payloads.  
* Mention the fallback behaviour for missing `shuf`, `timeout`, `column`, `jq`.  

### 5.6 Minor stylistic clean‑ups  

* Use `set -euo pipefail` only if you also test for unset variables; otherwise keep current behaviour to avoid breaking existing callers.  
* Prefer `printf '%s\n'` over `echo` for predictable output.  
* Add `declare -r` for constants (e.g. `OLLAMA_LIB_NAME`) to prevent accidental reassignment.  

---

## 6️⃣ Final Verdict  

The **Ollama Bash Lib** is a solid, feature‑rich library that already works on Bash 3.2+.  
The main functional blocker is the unconditional JSON validation in `_call_curl`, which prevents all GET requests from succeeding. After fixing that (and optionally applying the portability tweaks above), the script should be reliable across a wide range of Unix‑like platforms.

**Score:** ★★★★☆ (4/5) – only a few bugs prevent it from being production‑ready; fixing them brings it to a full ★★★★★.  
