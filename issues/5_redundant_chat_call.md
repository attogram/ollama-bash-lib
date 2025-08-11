# Issue: Redundant `ollama_chat` call in `ollama_chat_stream`

The `ollama_chat_stream` function is intended to provide a streaming text response from the chat endpoint. However, its implementation is incorrect. It calls `ollama_chat`:

```bash
ollama_chat_stream() {
  _debug "ollama_chat_stream: [${1:0:42}]"
  # ... model check ...
  OLLAMA_LIB_STREAM=1
  if ! ollama_chat "$model"; then
    _error "ollama_chat_stream: ollama_chat failed"
    OLLAMA_LIB_STREAM=0
    return 1
  fi
  OLLAMA_LIB_STREAM=0
  return 0
}
```

The problem is that `ollama_chat` is explicitly designed for *non-streaming* output. It sets `OLLAMA_LIB_STREAM=0` internally, captures the entire JSON response from `ollama_chat_json`, and then extracts the full message content.

```bash
ollama_chat() {
  # ...
  OLLAMA_LIB_STREAM=0
  local response
  response="$(ollama_chat_json "$model")"
  # ...
}
```

This means `ollama_chat_stream` will never stream. It will wait for the full response, print it all at once, and then exit.

## Recommendation

The implementation of `ollama_chat_stream` should be similar to `ollama_generate_stream`. It should call the JSON-producing function (`ollama_chat_json`) and then pipe the streaming output to `jq` to extract the content of each JSON object.

Corrected implementation:

```bash
ollama_chat_stream() {
  _debug "ollama_chat_stream: [${1:0:42}]"
  local model
  model="$(_is_valid_model "$1")"
  _debug "ollama_chat_stream: model: [${model:0:120}]"
  if [[ -z "$model" ]]; then
    _error 'ollama_chat_stream: No Models Found'
    return 1
  fi
  OLLAMA_LIB_STREAM=1 # Turn on streaming

  ollama_chat_json "$model" | jq -j '.message.content'

  local error_code=${PIPESTATUS[0]}
  OLLAMA_LIB_STREAM=0 # Turn off streaming

  if [[ $error_code -ne 0 ]]; then
      _error "ollama_chat_stream: ollama_chat_json failed with code $error_code"
      return 1
  fi

  return 0
}
```
This new implementation also needs `ollama_chat_json` to be changed so it streams the output instead of capturing it in a variable.

```bash
# In ollama_chat_json
# ...
  # local result
  # if ! result="$(ollama_api_post '/api/chat' "$json_payload")"; then
  # remove the result variable and just pipe the output
  if ! ollama_api_post '/api/chat' "$json_payload"; then
    _error "ollama_chat_json: ollama_api_post failed"
    return 1
  fi
# ...
# remove all the json validation and parsing from ollama_chat_json
```
