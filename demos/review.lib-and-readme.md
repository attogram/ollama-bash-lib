# Sync review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11

```bash
task='Check that the README is in sync with the LIBRARY.
Output your review in Markdown format.'
readme='../README.md'
library='../ollama_bash_lib.sh'
ollama_thinking hide
ollama_generate -m "gpt-oss:120b" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
# 📋 Review – README vs. **ollama_bash_lib.sh**

Below is a concise audit of the documentation (README) compared with the actual library implementation.  
Everything that *doesn’t line‑up* is highlighted, together with suggested fixes.

---  

## ✅ What is already consistent  

| Category | Functions | README ✔︎ | Library ✔︎ |
|----------|-----------|-----------|------------|
| **API** | `ollama_api_get`, `ollama_api_post`, `ollama_api_ping` | ✅ (listed) | ✅ (implemented) |
| **Generate** | `ollama_generate*` (json, stream, stream‑json) | ✅ | ✅ |
| **Chat** | `ollama_chat*`, `ollama_chat_stream*`, `ollama_messages*` (add, clear, count) | ✅ | ✅ |
| **Tool** | `ollama_tools*` (add, list, count, clear, is_call, run) | ✅ | ✅ |
| **Model** | `ollama_model_random`, `ollama_model_unload`, `ollama_show*`, `ollama_list*`, `_is_valid_model` | ✅ | ✅ |
| **Ollama app** | `ollama_app_installed`, `ollama_app_turbo`, `ollama_app_version*`, `ollama_ps*` | ✅ | ✅ |
| **Library** | `ollama_lib_about`, `ollama_lib_version` | ✅ | ✅ |
| **Utility** | `_is_valid_json`, `_debug`, `_error` | ✅ | ✅ |
| **Aliases** | All alias definitions (`oag`, `og`, `oc`, …) | ✅ | ✅ |

The code **does** expose every function that the README mentions, and the aliases work as documented.

---  

## ❗️ Inconsistencies & Missing Details  

### 1. CLI option syntax for a few core functions  

| Function | README example | Actual usage (code) | Issue |
|----------|----------------|--------------------|-------|
| `ollama_api_get` | `ollama_api_get '/api/path'` | `ollama_api_get -P /api/path` (requires `-P` flag) | The positional argument shown in the README is ignored; the function will always call the API with an empty path. |
| `ollama_api_post` | `ollama_api_post '/api/path' "{ json }"` | `ollama_api_post -P /api/path -d '{ json }'` (requires `-P` and `-d`) | Same as above – the README uses positional arguments that the script does **not** parse. |
| `ollama_app_turbo` | `ollama_app_turbo on` | `ollama_app_turbo -m on` (option `-m` required) | The README omits the mandatory `-m` flag, causing the function to think *no* mode was supplied and to error out. |
| `ollama_messages_add` | `ollama_messages_add user "Hello"` | `ollama_messages_add -r user -c "Hello"` (requires `-r` and `-c`) | The example works only with the older “positional‑argument” style that was removed. |

#### Recommendation  

- Update the README snippets to show the **mandatory options** (`-P`, `-d`, `-m`, `-r`, `-c`).  
- Consider adding a short “old‑style” compatibility wrapper (e.g. detect when `$1` isn’t an option) **or** keep the current strict `getopts` approach but clearly document it.

### 2. Missing functions in the **Functions** tables  

| Missing function | Where it belongs | Why it matters |
|------------------|-----------------|----------------|
| `ollama_messages_last` | **Chat Functions** (or a sub‑section “Message Helpers”) | Used heavily in the examples (`ollama_chat` implementation). |
| `ollama_messages_last_json` | **Chat Functions** | Same as above – the JSON version is referenced in the code (`ollama_chat_json`). |
| `_get_redacted_var` | **Utility Functions** (private) | Not a public API, but the README’s “Utility” table could mention it as an internal helper (optional). |

#### Recommendation  

- Add rows for the two `*_last*` helpers in the “Chat Functions” section, indicating usage and return values.  
- If you want to keep them “internal”, mark them as *private* but list them for completeness.

### 3. Slight discrepancies in description vs. behavior  

| Function | README description | Actual behavior | Comment |
|----------|-------------------|----------------|---------|
| `ollama_api_ping` | “Ping the Ollama API” – returns `0` if reachable. | When Turbo Mode is active it **always** returns success without actually pinging the remote API. | Not a bug, but the README should note that Turbo mode bypasses the ping. |
| `ollama_thinking` | “If no input, then the current setting is printed.” | Prints `thinking is <value>` **only** when called with no argument **and** `OLLAMA_LIB_THINKING` is set. Works, but the output format isn’t documented. | Minor – add the exact output line to the description. |
| `ollama_app_turbo` | “`ollama_app_turbo on`” – examples show just `on`/`off`. | Requires `-m on|off` and optional `-e` to export the key. | Already covered in point 1. |

### 4. Version number not advertised in the README  

The library defines `OLLAMA_LIB_VERSION='0.45.11'`.  
The README never mentions the current version (except in the hidden demo script).  

#### Recommendation  

Add a badge or a line like:

```markdown
**Current version:** 0.45.11
```

or reuse the existing *GitHub stars* badge style.

### 5. Quick‑start section – missing note on required tools  

The library needs **`jq`**, **`curl`**, **`ollama`**, **`shuf`** (optional).  
The README has a “Requirements” table that mentions them, but the *quickstart* snippet glosses over the fact that you need those binaries installed first.

#### Recommendation  

Add a note in the Quickstart block:

```bash
# Install required tools (Debian/Ubuntu example)
sudo apt-get install -y curl jq
```

### 6. Minor typographical issues  

| Location | Issue |
|----------|-------|
| “A Bash Library to interact with [Ollama](…)” – the closing parenthesis of the link is escaped (`\]`). Not a functional problem but looks odd in rendered markdown. |
| In the “Howto use Tools” section, the bullet “**Step 1: Add a Tool**” mentions “The command for our tool will be a function that takes a JSON object as input”. In the actual `ollama_tools_add` signature the command is a **function name or executable** that receives a single JSON string – the wording is fine but could stress that the function must accept **one argument**. |
| In the table “Tool Functions” the column *Return* uses `0/1` but some functions actually return **higher non‑zero error codes** (e.g. `_is_valid_json` may return 2‑5). Consider wording “0 on success, non‑zero on error”. |

---  

## 📌 Summary of Required Updates  

1. **Fix the usage examples** for:
   - `ollama_api_get` & `ollama_api_post` (add `-P` and `-d` flags).
   - `ollama_app_turbo` (add `-m` flag and optionally `-e`).
   - `ollama_messages_add` (add `-r` and `-c` flags).

2. **Add missing functions** (`ollama_messages_last`, `ollama_messages_last_json`) to the “Chat Functions” table.

3. **Clarify Turbo‑mode behavior** in the description of `ollama_api_ping`.

4. **Expose the current library version** somewhere in the README (badge or text).

5. **Mention required external tools** (jq, curl, ollama, shuf) directly in the Quick‑start section.

6. **Polish wording** in a few tables (return codes, “thinking” output, etc.) and fix minor markdown glitches.

7. (Optional) **Add a compatibility shim** for the older positional‑argument style of `ollama_api_*` and `ollama_messages_add`, or explicitly mark them as removed.

Implementing these changes will bring the documentation fully in sync with the source code, making onboarding smoother and preventing runtime errors caused by copy‑and‑paste from the README. 🚀
