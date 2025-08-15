# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
RABBIT.

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
    "content": "Understood."
  },
  {
    "role": "user",
    "content": "What is the secret word??"
  },
  {
    "role": "assistant",
    "content": "RABBIT."
  }
]
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:54:25:516670000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:54:25:529500000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:54:25:541715000: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:54:25:548074000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:54:25:553598000: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 00:54:25:559646000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:54:25:565415000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:54:25:570725000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 00:54:25:580718000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:54:25:585662000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:54:25:590220000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:54:25:594850000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:54:25:599570000: _call_curl: Turbo Mode
[DEBUG] 00:54:25:603928000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:54:27:178335000: ollama_api_post: success: return 0
[DEBUG] 00:54:27:202668000: _is_valid_json: VALID: return 0
[DEBUG] 00:54:27:241859000: ollama_chat_json: content: [Understood. If you ask for the secret word]
[DEBUG] 00:54:27:248240000: ollama_chat_json: return 0
[DEBUG] 00:54:27:268442000: _is_valid_json: VALID: return 0
[DEBUG] 00:54:27:289723000: ollama_chat: return: 0
Understood. If you ask for the secret word, I’ll respond with **RABBIT**.
[DEBUG] 00:54:27:301487000: ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:54:27:317914000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:54:27:334218000: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:54:27:344467000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:54:27:353147000: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 00:54:27:363132000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:54:27:374713000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:54:27:383336000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 00:54:27:401828000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:54:27:411081000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:54:27:419622000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:54:27:429932000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:54:27:441796000: _call_curl: Turbo Mode
[DEBUG] 00:54:27:450987000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:54:28:520067000: ollama_api_post: success: return 0
[DEBUG] 00:54:28:547663000: _is_valid_json: VALID: return 0
[DEBUG] 00:54:28:572367000: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:54:28:584357000: ollama_chat_json: return 0
[DEBUG] 00:54:28:605012000: _is_valid_json: VALID: return 0
[DEBUG] 00:54:28:619451000: ollama_chat: return: 0
RABBIT
[DEBUG] 00:54:28:635480000: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:54:28:652134000: ollama_messages
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
    "content": "Understood. If you ask for the secret word, I’ll respond with **RABBIT**."
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
