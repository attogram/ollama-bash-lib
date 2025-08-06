# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.15

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Yes, I understand.

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
  "content": "Yes, I understand."
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
[DEBUG] 00:53:09:726437200: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:53:09:749072700: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:53:09:778804100: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:53:09:798981600: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:53:09:829528900: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 00:53:09:857723800: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:53:09:868602600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:53:09:879319200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:53:09:890228100: _call_curl: Turbo Mode
[DEBUG] 00:53:09:901129800: _call_curl: adding json body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:53:11:041376200: ollama_api_post: success: return 0
[DEBUG] 00:53:14:527818900: ollama_chat_json: content: [Understood. If you ask for the secret word]
[DEBUG] 00:53:14:538572600: ollama_chat_json: return 0
[DEBUG] 00:53:19:198647600: ollama_chat: return: 0
Understood. If you ask for the secret word, I will respond with **RABBIT**.
[DEBUG] 00:53:19:209713100: ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:53:19:232569100: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:53:19:263521200: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:53:19:281056000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:53:19:317855600: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Understood. If you ask for the secret word, I will respond with **RABBIT**."},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 00:53:19:337656900: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:53:19:348301600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:53:19:360758800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:53:19:373148500: _call_curl: Turbo Mode
[DEBUG] 00:53:19:386655600: _call_curl: adding json body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:53:20:599720100: ollama_api_post: success: return 0
[DEBUG] 00:53:23:818978500: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:53:23:830023500: ollama_chat_json: return 0
[DEBUG] 00:53:26:927231000: ollama_chat: return: 0
RABBIT
[DEBUG] 00:53:26:939237800: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:53:26:968286500: ollama_messages
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
  "content": "Understood. If you ask for the secret word, I will respond with **RABBIT**."
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
