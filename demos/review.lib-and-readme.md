# Sync review of [ollama_bash_lib.sh](../ollama_bash_lib.sh) AND [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1

```bash
task='Check that the README is in sync with the LIBRARY.
Output your review in Markdown format.'
readme='../README.md'
library='../ollama_bash_lib.sh'
ollama_thinking hide
ollama_generate -m "gpt-oss:20b" -p "$task\n\nREADME:\n\n$(cat "$readme")\n\nLIBRARY:\n\n$(cat "$library")"
```
## Review – Does the README match the library code?

Below is a checklist of differences that could cause confusion for users or break automation that relies on the README.  
Corrections are suggested where applicable.

| # | Issue | What the README says | What the library actually does | Suggested fix |
|---|-------|----------------------|--------------------------------|---------------|
| 1 | **Missing “Helper Functions” section** | The table of functions lists *Helper* after *Api* and *Generate* (in the header list) but the README never defines a “Helper Functions” section. | Internal utilities (`_call_curl`, `_is_valid_json`, etc.) are not documented. | Add a `### Helper Functions` header (or remove the placeholder from the list). |
| 2 | **`ollama_messages_add` syntax mismatch** | README example: `ollama_messages_add user "Hello"` (positional). | Function definition requires flags: `ollama_messages_add -r <role> -c <content>`. | Update README examples to use the correct flag‑based syntax. |
| 3 | **`ollama_app_turbo` syntax mismatch** | Example in “How to use Turbo Mode”: `ollama_app_turbo on`. | Function signature: `ollama_app_turbo -m <on|off> [-e]`. | Change example to `ollama_app_turbo -m on` (or document positional usage if desired). |
| 4 | **Alias mismatch for `ollama_messages_clear`** | Table lists alias `omc`. | Alias defined in the library is `omclear()`. | Add `omc() { ollama_messages_clear "$@"; }` to the alias list or update the README table. |
| 5 | **Missing aliases for `ollama_messages_last` & `ollama_messages_last_json`** | These functions exist in the library but have **no aliases** or table entries. | Library contains `ollama_messages_last` and `ollama_messages_last_json`. | Add aliases (e.g., `oml()`, `omlj()`) and table rows for these two functions. |
| 6 | **Alias for `ollama_app_vars` is missing** | The README references `ollama_app_vars` in the function list but the alias table omits it. | Alias list does not contain `oav` or similar; only the function exists. | Provide an alias (e.g., `oav()`, `oavars()`) or remove it from the alias list. |
| 7 | **Inconsistent variable names** | README mentions `OLLAMA_LIB_TURBO_KEY`, `OLLAMA_HOST`, `OLLAMA_LIB_API` in the Turbo Mode section. | Library sets these correctly. | No change needed, but double‑check that the environment variables are clearly documented. |
| 8 | **Missing doc‑strings for `ollama_messages_last` and `ollama_messages_last_json`** | Functions are used in demos (`messages.last`) but not documented anywhere. | Library contains implementation and tests. | Add concise descriptions in the functions table (under *Chat Functions*). |
| 9 | **Optional requirements mismatched** | README lists required tools (`curl`, `jq`, `shuf`, `sort`, `column`). | Library additionally uses `awk`, `sed`, `tr`, `grep`, `wc`, `od`, `command`. | Update the optional requirements section to include all those utilities. |
|10 | **`ollama_generate_stream_json` output description** | README says “Generate completion, streaming and json output”. | The function actually streams **JSON objects**; clarify that the output is a stream of JSON objects, not a single JSON. | Update documentation to make this explicit. |
|11 | **`ollama_generate` documentation** | Usage in table: `-m <model> -p <prompt>`. | The function actually accepts `-m <model> -p <prompt>`; it also supports reading from `stdin`. | The table is fine, but add a note that `-p` is optional and can come from stdin. |
|12 | **`ollama_ps_json` usage example** | Table lists “`ollama_ps_json`” but README shows no example. | Implementation works as documented. | Add a quick example in the README. |
|13 | **`ollama_lib_about` prints no function list if `compgen` or `column` missing** | README mentions this but the table/description don’t reflect the fallback behavior. | The alias table still works. | Document the fallback behaviour in the function description. |
|14 | **`OLLAMA_LIB_DEBUG` description** | README describes it loosely; the library uses **numeric levels** (`0`, `1`, `2`). | Align wording to “`OLLAMA_LIB_DEBUG=0` ⇒ off, `1` ⇒ debug, `2` ⇒ verbose trace”. | Update README section accordingly. |
|15 | **`ollama_generate`/`ollama_generate_stream` return codes** | README says “0/1”; the library also returns the underlying `curl` exit or parsing status. | Keep the documented return values, but clarify that `1` means failure in any step. | Minor wording tweak. |

---

### Additional observations

1. **Consistency Between Function and Alias Names**  
   All alias names defined in the library’re correctly referenced in the README except the ones listed above.  Keeping the alias list and the tables in sync is essential for automation (e.g., `make`‑style scripts that rely on aliases).

2. **Parameter Parsing vs. Documentation**  
   The library heavily uses `getopts` with flags (`-m`, `-p`, `-r`, `-c`, `-t` etc.).  Every usage example in the README must mirror this behavior; otherwise, scripts or users following the README will encounter syntax errors.

3. **Hidden Key Redaction**  
   The library redacts `OLLAMA_LIB_TURBO_KEY` by default when printing debug or error messages (`_redact`).  The README currently mentions this in the Turbo section but doesn’t reference the redaction mechanism in the debug section.  A quick note in the *Debug* section can clarify that keys are never printed.  

4. **Testing**  
   Some demo scripts reference functions that the README doesn’t document (e.g., `ollama_messages_last`).  Consider adding a short “Examples” sub‑section that shows the full life‑cycle of a chat session, including clearing, counting, and retrieving the last message.

5. **Missing `ollama_app_vars` alias**  
   The README shows this function only in the “Functions” list but omits an alias in the alias table.  Either create a short alias (e.g., `oavars()`) or remove it from the header.

---

### Suggested actions

| Step | Description |
|------|-------------|
| 1 | Add a **Helper Functions** section or remove the placeholder header. |
| 2 | Update **example syntax** for `ollama_messages_add`, `ollama_app_turbo`, and any other positional–flag mismatch. |
| 3 | Add missing aliases (`omc`, `oml`, `omlj`, `oav`) and table entries for the respective functions. |
| 4 | Expand the *Optional Requirements* list to include all utilities the library uses. |
| 5 | Clarify the behavior and output of streaming functions (`ollama_generate_stream_json`, `ollama_chat_stream_json`). |
| 6 | Add quick examples for “list array”, “PS JSON”, etc. |
| 7 | Update the *Debug* section to mention error and key redaction. |
| 8 | Revise the “How to use Turbo Mode” example to match the flag usage or add a positional variant if desired. |

Once these changes are applied, the README will accurately reflect the library’s API, making it easier for users to adopt the library without running into the small but confusing discrepancies highlighted above.
