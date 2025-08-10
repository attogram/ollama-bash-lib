# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.1

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it.

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
  "content": "Got it."
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
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 21:40:06:210803600: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 21:40:06:243032100: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 21:40:06:288377800: ollama_chat: [gpt-oss:20b]
[DEBUG] 21:40:06:324576900: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 21:40:06:365579800: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 21:40:06:401105800: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 21:40:06:434173700: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 21:40:06:459892800: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 21:40:06:505874100: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 21:40:06:544987100: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 21:40:06:567193200: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 21:40:06:598699400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:40:06:620769600: _call_curl: Turbo Mode
[DEBUG] 21:40:06:645911600: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 21:40:07:650432900: ollama_api_post: success: return 0
[DEBUG] 21:40:07:697112300: _is_valid_json: VALID: return 0
[DEBUG] 21:40:07:742006100: ollama_chat_json: content: [Got it! The secret word is **RABBIT**. If ]
[DEBUG] 21:40:07:762957900: ollama_chat_json: return 0
[DEBUG] 21:40:07:805906200: _is_valid_json: VALID: return 0
[DEBUG] 21:40:07:854887800: ollama_chat: return: 0
Got it! The secret word is **RABBIT**. If you ask, I’ll respond with it.
[DEBUG] 21:40:07:879509500: ollama_messages_add: [assistant] [Got it! The secret word is **RABBIT**. If ]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 21:40:07:915792600: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 21:40:07:959413000: ollama_chat: [gpt-oss:20b]
[DEBUG] 21:40:07:999873800: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 21:40:08:025122300: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 21:40:08:061627300: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 21:40:08:108701400: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 21:40:08:133207100: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 21:40:08:177204700: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 21:40:08:209064800: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 21:40:08:243361800: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 21:40:08:266213600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:40:08:290530000: _call_curl: Turbo Mode
[DEBUG] 21:40:08:313613200: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 21:40:09:314807800: ollama_api_post: success: return 0
[DEBUG] 21:40:09:377407600: _is_valid_json: VALID: return 0
[DEBUG] 21:40:09:422379600: ollama_chat_json: content: [RABBIT]
[DEBUG] 21:40:09:444233600: ollama_chat_json: return 0
[DEBUG] 21:40:09:515917100: _is_valid_json: VALID: return 0
[DEBUG] 21:40:09:561963800: ollama_chat: return: 0
RABBIT
[DEBUG] 21:40:09:583490400: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 21:40:09:624964900: ollama_messages
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
  "content": "Got it! The secret word is **RABBIT**. If you ask, I’ll respond with it."
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
