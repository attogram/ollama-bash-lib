# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.41

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
[DEBUG] 23:11:38:524305500: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:11:38:554053400: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:11:38:590593800: ollama_chat: [gpt-oss:120b]
[DEBUG] 23:11:38:613925500: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 23:11:38:649005400: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:11:38:671162400: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:11:38:688743600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:11:38:704793600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:11:38:720526400: _call_curl: Turbo Mode
[DEBUG] 23:11:38:738045000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:11:40:402665500: ollama_api_post: success: return 0
[DEBUG] 23:11:40:447843600: _is_valid_json: VALID: return 0
[DEBUG] 23:11:40:494741700: ollama_chat_json: content: [Understood—if you ask for the secret word,]
[DEBUG] 23:11:40:510886300: ollama_chat_json: return 0
[DEBUG] 23:11:40:554994000: _is_valid_json: VALID: return 0
[DEBUG] 23:11:40:602217500: ollama_chat: return: 0
Understood—if you ask for the secret word, I’ll respond with “RABBIT.”
[DEBUG] 23:11:40:634678800: ollama_messages_add: [assistant] [Understood—if you ask for the secret word,]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:11:40:665486500: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:11:40:700201400: ollama_chat: [gpt-oss:120b]
[DEBUG] 23:11:40:721601800: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 23:11:40:769002000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:11:40:792268100: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:11:40:811768300: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:11:40:829029800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:11:40:845378200: _call_curl: Turbo Mode
[DEBUG] 23:11:40:863510900: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 23:11:41:893237100: ollama_api_post: success: return 0
[DEBUG] 23:11:41:926510600: _is_valid_json: VALID: return 0
[DEBUG] 23:11:41:971590100: ollama_chat_json: content: [RABBIT.]
[DEBUG] 23:11:41:988779000: ollama_chat_json: return 0
[DEBUG] 23:11:42:022645700: _is_valid_json: VALID: return 0
[DEBUG] 23:11:42:064547100: ollama_chat: return: 0
RABBIT.
[DEBUG] 23:11:42:095501300: ollama_messages_add: [assistant] [RABBIT.]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:11:42:129825300: ollama_messages
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
  "content": "Understood—if you ask for the secret word, I’ll respond with “RABBIT.”"
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
