# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.6

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood. If you ask me for the secret word, I will respond with “RABBIT.”

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
  "content": "Understood. If you ask me for the secret word, I will respond with “RABBIT.”"
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
[DEBUG] 22:54:39:430821000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:54:39:444970000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:54:39:458370000: ollama_chat: [gpt-oss:120b]
[DEBUG] 22:54:39:464970000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:54:39:471019000: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 22:54:39:477259000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 22:54:39:482822000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:54:39:488173000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 22:54:39:499704000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:54:39:505168000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:54:39:510107000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:54:39:515103000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:54:39:520010000: _call_curl: Turbo Mode
[DEBUG] 22:54:39:524649000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:54:41:326951000: ollama_api_post: success: return 0
[DEBUG] 22:54:41:354333000: _is_valid_json: VALID: return 0
[DEBUG] 22:54:41:377260000: ollama_chat_json: content: [Understood.]
[DEBUG] 22:54:41:387041000: ollama_chat_json: return 0
[DEBUG] 22:54:41:405756000: _is_valid_json: VALID: return 0
[DEBUG] 22:54:41:422688000: ollama_chat: return: 0
Understood.
[DEBUG] 22:54:41:431080000: ollama_messages_add: [assistant] [Understood.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:54:41:445849000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:54:41:460785000: ollama_chat: [gpt-oss:120b]
[DEBUG] 22:54:41:467789000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:54:41:474298000: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 22:54:41:481565000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 22:54:41:488171000: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:54:41:494880000: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 22:54:41:507418000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:54:41:513653000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:54:41:519505000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:54:41:525447000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:54:41:531580000: _call_curl: Turbo Mode
[DEBUG] 22:54:41:537531000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 22:54:42:961087000: ollama_api_post: success: return 0
[DEBUG] 22:54:42:984777000: _is_valid_json: VALID: return 0
[DEBUG] 22:54:43:004017000: ollama_chat_json: content: [RABBIT]
[DEBUG] 22:54:43:013881000: ollama_chat_json: return 0
[DEBUG] 22:54:43:032246000: _is_valid_json: VALID: return 0
[DEBUG] 22:54:43:048518000: ollama_chat: return: 0
RABBIT
[DEBUG] 22:54:43:056788000: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:54:43:073147000: ollama_messages
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
