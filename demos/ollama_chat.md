# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.30

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[ERROR] ollama_chat: ollama_chat_json failed


```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[ERROR] ollama_chat: ollama_chat_json failed


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
  "content": ""
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": ""
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
[DEBUG] 23:07:20:360425600: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:07:20:383155600: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:07:20:412320300: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:07:20:427165600: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:07:20:466032600: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:07:20:481987400: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:07:20:493469500: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:07:20:503865800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:07:20:514720300: _call_curl: Turbo Mode
[DEBUG] 23:07:20:525539000: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:07:21:601517900: ollama_api_post: success: return 0
[DEBUG] 23:07:21:648035400: ollama_chat_json: content: [I understand. If you ask for the secret wo]
[DEBUG] 23:07:21:659450600: ollama_chat_json: return 0
[DEBUG] 23:07:21:694484100: ollama_chat: return: 0
I understand. If you ask for the secret word, I will respond with **RABBIT**.
[DEBUG] 23:07:21:706275000: ollama_messages_add: [assistant] [I understand. If you ask for the secret wo]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:07:21:729231700: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:07:21:757093900: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:07:21:773401100: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:07:21:801751700: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:07:21:818580100: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:07:21:828958100: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:07:21:840808000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:07:21:851749800: _call_curl: Turbo Mode
[DEBUG] 23:07:21:863011600: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:07:22:771854600: ollama_api_post: success: return 0
[DEBUG] 23:07:22:805391500: ollama_chat_json: content: [RABBIT]
[DEBUG] 23:07:22:815715900: ollama_chat_json: return 0
[DEBUG] 23:07:22:849385100: ollama_chat: return: 0
RABBIT
[DEBUG] 23:07:22:861574500: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:07:22:889016700: ollama_messages
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
  "content": "I understand. If you ask for the secret word, I will respond with **RABBIT**."
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
