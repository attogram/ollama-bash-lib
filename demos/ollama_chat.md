# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it! When you ask for the secret word, I’ll reply with “RABBIT.”

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
    "content": "Got it! When you ask for the secret word, I’ll reply with “RABBIT.”"
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
[DEBUG] 22:55:49:829630200: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:55:49:870509500: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:55:49:909555100: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:55:49:939685500: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:55:49:968578800: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 22:55:50:004260600: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:55:50:036332600: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:55:50:059130700: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 22:55:50:103701600: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:55:50:144525900: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:55:50:167682000: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:55:50:207030400: _is_valid_json: success
[DEBUG] 22:55:50:228680000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:55:50:251350600: _call_curl: Turbo Mode
[DEBUG] 22:55:50:279893700: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:55:50:301935500: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 22:55:51:617537000: ollama_api_post: success
[DEBUG] 22:55:51:664663000: _is_valid_json: success
[DEBUG] 22:55:51:710601100: ollama_chat_json: content: [Got it! The secret word is RABBIT. When yo]
[DEBUG] 22:55:51:731765200: ollama_chat_json: success
[DEBUG] 22:55:51:788521400: _is_valid_json: success
[DEBUG] 22:55:51:845320700: ollama_chat: return: 0
Got it! The secret word is RABBIT. When you ask for it, I’ll respond with "RABBIT".
[DEBUG] 22:55:51:871884200: ollama_messages_add: [assistant] [Got it! The secret word is RABBIT. When yo]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:55:51:906845700: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:55:51:954720900: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:55:51:983049400: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:55:52:028155500: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 22:55:52:057328600: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:55:52:087671900: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:55:52:110740600: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 22:55:52:149236000: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:55:52:187516600: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:55:52:210540700: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:55:52:253628600: _is_valid_json: success
[DEBUG] 22:55:52:275970700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:55:52:298928300: _call_curl: Turbo Mode
[DEBUG] 22:55:52:325318600: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 22:55:52:358093200: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 22:55:53:773050400: ollama_api_post: success
[DEBUG] 22:55:53:818321500: _is_valid_json: success
[DEBUG] 22:55:53:883263600: ollama_chat_json: content: [RABBIT]
[DEBUG] 22:55:53:906670900: ollama_chat_json: success
[DEBUG] 22:55:53:973483600: _is_valid_json: success
[DEBUG] 22:55:54:050848900: ollama_chat: return: 0
RABBIT
[DEBUG] 22:55:54:081507500: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:55:54:126324300: ollama_messages
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
    "content": "Got it! The secret word is RABBIT. When you ask for it, I’ll respond with \"RABBIT\"."
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
