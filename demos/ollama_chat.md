# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.2

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood! If you ask me for the secret word, I’ll respond with “RABBIT.”

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
{
  "role": "system",
  "content": "You are a helpful assistant"
}
{
  "role": "user",
  "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
}
{
  "role": "assistant",
  "content": "Understood! If you ask me for the secret word, I’ll respond with “RABBIT.”"
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "RABBIT"
}
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
[DEBUG] 22:15:35:488604000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:15:35:523268200: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:15:35:568429800: ollama_chat: [gpt-oss:120b]
[DEBUG] 22:15:35:605120500: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:15:35:628785400: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 22:15:35:666616100: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 22:15:35:695548100: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:15:35:720196000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 22:15:35:764793900: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:15:35:804154600: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:15:35:851458600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:15:35:899658600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:15:35:925420200: _call_curl: Turbo Mode
[DEBUG] 22:15:35:950898200: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:15:38:244838700: ollama_api_post: success: return 0
[DEBUG] 22:15:38:292397100: _is_valid_json: VALID: return 0
[DEBUG] 22:15:38:343227300: ollama_chat_json: content: [Understood. If you ask me for the secret w]
[DEBUG] 22:15:38:380367300: ollama_chat_json: return 0
[DEBUG] 22:15:38:438128900: _is_valid_json: VALID: return 0
[DEBUG] 22:15:38:506838100: ollama_chat: return: 0
Understood. If you ask me for the secret word, I’ll respond with **RABBIT**.
[DEBUG] 22:15:38:558327700: ollama_messages_add: [assistant] [Understood. If you ask me for the secret w]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:15:38:602483700: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:15:38:650313200: ollama_chat: [gpt-oss:120b]
[DEBUG] 22:15:38:691191900: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:15:38:718679300: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 22:15:38:755761200: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 22:15:38:820710800: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:15:38:858869100: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 22:15:38:903818700: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:15:38:962733200: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:15:38:989393400: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:15:39:014325500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:15:39:037719200: _call_curl: Turbo Mode
[DEBUG] 22:15:39:065222100: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:15:40:149705200: ollama_api_post: success: return 0
[DEBUG] 22:15:40:193971500: _is_valid_json: VALID: return 0
[DEBUG] 22:15:40:241328200: ollama_chat_json: content: [RABBIT.]
[DEBUG] 22:15:40:272882600: ollama_chat_json: return 0
[DEBUG] 22:15:40:320991800: _is_valid_json: VALID: return 0
[DEBUG] 22:15:40:381965600: ollama_chat: return: 0
RABBIT.
[DEBUG] 22:15:40:404074800: ollama_messages_add: [assistant] [RABBIT.]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:15:40:444835300: ollama_messages
{
  "role": "system",
  "content": "You are a helpful assistant"
}
{
  "role": "user",
  "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
}
{
  "role": "assistant",
  "content": "Understood. If you ask me for the secret word, I’ll respond with **RABBIT**."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "RABBIT."
}
```
