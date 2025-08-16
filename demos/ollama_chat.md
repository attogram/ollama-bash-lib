# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it! If you ask for the secret word, I’ll reply with “RABBIT.”

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
    "content": "Got it! If you ask for the secret word, I’ll reply with “RABBIT.”"
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
[DEBUG] 00:17:32:487791600: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:17:32:522082500: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:17:32:566071200: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:17:32:592070700: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 00:17:32:615069800: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 00:17:32:646946200: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:17:32:677133300: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 00:17:32:704669100: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 00:17:32:746691500: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:17:32:789132200: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 00:17:32:813085500: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 00:17:32:851273900: _is_valid_json: success
[DEBUG] 00:17:32:873978100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:17:32:895646100: _call_curl: Turbo Mode
[DEBUG] 00:17:32:919011000: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 00:17:32:941021300: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 00:17:33:827515800: ollama_api_post: success
[DEBUG] 00:17:33:867641200: _is_valid_json: success
[DEBUG] 00:17:33:927737700: ollama_chat_json: content: [Yes, I understand.]
[DEBUG] 00:17:33:950693800: ollama_chat_json: success
[DEBUG] 00:17:33:997851400: _is_valid_json: success
[DEBUG] 00:17:34:042706700: ollama_chat: return: 0
Yes, I understand.
[DEBUG] 00:17:34:076191100: ollama_messages_add: [assistant] [Yes, I understand.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:17:34:123303800: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:17:34:170299900: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:17:34:197849500: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 00:17:34:233288600: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 00:17:34:260904000: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:17:34:289229500: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 00:17:34:324355200: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 00:17:34:387292100: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:17:34:422096600: ollama_api_post: [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 00:17:34:446114800: _call_curl: [POST] [/api/chat] {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 00:17:34:492641400: _is_valid_json: success
[DEBUG] 00:17:34:524173200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:17:34:554974800: _call_curl: Turbo Mode
[DEBUG] 00:17:34:586526300: _call_curl: json_body: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T
[DEBUG] 00:17:34:609776800: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/chat -d @-
[DEBUG] 00:17:35:626927900: ollama_api_post: success
[DEBUG] 00:17:35:665202000: _is_valid_json: success
[DEBUG] 00:17:35:710462300: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:17:35:731857600: ollama_chat_json: success
[DEBUG] 00:17:35:770786100: _is_valid_json: success
[DEBUG] 00:17:35:831560600: ollama_chat: return: 0
RABBIT
[DEBUG] 00:17:35:878342900: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:17:35:918322600: ollama_messages
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
