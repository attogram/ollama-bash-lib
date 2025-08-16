# ollama_chat
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Yes, I understand. If you ask for the secret word, I’ll respond with **RABBIT**.

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
    "content": "Yes, I understand. If you ask for the secret word, I’ll respond with **RABBIT**."
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
[DEBUG] 22:33:28:077222500: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:33:28:121949900: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:33:28:158445600: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:33:28:190906600: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:33:28:215855900: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 22:33:28:242492600: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:33:28:279000700: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:33:28:300798900: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 22:33:28:350568400: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:33:28:375846300: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:33:28:398011800: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:33:28:458020900: _is_valid_json: VALID: return 0
[DEBUG] 22:33:28:479368800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:33:28:500415900: _call_curl: Turbo Mode
[DEBUG] 22:33:28:523361600: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:33:28:542733100: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 22:33:29:844192000: ollama_api_post: success
[DEBUG] 22:33:29:890414100: _is_valid_json: VALID: return 0
[DEBUG] 22:33:29:938006600: ollama_chat_json: content: [Got it. The secret word is **RABBIT**.]
[DEBUG] 22:33:29:967354300: ollama_chat_json: return 0
[DEBUG] 22:33:30:010284100: _is_valid_json: VALID: return 0
[DEBUG] 22:33:30:065324700: ollama_chat: return: 0
Got it. The secret word is **RABBIT**.
[DEBUG] 22:33:30:087791900: ollama_messages_add: [assistant] [Got it. The secret word is **RABBIT**.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:33:30:130456200: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:33:30:169418500: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:33:30:208486000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:33:30:230334700: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 22:33:30:257433900: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:33:30:282514200: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:33:30:318366100: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 22:33:30:355102900: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:33:30:381146700: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:33:30:402700300: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:33:30:469093900: _is_valid_json: VALID: return 0
[DEBUG] 22:33:30:491021400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:33:30:514696700: _call_curl: Turbo Mode
[DEBUG] 22:33:30:535849800: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:33:30:555310800: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 22:33:31:624318900: ollama_api_post: success
[DEBUG] 22:33:31:673794900: _is_valid_json: VALID: return 0
[DEBUG] 22:33:31:737255700: ollama_chat_json: content: [RABBIT]
[DEBUG] 22:33:31:765119800: ollama_chat_json: return 0
[DEBUG] 22:33:31:806468500: _is_valid_json: VALID: return 0
[DEBUG] 22:33:31:852471500: ollama_chat: return: 0
RABBIT
[DEBUG] 22:33:31:886552300: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:33:31:933722100: ollama_messages
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
    "content": "Got it. The secret word is **RABBIT**."
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
