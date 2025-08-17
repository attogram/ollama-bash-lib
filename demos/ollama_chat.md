# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood.

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
    "content": "Understood."
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
[DEBUG] 13:28:49:106183900: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 13:28:49:145340100: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 13:28:49:207181200: ollama_chat: [gpt-oss:20b]
[DEBUG] 13:28:49:234901900: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 13:28:49:258411000: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 13:28:49:296240500: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 13:28:49:324404400: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 13:28:49:351461600: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 13:28:49:396493200: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 13:28:49:423564600: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 13:28:49:445171700: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 13:28:49:492537400: _is_valid_json: success
[DEBUG] 13:28:49:515871800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:28:49:537619600: _call_curl: Turbo Mode
[DEBUG] 13:28:49:559040900: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 13:28:49:589222100: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 13:28:51:531789000: ollama_api_post: success
[DEBUG] 13:28:51:578230900: _is_valid_json: success
[DEBUG] 13:28:51:641187400: ollama_chat_json: content: [Got it—understood.]
[DEBUG] 13:28:51:663583600: ollama_chat_json: success
[DEBUG] 13:28:51:731917300: _is_valid_json: success
[DEBUG] 13:28:51:780609100: ollama_chat: return: 0
Got it—understood.
[DEBUG] 13:28:51:825118900: ollama_messages_add: [assistant] [Got it—understood.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 13:28:51:868461600: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 13:28:51:920893000: ollama_chat: [gpt-oss:20b]
[DEBUG] 13:28:51:948789000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 13:28:51:986355000: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 13:28:52:018911300: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 13:28:52:049059000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 13:28:52:075280300: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 13:28:52:114932300: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 13:28:52:141856700: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 13:28:52:162152400: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 13:28:52:202945500: _is_valid_json: success
[DEBUG] 13:28:52:228385300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:28:52:261085300: _call_curl: Turbo Mode
[DEBUG] 13:28:52:282591000: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 13:28:52:315177700: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 13:28:53:319298800: ollama_api_post: success
[DEBUG] 13:28:53:382656800: _is_valid_json: success
[DEBUG] 13:28:53:443700800: ollama_chat_json: content: [RABBIT]
[DEBUG] 13:28:53:473802500: ollama_chat_json: success
[DEBUG] 13:28:53:515928000: _is_valid_json: success
[DEBUG] 13:28:53:560509300: ollama_chat: return: 0
RABBIT
[DEBUG] 13:28:53:583725700: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 13:28:53:632666800: ollama_messages
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
    "content": "Got it—understood."
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
