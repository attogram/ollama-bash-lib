# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it—I'll reply “RABBIT” whenever you ask for the secret word.

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
    "content": "Got it—I'll reply “RABBIT” whenever you ask for the secret word."
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
[DEBUG] 23:50:08:158260700: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:50:08:204089200: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:50:08:241456700: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:50:08:270110200: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:50:08:291241200: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 23:50:08:321965200: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:50:08:349943700: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:50:08:370815400: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 23:50:08:421637200: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:50:08:464120200: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:50:08:487848400: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:50:08:535761000: _is_valid_json: success
[DEBUG] 23:50:08:569553400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:50:08:591168200: _call_curl: Turbo Mode
[DEBUG] 23:50:08:629104200: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:50:08:651198300: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 23:50:09:634502900: ollama_api_post: success
[DEBUG] 23:50:09:674073100: _is_valid_json: success
[DEBUG] 23:50:09:734645800: ollama_chat_json: content: [RABBIT]
[DEBUG] 23:50:09:755729900: ollama_chat_json: success
[DEBUG] 23:50:09:818879200: _is_valid_json: success
[DEBUG] 23:50:09:865907700: ollama_chat: return: 0
RABBIT
[DEBUG] 23:50:09:887275300: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:50:09:921168300: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:50:09:960839700: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:50:09:996167300: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:50:10:026232400: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 23:50:10:056577100: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:50:10:088270700: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:50:10:114020900: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 23:50:10:155678600: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:50:10:182501100: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:50:10:212710200: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:50:10:251532500: _is_valid_json: success
[DEBUG] 23:50:10:274756500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:50:10:300529100: _call_curl: Turbo Mode
[DEBUG] 23:50:10:333671700: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:50:10:364429100: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 23:50:11:292567000: ollama_api_post: success
[DEBUG] 23:50:11:341424400: _is_valid_json: success
[DEBUG] 23:50:11:401011100: ollama_chat_json: content: [RABBIT]
[DEBUG] 23:50:11:431149900: ollama_chat_json: success
[DEBUG] 23:50:11:481372900: _is_valid_json: success
[DEBUG] 23:50:11:525855800: ollama_chat: return: 0
RABBIT
[DEBUG] 23:50:11:558400400: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:50:11:598720500: ollama_messages
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
