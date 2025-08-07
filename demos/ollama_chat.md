# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.20

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood. The secret word is **RABBIT**. If you ask me for it, I'll respond with **RABBIT**.

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
  "content": "Understood. The secret word is **RABBIT**. If you ask me for it, I'll respond with **RABBIT**."
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
[DEBUG] 00:09:17:876997100: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:09:17:900281400: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:09:17:928454400: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:09:17:942820400: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:09:17:988389400: ollama_chat_json: json_payload: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 00:09:18:005757800: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:09:18:016716400: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:09:18:027633600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:09:18:038863500: _call_curl: Turbo Mode
[DEBUG] 00:09:18:051627300: _call_curl: adding json body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:09:19:280800900: ollama_api_post: success: return 0
[DEBUG] 00:09:19:314951800: ollama_chat_json: content: [Got it—RABBIT.]
[DEBUG] 00:09:19:326621400: ollama_chat_json: return 0
[DEBUG] 00:09:19:360742700: ollama_chat: return: 0
Got it—RABBIT.
[DEBUG] 00:09:19:371782700: ollama_messages_add: [assistant] [Got it—RABBIT.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:09:19:394410000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:09:19:422367300: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:09:19:437902600: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:09:19:481406600: ollama_chat_json: json_payload: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Got it—RABBIT."},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 00:09:19:496871000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:09:19:507414800: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:09:19:519336100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:09:19:529924300: _call_curl: Turbo Mode
[DEBUG] 00:09:19:540964200: _call_curl: adding json body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:09:20:637878900: ollama_api_post: success: return 0
[DEBUG] 00:09:20:682163600: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:09:20:692888500: ollama_chat_json: return 0
[DEBUG] 00:09:20:726108000: ollama_chat: return: 0
RABBIT
[DEBUG] 00:09:20:737265300: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:09:20:765514300: ollama_messages
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
  "content": "Got it—RABBIT."
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
