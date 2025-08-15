# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it.

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
    "content": "Got it."
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
[DEBUG] 01:23:35:030321000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 01:23:35:044691000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 01:23:35:058218000: ollama_chat: [gpt-oss:20b]
[DEBUG] 01:23:35:064887000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 01:23:35:071029000: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 01:23:35:077216000: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 01:23:35:083353000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 01:23:35:089102000: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 01:23:35:100944000: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 01:23:35:106719000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 01:23:35:111876000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 01:23:35:116428000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:23:35:121012000: _call_curl: Turbo Mode
[DEBUG] 01:23:35:125135000: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 01:23:36:934676000: ollama_api_post: success: return 0
[DEBUG] 01:23:36:957059000: _is_valid_json: VALID: return 0
[DEBUG] 01:23:36:973531000: ollama_chat_json: content: [RABBIT]
[DEBUG] 01:23:36:980460000: ollama_chat_json: return 0
[DEBUG] 01:23:36:994902000: _is_valid_json: VALID: return 0
[DEBUG] 01:23:37:007524000: ollama_chat: return: 0
RABBIT
[DEBUG] 01:23:37:014279000: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 01:23:37:027018000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 01:23:37:039206000: ollama_chat: [gpt-oss:20b]
[DEBUG] 01:23:37:045197000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 01:23:37:050378000: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 01:23:37:056388000: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 01:23:37:061872000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 01:23:37:067001000: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 01:23:37:077241000: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 01:23:37:082291000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 01:23:37:086888000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 01:23:37:091308000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:23:37:096056000: _call_curl: Turbo Mode
[DEBUG] 01:23:37:100522000: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 01:23:38:573601000: ollama_api_post: success: return 0
[DEBUG] 01:23:38:595217000: _is_valid_json: VALID: return 0
[DEBUG] 01:23:38:611161000: ollama_chat_json: content: [RABBIT]
[DEBUG] 01:23:38:618559000: ollama_chat_json: return 0
[DEBUG] 01:23:38:633316000: _is_valid_json: VALID: return 0
[DEBUG] 01:23:38:646251000: ollama_chat: return: 0
RABBIT
[DEBUG] 01:23:38:652997000: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 01:23:38:665227000: ollama_messages
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
    "content": "RABBIT"
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
