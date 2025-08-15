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
Understood—I’ll respond with **RABBIT** if you ask for the secret word.

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
    "content": "Understood—I’ll respond with **RABBIT** if you ask for the secret word."
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
[DEBUG] 23:37:50:548822000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:37:50:562352000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:37:50:574405000: ollama_chat: [gpt-oss:120b]
[DEBUG] 23:37:50:580205000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:37:50:585573000: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 23:37:50:591182000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 23:37:50:596808000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:37:50:601971000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 23:37:50:612360000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:37:50:617591000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:37:50:622379000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:37:50:627101000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:37:50:631927000: _call_curl: Turbo Mode
[DEBUG] 23:37:50:636473000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:37:51:968111000: ollama_api_post: success: return 0
[DEBUG] 23:37:51:993441000: _is_valid_json: VALID: return 0
[DEBUG] 23:37:52:020694000: ollama_chat_json: content: [Understood! If you ask for the secret word]
[DEBUG] 23:37:52:025978000: ollama_chat_json: return 0
[DEBUG] 23:37:52:037245000: _is_valid_json: VALID: return 0
[DEBUG] 23:37:52:051950000: ollama_chat: return: 0
Understood! If you ask for the secret word, I’ll respond with **RABBIT**.
[DEBUG] 23:37:52:059206000: ollama_messages_add: [assistant] [Understood! If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:37:52:072503000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:37:52:087108000: ollama_chat: [gpt-oss:120b]
[DEBUG] 23:37:52:093775000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:37:52:100439000: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 23:37:52:106374000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 23:37:52:111835000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:37:52:130602000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 23:37:52:188103000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:37:52:194672000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:37:52:200125000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:37:52:204945000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:37:52:209178000: _call_curl: Turbo Mode
[DEBUG] 23:37:52:212970000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:37:53:267763000: ollama_api_post: success: return 0
[DEBUG] 23:37:53:302180000: _is_valid_json: VALID: return 0
[DEBUG] 23:37:53:312846000: ollama_chat_json: content: [RABBIT.]
[DEBUG] 23:37:53:324261000: ollama_chat_json: return 0
[DEBUG] 23:37:53:335939000: _is_valid_json: VALID: return 0
[DEBUG] 23:37:53:365051000: ollama_chat: return: 0
RABBIT.
[DEBUG] 23:37:53:380514000: ollama_messages_add: [assistant] [RABBIT.]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:37:53:396063000: ollama_messages
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
    "content": "Understood! If you ask for the secret word, I’ll respond with **RABBIT**."
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
