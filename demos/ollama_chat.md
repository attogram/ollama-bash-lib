# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it! Whenever you ask for the secret word, I'll respond with **RABBIT**.

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
    "content": "Got it! Whenever you ask for the secret word, I'll respond with **RABBIT**."
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
[DEBUG] 23:08:52:147773000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:08:52:188375400: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:08:52:237111400: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:08:52:267430000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:08:52:292636100: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 23:08:52:325145100: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:08:52:359693500: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:08:52:385796400: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 23:08:52:431870600: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:08:52:460260200: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:08:52:483950700: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:08:52:528226400: _is_valid_json: success
[DEBUG] 23:08:52:559588400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:08:52:591502600: _call_curl: Turbo Mode
[DEBUG] 23:08:52:620373600: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:08:52:643826800: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 23:08:53:800783200: ollama_api_post: success
[DEBUG] 23:08:53:846887000: _is_valid_json: success
[DEBUG] 23:08:53:893805400: ollama_chat_json: content: [Yes, I understand.]
[DEBUG] 23:08:53:915688100: ollama_chat_json: success
[DEBUG] 23:08:53:955444200: _is_valid_json: success
[DEBUG] 23:08:54:014863900: ollama_chat: return: 0
Yes, I understand.
[DEBUG] 23:08:54:062380700: ollama_messages_add: [assistant] [Yes, I understand.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:08:54:105130900: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:08:54:149471900: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:08:54:191628000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:08:54:215305300: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 23:08:54:253419800: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:08:54:300320200: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:08:54:322286900: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 23:08:54:384529600: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:08:54:412821000: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:08:54:436976900: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:08:54:492644700: _is_valid_json: success
[DEBUG] 23:08:54:528455800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:08:54:551308900: _call_curl: Turbo Mode
[DEBUG] 23:08:54:590695400: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 23:08:54:619899000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 23:08:56:020322600: ollama_api_post: success
[DEBUG] 23:08:56:064726700: _is_valid_json: success
[DEBUG] 23:08:56:110906700: ollama_chat_json: content: [RABBIT]
[DEBUG] 23:08:56:132778600: ollama_chat_json: success
[DEBUG] 23:08:56:175152800: _is_valid_json: success
[DEBUG] 23:08:56:221577700: ollama_chat: return: 0
RABBIT
[DEBUG] 23:08:56:246570600: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:08:56:285502000: ollama_messages
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
    "content": "Yes, I understand."
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
