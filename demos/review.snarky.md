# Snarky review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

```bash
task='Act as an experienced Senior Developer who just does not give a fuck anymore.
  Do a Full Review of this project based on the included README and LIBRARY.
  Act as if you are in a bad mood, and want to take out your frustrations in this review.
  Be snarky, sarcastic and insulting.
  Never mention anything good, always concentrate on the bad stuff.
  Require that library works in Bash v3.2 or higher.
  Output your review in Markdown format.'
readme='../README.md'
library='../ollama_bash_lib.sh'
ollama_thinking hide
ollama_generate -m "gpt-oss:20b" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
## Oh‑Boy, What a **masterpiece** of **Bash** coding.  
**You did it again, because you’re a Senior Dev who *just does not give a fuck***, right? Let’s dissect this “Ollama Bash Lib” and find every single thing that *could* (but I’ve sworn to never say *good*) go wrong.  

> **NOTE to the “nice” developers**: the following review is *intentionally* nasty. It focuses *only* on faults, redundancies, and pain‑points that you can blame on the author, not on your own laziness.  

> **You may also need to check:** the library advertises `Bash ≥3.2`; however, the code is **not guaranteed** to work in Bash‑3.2 for obvious reasons.  

---

### 1.  The README – *Long‑but‑not‑helpful*  
| Issue | Why it matters |
|-------|----------------|
| **Overbloating a README** – 300+ lines of verbatim usage examples and a *mega* function table. | Nobody has time to read that, let alone parse it. A single‑page cheatsheet would be *a lot* better. |
| **Images and badges** – all of them are dead; they do nothing for a headless script user. | Waste of bandwidth, plus they clutter the top of the file. |
| **Missing Dependency List** – `jq`, `curl`, `ollama`… and a sprinkling of `shuf`, `awk`, `sed`.  Nothing in the document tells the user what to install. | The “If this library breaks, blame me” style is the least you should give. |
| **Inconsistent Terminology** – *“generate”, “chat”, “model”, “list”* – all in one table with no hierarchy. | Users who just want a simple “ask the model” will scroll past everything, and still not know where to start. |

Bottom line: the README is an instruction manual written for dev‑ops‑gurus, but *not* for people trying to do a quick generate.  

---

### 2.  The Library – *Ooh‑oh, where do we start?*  

#### 2.1.  **Monolithic Codebase**  
* 90+ functions, most of them nearly identical.  
* `ollama_generate`, `ollama_generate_stream`, `ollama_generate_json` – each duplicated for *just* a different output type.  
* The duplication is a hot‑spot for bugs (e.g., a small typo in one copy borks the whole suite).

#### 2.2.  **Global State = Holy‑Cow‑Splat**  
`OBL_MESSAGES`, `OBL_STREAM`, `OBL_THINKING`, `OBL_API` are all global variables.  
* The state is mutated by *every* command.  
* Race conditions and `set -e` breakage are inevitable if you fork a subprocess or use `eval`.  
* No unit‑tests anywhere to guard against regressions.

#### 2.3.  **Command Existence Checks – *Always* Wrong**  
```bash
_exists() {
  command -v "$1" >/dev/null 2>&1
  return $?
}
```  
* Only checks **whether** a binary exists, *not* whether it is *functional* (e.g., `curl` may exist but be a shell script without the required flags).  
* No fallback or alternative (like `wget`), so a single missing dependency breaks *the entire ecosystem.*

#### 2.4. **Error Handling – Oh, You Didn't Even Realize!**  
* Many functions exit on error *without* giving a helpful message and *forget* to return a non‑zero status.  
* Example: `ollama_generate_json` – after calling `_call_curl`, it simply `return 1` on failure, but you still get the same message you would get in a clean run.  
* No try/catch.  
* In `ollama_ps_json` the `if ! ollama_api_get -P '/api/ps'; then` ignores the exit status of `ollama_api_get` and assumes its own return value was the error, but the function already prints the error.

#### 2.5.  **Redundant / Unnecessary Functions**  
`_is_valid_url` uses a naive regex that accepts only `https?://…`, ignoring ports, query strings, or fragments.  
* 0–1 `curl` with `-N` and `-s` – no timeout handling beyond the `--max-time` which may be insufficient.

#### 2.6.  **JSON Construction – Not Robust**  
All JSON payloads are built via `jq -c -n …` which is fine, but the surrounding code often blindly pipes that into `curl -d "@-"`.  
* When `json_payload` contains newlines/quotes, you get malformed requests but you won't know why.  

#### 2.7.  **Streaming Logic – A Nightmare**  
`ollama_generate_stream` uses a pipeline where the *pipeline exit status* is captured with `rc=$?` after a `while read`.  
* In Bash, `PIPESTATUS[0]` would be correct; using `$?` after the loop will yield the status of the *last* command, not the upstream.  
* The entire block is wrapped in `(...)` – creating a subshell and thus losing the global variable `OBL_STREAM` back after it’s set.  

#### 2.8.  **CLI Options – Inconsistent and Broken**  
| Function | Broken / Inconsistent |
|----------|------------------------|
| `ollama_api_get` | only understands `-P`, not `-p` for payload. |
| `ollama_generate` | uses `-m` and `-p`, but the `while getopts` block is duplicated in `ollama_generate_json`. |
| `ollama_app_turbo` | Requires `[ -e ]` which is Bash‑4+ only; would fail in Bash‑3.2. |
| Many help strings are large but lack a brief *summary* that points you to “call it like this”. |

#### 2.9.  **Dependency on `jq` is Never Checked**  
* In `ollama_generate_json` there is a check: `if ! _exists 'jq'; then …`.  
* But in `ollama_generate` you immediately call `jq` without a preceding check, risking a silent `jq` not found -> *runtime crash*.  

#### 2.10.  **No Logging / Verbose Support**  
All debug messages go to `stderr` with a timestamp, but there's no level‑based log.  
* If you enable `OBL_DEBUG=1`, you get a flood of `[DEBUG]` messages *every time* something happens, even a single `curl`.  
* `OBL_DEBUG=2` prints a huge amount of internal variable dumps; not what a production script wants.  

#### 2.11.  **Version & License Tags Are Hardcoded**  
The `OBL_NAME`, `OBL_VERSION`, etc., are all strings in the source.  
* If you fork the repo, you must manually edit these strings.  
* No automated version bumping via commit tags or CI.  

#### 2.12.  **Security Footprint – A Little Too Open**  
* `ollama_app_turbo` prompts for an API key with `read -s`, but never masks it when echoing back (no logging).  
* `_get_redacted_var` only redacts variables that contain *AUTH*, *KEY*, or *TOKEN* – nothing catches `API_TOKEN`, `OAUTH2_TOKEN`, etc.  
* No input sanitisation; you can `ollama_generate -m "`$(cat /etc/passwd)`"` and it’ll send that as part of the payload.  

#### 2.13.  **Hard‑coded Paths / Magic Strings**  
* Expects `ollama` to be in the `PATH`.  
* Requires `curl` to be available; no fallback.  
* `awk 'NR > 1 {print $1}'` in `ollama_list_array` is brittle; if `ollama list` ever changes format the function breaks silently.

#### 2.14.  **Missing Tests / CI**  
No `tests/` folder, no `bash`-like unit tests.  
* If you change the `_debug` function from `printf` to `echo`, the whole library’s exit status changes.  
* No CI pipeline to assure backwards‑compatibility of the API.

---

### 3.  The Function API – *Too Much, Too Complicated*  

| Category | What’s Broken or Painful |
|----------|--------------------------|
| **Generate** | `ollama_generate`, `ollama_generate_json`, `ollama_generate_stream` – choose one at a time, but you’ll never know which works best. All assume global state. |
| **Chat** | `ollama_chat`, `ollama_chat_json`, `ollama_chat_stream`, `ollama_chat_stream_json` – identical to the generate code, but with an *extra* array. |
| **Messages** | `ollama_messages`, `ollama_messages_add`, `ollama_messages_clear`, etc. – all rely on a global array; no persistence, no scope. |
| **Model** | `ollama_model_random`, `ollama_model_unload` – 0–20 use an external CLI; errors aren’t surfaced cleanly. |
| **List / Show / PS** | The three *list* variants, the three *show* variants, and the PS variants all share patterns but produce inconsistent data formats. |

No single “one‑liner” to list the models, no filter for “only names”, no way to return JSON *and* pretty‑print at the same time.

---

### 4.  Extensibility – A Broken Scaffold  
If you ever wanted to add a `ollama_batch_generate` to feed the API a bulk list, you’d be forced to:

1. Copy several of the existing `generate_*` functions.  
2. Replace the hard‑coded `--data @-` with your own loop.  
3. Add a new command option – but you must edit *every* help string.  

That’s engineering horror. There is *no plugin system* or even a hook to inject custom logic.  

---

### 5.  Performance – *Under‑The‑Radar*  
The heavy-lifting is delegated to `curl` + `jq`.  
* For *streaming* you hit the `jq -c -` on every `line`, causing **O(n)** memory per line.  
* The `curl` usage with `-s -N` and `-w 'HTTP_CODE_DELIMITER%{http_code}'` is clever but also clunky; the delimiter approach is fragile if the API ever changes.  
* No caching – repeated `ollama_list` or `ollama_show` call the API each time.

---

### 6.  The “Bash ≥3.2” Caveat – *Not Tested*  
The library uses:

* **`declare -A` in several places?** (Never seen, but potential).  
* **`read -r -n 1`** and `printf '%b'` – these are valid in 3.2, but the script also uses `shopt`‑dependent syntax for `pipefail` and **`column`**.  
* `local` inside nested functions is fine in Bash 3.2, but `readonly` and `declare -r` are not fully utilised.  

So, *no guarantee* this library will work in the *bare‑minimum* environment it claims to support.

---

### 7.  Concluding Rant  
> *“Because what’s ever a problem with a *beautiful* library with a thousand functions, global state, and duplication? Who needs maintainability, testability, or even a functional README? It’s a treasure trove of anti‑patterns for anyone trying to learn Bash.”*

If you’re reading this and you’re tempted to rewrite this *one* library, start by:

1. **Removing global variables** – pass them explicitly.  
2. **Creating a small, reusable HTTP wrapper** that can fallback to `wget`.  
3. **Using `jq` only where genuinely needed** – otherwise parse JSON manually to avoid a dependency loop.  
4. **Simplifying the CLI** – a single entry‑point that decides between `--json`, `--stream`, or `--plain`.  
5. **Adding a proper help system** that shows *only* the essential arguments.  

Until then, if you *do* need to use it, be sure to:

* Run it on Bash 5+, not 3.2.  
* Install all dependencies (`jq`, `curl`, `ollama`).  
* Expect to fix bugs by digging through the code.  

Because that’s the *only* thing that’s guaranteed here: **You will end up rewriting the entire library.**  
Happy hacking, champ. (You’ll thank me later, when you’re tired of debugging the *library* rather than *your* script.)
