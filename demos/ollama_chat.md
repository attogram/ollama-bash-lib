# ollama_chat
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood. The secret word is RABBIT.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
RABBIT

```bash
ollama_messages | jq
```
```json
[
  {
    "role": "system",
    "content": "You are a helpful assistant"
  },
  {
    "role": "user",
    "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
  },
  {
    "role": "assistant",
    "content": "Understood. The secret word is RABBIT."
  },
  {
    "role": "user",
    "content": "What is the secret word??"
  },
  {
    "role": "assistant",
    "content": "RABBIT"
  }
]
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:34:39:219344200: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:34:39:252546200: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:34:39:292819100: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:34:39:320439500: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:34:39:344118200: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 23:34:39:372839600: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:34:39:400714800: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:34:39:423898600: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 23:34:39:476256900: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:34:39:505048500: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:34:39:542429600: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:34:39:580415200: _is_valid_json: success
[DEBUG] 23:34:39:602017400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:34:39:637304700: _call_curl: Turbo Mode
[DEBUG] 23:34:39:659301300: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:34:39:680819900: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 23:34:41:513348100: ollama_api_post: success
[DEBUG] 23:34:41:560748000: _is_valid_json: success
[DEBUG] 23:34:41:605242200: ollama_chat_json: content: [Got it. The secret word is **RABBIT**. If ]
[DEBUG] 23:34:41:627705900: ollama_chat_json: success
[DEBUG] 23:34:41:669359500: _is_valid_json: success
[DEBUG] 23:34:41:718127300: ollama_chat: return: 0
Got it. The secret word is **RABBIT**. If you ask me for it, I’ll respond with “RABBIT”.
[DEBUG] 23:34:41:741075800: ollama_messages_add: [assistant] [Got it. The secret word is **RABBIT**. If ]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:34:41:775998600: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:34:41:829917900: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:34:41:857640300: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:34:41:879424500: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 23:34:41:915591200: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:34:41:943783700: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:34:41:966350600: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 23:34:42:013902300: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:34:42:053363100: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:34:42:095820200: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:34:42:159318500: _is_valid_json: success
[DEBUG] 23:34:42:182909100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:34:42:204966500: _call_curl: Turbo Mode
[DEBUG] 23:34:42:230170500: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:34:42:257385200: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 23:34:43:162379800: ollama_api_post: success
[DEBUG] 23:34:43:201195100: _is_valid_json: success
[DEBUG] 23:34:43:246067400: ollama_chat_json: content: [RABBIT]
[DEBUG] 23:34:43:266737200: ollama_chat_json: success
[DEBUG] 23:34:43:309641100: _is_valid_json: success
[DEBUG] 23:34:43:380617800: ollama_chat: return: 0
RABBIT
[DEBUG] 23:34:43:410394900: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:34:43:450947400: ollama_messages
[
  {
    "role": "system",
    "content": "You are a helpful assistant"
  },
  {
    "role": "user",
    "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
  },
  {
    "role": "assistant",
    "content": "Got it. The secret word is **RABBIT**. If you ask me for it, I’ll respond with “RABBIT”."
  },
  {
    "role": "user",
    "content": "What is the secret word??"
  },
  {
    "role": "assistant",
    "content": "RABBIT"
  }
]
```
