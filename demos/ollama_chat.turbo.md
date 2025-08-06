# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.13

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it!

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
  "content": "Got it!"
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
[DEBUG] 00:46:35:543481400: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:46:35:567847900: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:46:35:596447100: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:46:35:613119300: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:46:35:641868300: ollama_chat_json: json_payload: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 00:46:35:657818200: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:46:35:669200100: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:46:35:680436400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:46:35:693792800: _call_curl: Turbo Mode
[DEBUG] 00:46:35:705208300: _call_curl: adding json body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:46:37:084915800: ollama_api_post: success: return 0
[DEBUG] 00:46:45:216910900: ollama_chat_json: content: [Got it—RABBIT is the secret word. If you a]
[DEBUG] 00:46:45:229143100: ollama_chat_json: return 0
[DEBUG] 00:46:53:312621100: ollama_chat: return: 0
Got it—RABBIT is the secret word. If you ask for it, I’ll respond with “RABBIT.”
[DEBUG] 00:46:53:324106500: ollama_messages_add: [assistant] [Got it—RABBIT is the secret word. If you a]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:46:53:346659700: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:46:53:376938500: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:46:53:393293700: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:46:53:427554500: ollama_chat_json: json_payload: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Got it—RABBIT is the secret word. If you ask for it, I’ll respond with “RABBIT.”"},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 00:46:53:443639000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:46:53:454693600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:46:53:465105200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:46:53:475111700: _call_curl: Turbo Mode
[DEBUG] 00:46:53:485508000: _call_curl: adding json body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:46:54:390401900: ollama_api_post: success: return 0
[DEBUG] 00:46:56:823199800: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:46:56:835060800: ollama_chat_json: return 0
[DEBUG] 00:46:59:412026400: ollama_chat: return: 0
RABBIT
[DEBUG] 00:46:59:424914300: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:46:59:453875400: ollama_messages
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
  "content": "Got it—RABBIT is the secret word. If you ask for it, I’ll respond with “RABBIT.”"
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
