# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.29

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[ERROR] ollama_chat: ollama_chat_json failed


```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
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
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:52:50:407288600: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:52:50:433045200: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:52:50:464253500: ollama_chat: [gpt-oss:120b]
[DEBUG] 22:52:50:481370200: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 22:52:50:513104500: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:52:50:536981800: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:52:50:549617500: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:52:50:561486900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:52:50:573556800: _call_curl: Turbo Mode
[DEBUG] 22:52:50:585823300: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:52:51:878463800: ollama_api_post: success: return 0
[DEBUG] 22:52:51:912932100: ollama_chat_json: content: [Understood! If you ask me for the secret w]
[DEBUG] 22:52:51:924511100: ollama_chat_json: return 0
[DEBUG] 22:52:51:960051900: ollama_chat: return: 0
Understood! If you ask me for the secret word, I’ll respond with **RABBIT**.
[DEBUG] 22:52:51:972382200: ollama_messages_add: [assistant] [Understood! If you ask me for the secret w]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:52:51:993503000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:52:52:021491100: ollama_chat: [gpt-oss:120b]
[DEBUG] 22:52:52:038595800: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 22:52:52:072885200: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:52:52:089314800: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:52:52:100210700: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:52:52:111021300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:52:52:121331700: _call_curl: Turbo Mode
[DEBUG] 22:52:52:133020100: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:52:53:104358800: ollama_api_post: success: return 0
[DEBUG] 22:52:53:150749700: ollama_chat_json: content: [RABBIT]
[DEBUG] 22:52:53:161361700: ollama_chat_json: return 0
[DEBUG] 22:52:53:196707200: ollama_chat: return: 0
RABBIT
[DEBUG] 22:52:53:209040100: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:52:53:238189900: ollama_messages
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
  "content": "Understood! If you ask me for the secret word, I’ll respond with **RABBIT**."
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
