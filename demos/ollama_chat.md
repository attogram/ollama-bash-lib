# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.34

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it! I understand.

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
  "content": "Got it! I understand."
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
[DEBUG] 00:50:56:348636400: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:50:56:371782600: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:50:56:401218100: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:50:56:418997400: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:50:56:449495800: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:50:56:465970400: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:50:56:478268600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:50:56:490362100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:50:56:501441900: _call_curl: Turbo Mode
[DEBUG] 00:50:56:513304900: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:50:57:597110600: ollama_api_post: success: return 0
[DEBUG] 00:50:57:633033200: ollama_chat_json: content: [Understood.]
[DEBUG] 00:50:57:644011100: ollama_chat_json: return 0
[DEBUG] 00:50:57:680886700: ollama_chat: return: 0
Understood.
[DEBUG] 00:50:57:692721700: ollama_messages_add: [assistant] [Understood.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:50:57:715892600: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:50:57:745029000: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:50:57:761521300: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:50:57:790080400: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:50:57:806580400: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:50:57:816852000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:50:57:827692100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:50:57:839250300: _call_curl: Turbo Mode
[DEBUG] 00:50:57:850664200: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:50:58:698611600: ollama_api_post: success: return 0
[DEBUG] 00:50:58:743959800: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:50:58:755351800: ollama_chat_json: return 0
[DEBUG] 00:50:58:805875400: ollama_chat: return: 0
RABBIT
[DEBUG] 00:50:58:818016500: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:50:58:848135300: ollama_messages
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
  "content": "Understood."
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
