# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.24

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood.

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
  "content": "RABBIT."
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
[DEBUG] 00:59:14:672091400: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:59:14:695003500: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:59:14:723813200: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:59:14:740632600: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:59:14:777247200: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 00:59:14:793505700: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:59:14:805142100: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:59:14:818089900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:59:14:830289300: _call_curl: Turbo Mode
[DEBUG] 00:59:14:841395300: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:59:16:258029400: ollama_api_post: success: return 0
[DEBUG] 00:59:16:304826600: ollama_chat_json: content: [Understood. The secret word is **RABBIT**.]
[DEBUG] 00:59:16:316142400: ollama_chat_json: return 0
[DEBUG] 00:59:16:353390400: ollama_chat: return: 0
Understood. The secret word is **RABBIT**. If you ask me for the secret word, I’ll respond with “RABBIT.”
[DEBUG] 00:59:16:365779500: ollama_messages_add: [assistant] [Understood. The secret word is **RABBIT**.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:59:16:390045300: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:59:16:420110500: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:59:16:436792800: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:59:16:464239000: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Understood. The secret word is **RABBIT**. If you ask me for the secret word, I’ll respond with “RABBIT.”"},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 00:59:16:481187300: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:59:16:491817200: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:59:16:503203700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:59:16:513618900: _call_curl: Turbo Mode
[DEBUG] 00:59:16:525248500: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:59:17:657894700: ollama_api_post: success: return 0
[DEBUG] 00:59:17:692487200: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:59:17:703559500: ollama_chat_json: return 0
[DEBUG] 00:59:17:735854100: ollama_chat: return: 0
RABBIT
[DEBUG] 00:59:17:747246200: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:59:17:783325300: ollama_messages
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
  "content": "Understood. The secret word is **RABBIT**. If you ask me for the secret word, I’ll respond with “RABBIT.”"
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
