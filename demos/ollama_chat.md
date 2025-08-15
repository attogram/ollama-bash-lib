# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.8

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood. If you ask for the secret word, I’ll respond with **RABBIT**.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
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
[DEBUG] 23:22:50:227481000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:22:50:241406000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:22:50:254709000: ollama_chat: [gpt-oss:120b]
[DEBUG] 23:22:50:261092000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:22:50:266921000: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 23:22:50:273530000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 23:22:50:279781000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:22:50:285564000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 23:22:50:296653000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:22:50:302177000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:22:50:307586000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:22:50:312620000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:22:50:317446000: _call_curl: Turbo Mode
[DEBUG] 23:22:50:321946000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:22:52:035094000: ollama_api_post: success: return 0
[DEBUG] 23:22:52:054074000: _is_valid_json: VALID: return 0
[DEBUG] 23:22:52:070152000: ollama_chat_json: content: [Understood.]
[DEBUG] 23:22:52:077007000: ollama_chat_json: return 0
[DEBUG] 23:22:52:090237000: _is_valid_json: VALID: return 0
[DEBUG] 23:22:52:102996000: ollama_chat: return: 0
Understood.
[DEBUG] 23:22:52:109184000: ollama_messages_add: [assistant] [Understood.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:22:52:122380000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:22:52:134647000: ollama_chat: [gpt-oss:120b]
[DEBUG] 23:22:52:140682000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:22:52:146788000: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 23:22:52:152900000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 23:22:52:158615000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:22:52:164294000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 23:22:52:176202000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:22:52:182094000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:22:52:187324000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:22:52:192038000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:22:52:197093000: _call_curl: Turbo Mode
[DEBUG] 23:22:52:201719000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:22:53:366539000: ollama_api_post: success: return 0
[DEBUG] 23:22:53:388482000: _is_valid_json: VALID: return 0
[DEBUG] 23:22:53:404062000: ollama_chat_json: content: [RABBIT.]
[DEBUG] 23:22:53:410585000: ollama_chat_json: return 0
[DEBUG] 23:22:53:424295000: _is_valid_json: VALID: return 0
[DEBUG] 23:22:53:436493000: ollama_chat: return: 0
RABBIT.
[DEBUG] 23:22:53:442672000: ollama_messages_add: [assistant] [RABBIT.]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:22:53:454560000: ollama_messages
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
