# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it. If you ask for it, I'll reply with **RABBIT**.

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
  "content": "Got it. If you ask for it, I'll reply with **RABBIT**."
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
[DEBUG] 22:15:45:927921600: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:15:45:950630200: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:15:45:978405500: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:15:45:994958300: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:15:46:023456900: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:15:46:040696700: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:15:46:050709900: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:15:46:061806000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:15:46:072349800: _call_curl: Turbo Mode
[DEBUG] 22:15:46:083348300: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:15:47:278139400: ollama_api_post: success: return 0
[DEBUG] 22:15:47:325515000: _is_valid_json: VALID: return 0
[DEBUG] 22:15:47:371206500: ollama_chat_json: content: [Got it—I’ll reply with “RABBIT” if you ask]
[DEBUG] 22:15:47:382751900: ollama_chat_json: return 0
[DEBUG] 22:15:47:413872500: _is_valid_json: VALID: return 0
[DEBUG] 22:15:47:463735200: ollama_chat: return: 0
Got it—I’ll reply with “RABBIT” if you ask for the secret word.
[DEBUG] 22:15:47:478563300: ollama_messages_add: [assistant] [Got it—I’ll reply with “RABBIT” if you ask]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:15:47:573295800: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:15:47:616763300: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:15:47:635765900: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:15:47:677008400: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:15:47:694019900: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:15:47:707233800: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:15:47:719325200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:15:47:730474900: _call_curl: Turbo Mode
[DEBUG] 22:15:47:742092900: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:15:48:784605600: ollama_api_post: success: return 0
[DEBUG] 22:15:48:826902400: _is_valid_json: VALID: return 0
[DEBUG] 22:15:48:863685600: ollama_chat_json: content: [RABBIT]
[DEBUG] 22:15:48:875491800: ollama_chat_json: return 0
[DEBUG] 22:15:48:920507200: _is_valid_json: VALID: return 0
[DEBUG] 22:15:48:969724100: ollama_chat: return: 0
RABBIT
[DEBUG] 22:15:48:982525500: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:15:49:012387800: ollama_messages
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
  "content": "Got it—I’ll reply with “RABBIT” if you ask for the secret word."
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
