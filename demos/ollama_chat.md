# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.35

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Yes, I understand. If you ask me for the secret word, I will reply with **RABBIT**.

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
  "content": "Yes, I understand. If you ask me for the secret word, I will reply with **RABBIT**."
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
[DEBUG] 13:10:35:136626500: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 13:10:35:158625500: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 13:10:35:184763400: ollama_chat: [gpt-oss:120b]
[DEBUG] 13:10:35:200463700: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 13:10:35:240663500: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 13:10:35:256137100: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 13:10:35:267273400: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 13:10:35:276698300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:10:35:286831700: _call_curl: Turbo Mode
[DEBUG] 13:10:35:297013100: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 13:10:36:600402400: ollama_api_post: success: return 0
[DEBUG] 13:10:36:635027200: ollama_chat_json: content: [Understood. If you ask for the secret word]
[DEBUG] 13:10:36:645391800: ollama_chat_json: return 0
[DEBUG] 13:10:36:690803800: ollama_chat: return: 0
Understood. If you ask for the secret word, I will respond with **RABBIT**.
[DEBUG] 13:10:36:701953500: ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 13:10:36:724910700: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 13:10:36:752722300: ollama_chat: [gpt-oss:120b]
[DEBUG] 13:10:36:768813300: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 13:10:36:798344000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 13:10:36:813456400: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 13:10:36:823081100: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 13:10:36:833758900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:10:36:844394800: _call_curl: Turbo Mode
[DEBUG] 13:10:36:854652400: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 13:10:37:852551600: ollama_api_post: success: return 0
[DEBUG] 13:10:37:884827100: ollama_chat_json: content: [RABBIT.]
[DEBUG] 13:10:37:895371200: ollama_chat_json: return 0
[DEBUG] 13:10:37:928438900: ollama_chat: return: 0
RABBIT.
[DEBUG] 13:10:37:939434900: ollama_messages_add: [assistant] [RABBIT.]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 13:10:37:965857400: ollama_messages
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
  "content": "RABBIT."
}
```
