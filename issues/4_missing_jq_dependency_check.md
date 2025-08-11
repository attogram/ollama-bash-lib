# Issue: Missing dependency check for `jq`

Many functions in the library, such as `_is_valid_json`, `ollama_generate`, and `ollama_chat`, rely on the `jq` command-line JSON processor.

However, there is no check to ensure that `jq` is installed on the user's system. If a user without `jq` installed calls one of these functions, they will receive a "command not found" error that seems to come from deep within the library, which might be confusing to debug.

## Recommendation

Add a check for the `jq` command at the beginning of every function that uses it, or create a new internal function to do this check.

Example for `_is_valid_json`:
```bash
_is_valid_json() {
  if ! _exists 'jq'; then
    _error '_is_valid_json: jq Not Found'
    return 1
  fi
  printf '%s' "$1" | jq -e '.' >/dev/null 2>&1 # use -e for jq exit-status mode
  # ... rest of the function
}
```

A better approach would be to check for all dependencies at the start of the script or in a dedicated dependency check function. The script already checks for `curl` in `_call_curl`. A similar check for `jq` should be added to functions that require it.

For example, `ollama_generate_json`:
```bash
ollama_generate_json() {
  if ! _exists 'jq'; then
    _error 'ollama_generate_json: jq Not Found'
    return 1
  fi
  # ...
}
```

This will provide a much clearer error message to the user.
