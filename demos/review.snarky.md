# Snarky review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

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
ollama_generate -m "gpt-oss:120b" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
# **Rant‑Level Code Review – Ollama Bash Lib**

> **DISCLAIMER:** This “review” is deliberately *over‑the‑top* and *utterly un‑constructive*. If you’re looking for a balanced assessment, you’ve come to the wrong place.  

---

## 1. **README – A Never‑Ending Marketing Brochure**

- **Glitter, not substance.** The README is plastered with badges, emojis, and a “Get Started in 30 seconds” tagline that pretends this thing is a plug‑and‑play miracle. Spoiler: it isn’t.
- **Copy‑pasted fluff.** Sections like “More from the Attogram Project” are pure link dumping with zero relevance to the library itself. It feels like the author tried to hide the lack of real documentation behind a wall of **GitHub‑star‑hype**.
- **No real examples.** The only “demo” is `ollama_generate -m mistral:7b -p "Describe Bash in 3 words"` which is laughably simplistic. There’s no guidance on error handling, authentication, or how the library behaves when the Ollama daemon is down.
- **Version badge lies.** The badge says “Bash ≥ 3.2” but the code uses **arrays**, **process substitution**, **`local -a`**, and **`[[ … =~ … ]]`** without any fallback for older Bash quirks. In practice, it will break on the very Bash version it claims to support.

---

## 2. **Overall Architecture – A Dumping Ground of Globals**

- **Everything is a global.** `OBL_NAME`, `OBL_VERSION`, `OBL_DEBUG`, `OBL_MESSAGES`, … the list goes on. Any script that sources this library inherits a swamp of variables you have to manually sanitize. No namespacing, no encapsulation.  
- **State‑leak hell.** Functions toggle `OBL_STREAM` and `OBL_THINKING` on the fly, then *sometimes* reset them, *sometimes* forget to. One stray call to `ollama_generate` leaves `OBL_STREAM` stuck in streaming mode for the rest of the session.  
- **Side‑effects everywhere.** `ollama_generate` calls `ollama_generate_json`, grabs its output, then mutates global variables and reads from `OBL_MESSAGES` without any indication to the caller that the library has just reshaped the world.

---

## 3. **Error Handling – A Patchwork of Inconsistent Returns**

- **Mixed return semantics.** Some functions return `0` on success, others return the raw `curl` exit code, still others return `1` regardless of the real error. Callers can’t reliably test `$?`.  
- **Silent failures.** Many `_debug` messages are suppressed unless you set `OBL_DEBUG` > 0, but the same code path often **fails quietly** (e.g. `_is_valid_json` returns `1` but the caller never checks it).  
- **Redundant error messages.** Every function prints its own “[ERROR] …” prefix, then the caller prints another error. The output rapidly becomes an unreadable cascade of “[ERROR]” lines.

---

## 4. **Dependency Hell – jq, curl, shuf, column, compgen …**

- **JQ is mandatory.** The whole JSON handling collapses without `jq`. Yet the library barely checks for its existence until you’re already deep in a call, at which point you’ve already wasted CPU cycles and possibly corrupted your message history.  
- **Curl assumptions.** `_call_curl` blindly appends `-w '\n%{http_code}'` and then parses the HTTP code by stripping the last line. If the server returns a body that itself ends with a newline, you’ll mis‑read the status code as part of the payload.  
- **Optional utilities treated as optional, but used anyway.** `shuf` is optional for random model selection, but the fallback awk script is buggy (`int(rand()*NR)+1` can give `0`). That means you can get an empty model name and then happily try to hit the API with it.

---

## 5. **Security – Storing Secrets in the Open Plain**

- **Turbo mode stores the API key in an exported variable.** `OBL_TURBO_KEY` is set in the environment and never cleared. Any child process (including `ps` output) can read it. The `_redact` helper only masks the key when printing debug messages, but the key is still *alive* in the environment.  
- **No input sanitisation for JSON.** The functions build JSON payloads with `jq -c -n … --arg …` which is safe, *unless* callers pass in malicious strings that contain newline characters. Those get piped directly into `curl -d "@-"` and could corrupt the request.

---

## 6. **Code Quality – A Parade of Repetition and Sloppy Bash**

- **Duplicated help parsing.** Every public function repeats the same `while getopts ":hv"` boilerplate, then re‑defines `usage` and `description`. A single helper could have generated this. As it stands, you have **30+ copies** of almost identical code.  
- **Inconsistent quoting.** Many commands interpolate variables without quotes (`printf '%s\n' $OBL_API`) leaving them exposed to word‑splitting and globbing.  
- **Useless `local` declarations.** In `_call_curl`, `local curl_exit_code` is declared, but later you assign to a variable of the same name without the `local` keyword, inadvertently creating a global.  
- **Unnecessary subshells.** `ollama_chat_stream` spawns a subshell just to pipe through `while read …` and then uses `PIPESTATUS`. This is a performance nightmare for a library that claims to be “fast”.  
- **Misnamed functions.** `_ollama_thinking_stream` suggests it streams *thinking* output, but it only prints a single chunk if there’s any input, otherwise it silently does nothing.  

---

## 7. **Documentation vs. Reality – The Library Lies to You**

- **“Bash ≥ 3.2”** – As mentioned, the code uses associative features that will bomb on true Bash 3.2 (e.g., `local -a`). The author never tested on older systems, so the badge is pure marketing.  
- **“Rich set of functions.”** – There are more *broken* functions than usable ones. `ollama_model_unload` calls the **generate** endpoint with `keep_alive: 0` (which is not how you unload a model) – a clear copy‑paste error that will never work.  
- **“Tab completion works.”** – The README boasts that `ollama_<TAB>` lists functions, yet the library never registers any Bash completion script. You’ll just get a failed `compgen` call and a dead‑end.  

---

## 8. **Performance – “Fast” is a Lie**

- **Synchronous `curl` calls.** Every API request blocks the entire shell. There’s no async mode, no backgrounding, no timeout handling beyond `--max-time`.  
- **Repeated parsing of JSON.** Functions like `ollama_generate` call `jq` multiple times on the same payload (once for validation, once for extracting `.response`, again for `.thinking`). That’s wasted CPU for a script that should be lightweight.  

---

## 9. **Testing & Maintainability – Non‑existent**

- **No test suite.** The repo contains no `bats` or `shunit2` files, no CI pipelines, nothing to guarantee that a change won’t break half the API.  
- **Hard‑coded error strings.** If you ever need to internationalise or change wording, you have to hunt through dozens of `"_error"` calls.  

---

## 10. **Final Verdict – A Disaster Wrapped in Badges**

The **Ollama Bash Lib** is a **bloated, insecure, poorly documented, and fragile** collection of Bash functions that pretend to be a “library” while being nothing more than a tangled mess of globals, duplicate code, and half‑baked error handling. It’s riddled with hidden assumptions, fragile dependencies, and insecure secret handling.  

If you need a reliable way to talk to Ollama from a script, **run away** from this project and either:

1. Write a tiny, purpose‑built wrapper that only does the one thing you need (don’t reinvent the wheel), or  
2. Use a language with proper HTTP/JSON libraries (Python, Go, Rust …) where you can actually manage secrets and errors safely.

> **Bottom line:** This library is a perfect example of “feature creep” meets “Bash spaghetti.” Avoid at all costs.  
