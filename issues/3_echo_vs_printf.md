# Issue: Unsafe use of `echo` instead of `printf`

In several functions, `echo` is used to pipe a variable containing JSON to the `jq` command. For example, in `ollama_generate`:

```bash
result_response="$(echo "$result" | jq -r '.response')"
```

And in `ollama_chat`:

```bash
if ! message_content="$(echo "$response" | jq -r ".message.content")"; then
```

Using `echo` is not safe for arbitrary string data. If the variable (`$result` or `$response`) contains backslashes or starts with flags that `echo` interprets (like `-n`, `-e`, or `-E`), the output will be modified, which will likely result in invalid JSON being passed to `jq`.

## Recommendation

Replace all instances of `echo "$variable" | ...` with `printf '%s' "$variable" | ...`. The `printf` command is more reliable and does not interpret the content of the variable.

The corrected code in `ollama_generate` would be:

```bash
result_response="$(printf '%s' "$result" | jq -r '.response')"
```

And in `ollama_chat`:

```bash
if ! message_content="$(printf '%s' "$response" | jq -r ".message.content")"; then
```

This change should be applied to all similar instances in the script.
