# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.44

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
  "content": "Understood. If you ask for the secret word, I’ll respond with **RABBIT**."
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
[DEBUG] 00:55:35:584829700: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:55:35:614627100: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:55:35:651413000: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:55:35:675295800: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:55:35:717736200: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:55:35:740408200: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:55:35:758185400: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:55:35:775750000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:35:791480900: _call_curl: Turbo Mode
[DEBUG] 00:55:35:809889900: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:55:37:168631600: ollama_api_post: success: return 0
[DEBUG] 00:55:37:203382700: _is_valid_json: VALID: return 0
[DEBUG] 00:55:37:245787900: ollama_chat_json: content: [Understood. If you ask for the secret word]
[DEBUG] 00:55:37:264127500: ollama_chat_json: return 0
[DEBUG] 00:55:37:304057900: _is_valid_json: VALID: return 0
[DEBUG] 00:55:37:345987100: ollama_chat: return: 0
Understood. If you ask for the secret word, I’ll respond with **RABBIT**.
[DEBUG] 00:55:37:363693500: ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:55:37:393171500: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:55:37:430599600: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:55:37:452805800: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:55:37:493082400: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:55:37:520260400: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:55:37:538393500: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:55:37:559453300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:37:577658700: _call_curl: Turbo Mode
[DEBUG] 00:55:37:595545900: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:55:38:914537600: ollama_api_post: success: return 0
[DEBUG] 00:55:38:950938700: _is_valid_json: VALID: return 0
[DEBUG] 00:55:39:008684400: ollama_chat_json: content: [RABBIT.]
[DEBUG] 00:55:39:027472800: ollama_chat_json: return 0
[DEBUG] 00:55:39:085459400: _is_valid_json: VALID: return 0
[DEBUG] 00:55:39:125508200: ollama_chat: return: 0
RABBIT.
[DEBUG] 00:55:39:143754700: ollama_messages_add: [assistant] [RABBIT.]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:55:39:179815600: ollama_messages
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
  "content": "Understood. If you ask for the secret word, I’ll respond with **RABBIT**."
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
