# Sync review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

```bash
task='Check that the README is in sync with the LIBRARY.
Output your review in Markdown format.'
readme='../README.md'
library='../ollama_bash_lib.sh'
ollama_thinking hide
ollama_generate -m "gpt-oss:20b" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
## README vs. Library – In‑Sync Review

Below is a systematic audit of the `README.md` document against the current **`ollama_bash_lib.sh`** library.  Whenever the README is out of sync we point out the discrepancy and suggest how to fix it.

> **TL;DR** – Most of the table‑d documentation is correct, but a handful of example usages (and a couple of function names) are wrong.  The solution is to replace the positional‑argument examples with the correct **option‑flag** syntax, add the missing helper functions to the tables, and be consistent about aliases.

---

### 1. Example Usage Mismatches
| Section | Current Example | Library Expectation | Suggested Fix |
|--------|-----------------|---------------------|---------------|
| **Howto chat** | `ollama_messages_add user "Hello"` | `ollama_messages_add -r user -c "Hello"` | Update README to use the flag‑style call. |
| **Howto chat** | `response="$(ollama_chat gpt-oss:20b)"` | `ollama_chat -m gpt-oss:20b` | Add `-m` flag. |
| **Howto chat** | `last="$(ollama_messages_last)"` | Works, but function not mentioned in tables | Add `ollama_messages_last` (and `ollama_messages_last_json`) to Chat‑Functions table. |
| **Howto use tools** | `ollama_tools_add "get_weather" "weather_tool" "$weather_definition"` | `ollama_tools_add -n get_weather -c weather_tool -j "$weather_definition"` | Replace positional args with `-n`, `-c`, `-j`. |
| **Howto use tools** | `ollama_messages_add user "Hello"` (tool‑response) | Same rule as above | Update README. |
| **Quick‑start** | `ollama_generate -m mistral:7b -p "Describe Bash in 3 words"` | Correct – this matches the `ollama_generate` signature. | **No change.** |

---

### 2. Missing Functions in Tables
| Function | Table Section | Presence in README |
|----------|----------------|--------------------|
| `ollama_messages_last` | Chat‑Functions | **Missing** |
| `ollama_messages_last_json` | Chat‑Functions | **Missing** |
| `ollama_list_array` | Model Functions | Present |
| `ollama_ps_json` | Ollama Functions | Present |
| (All others) | – | **Present** |

**Action**: Add the two missing “last message” functions to the Chat‑Functions table and update the section heading so that the table accurately reflects all exported functions.

---

### 3. Alias Consistency
The alias block at the end of the README correctly mirrors the library.  No mismatches found there.  
> *Tip*: Keep the alias list at the bottom of the README in sync when new aliases are added to the library.

---

### 4. Option → Positional Confusion
Many functions in the library use `getopts` to require explicit flags (`-m`, `-r`, `-c`, etc.).  
**README** mistakenly shows:

| Incorrect | Correct |
|----------|--------|
| `ollama_generate_json gpt-oss:20b "prompt"` | `ollama_generate_json -m gpt-oss:20b -p "prompt"` |
| `ollama_chat gpt-oss:20b` | `ollama_chat -m gpt-oss:20b` |
| `ollama_tools_add get_weather weather_tool "$def"` | `ollama_tools_add -n get_weather -c weather_tool -j "$def"` |

Update every example that uses positional arguments to match the flag syntax and add a brief note in the README that “all functions accept options; positional form is not supported”.

---

### 5. Header & Navigation
The table of contents section references a link `[Howto-chat]` that is defined further down.  
- **Issue**: The anchor is `#Howto-chat` but the heading is actually `### Howto chat`.  
- **Fix**: Either change the TOC link to match the heading (`#Howto-chat` works, but double‑check that Markdown renders correctly) or rename the heading.

---

### 6. Minor Typos / Clarity
| Location | Issue | Fix |
|----------|-------|-----|
| `ollama_app_turbo` description mentions “Create an API key”, but the function actually prompts for it; it is fine | **None** |
| In "Howto use Tools" step 1 it says “the command for our tool will be a function …”. The README does include a function definition but never shows how to export it. Consider adding a small code block showing the function definition before `ollama_tools_add` line. | Add the function definition snippet. |
| “Use `ollama_tools_run`” in README is referenced in the example but library uses `ollama_tools_run -n name -a args`. Ensure the example shows the flags. | Update example accordingly. |
| The quick‑start block contains a list of all function names as tab‑completion examples. The list includes some functions that changed alias names (e.g., `ollama_app_installed` listed as `oai`, but the alias block shows `oai { ollama_app_installed "$@" }`). Make sure they both agree. | No action needed – they match. |

---

### 7. Documentation of Internal Functions
The README includes a “Utility Functions” table with `_is_valid_json`, `_debug`, `_error`.  
- These are indeed public (no leading underscore usage in export) and documented.  
- No updates required.

---

### 8. Suggested README Improvement Checklist
1. **Update examples**:
   * Replace all positional‑style calls with flag‑style (`-m`, `-r`, `-c`, `-n`, `-c`, `-j`).
2. **Add missing functions**:
   * Include `ollama_messages_last` and `ollama_messages_last_json` under Chat‑Functions.
3. **Refine “Howto *” sections**:
   * Add a quick snippet defining a tool function before invoking `ollama_tools_add`.
   * Clarify that `ollama_messages_add` requires `-r` and `-c`.
4. **Consistent navigation**:
   * Ensure TOC links point to correct headings.
5. **Add a short note** in the API docs that all functions require options – no positional form is supported unless explicitly documented (like some helper functions).
6. **Cross‑check alias block** after any new alias changes.

---

## Summary
The README is largely accurate but contains a handful of syntax errors in example snippets and a missing entry for two helper functions.  The changes outlined above will bring the documentation into full alignment with the current library code.  After applying these edits, run `demos/run.demos.sh` against a fresh clone to confirm that all examples still work.
