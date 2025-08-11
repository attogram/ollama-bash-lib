# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.5

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it.

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
  "content": "Got it."
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
[DEBUG] 22:37:50:711311000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:37:50:724996000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:37:50:738489000: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:37:50:745111000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:37:50:750804000: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 22:37:50:756612000: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:37:50:762655000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:37:50:768312000: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 22:37:50:779931000: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:37:50:786039000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:37:50:791436000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:37:50:796692000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:37:50:802014000: _call_curl: Turbo Mode
[DEBUG] 22:37:50:806692000: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:37:52:644702000: ollama_api_post: success: return 0
[DEBUG] 22:37:52:667124000: _is_valid_json: VALID: return 0
[DEBUG] 22:37:52:684150000: ollama_chat_json: content: [Understood. If you ask for the secret word]
[DEBUG] 22:37:52:690781000: ollama_chat_json: return 0
[DEBUG] 22:37:52:704527000: _is_valid_json: VALID: return 0
[DEBUG] 22:37:52:717646000: ollama_chat: return: 0
Understood. If you ask for the secret word, I’ll respond with RABBIT.
[DEBUG] 22:37:52:724641000: ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:37:52:736850000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:37:52:749201000: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:37:52:755251000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:37:52:760913000: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 22:37:52:766487000: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:37:52:772393000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:37:52:777982000: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 22:37:52:788886000: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:37:52:793555000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:37:52:798433000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:37:52:802933000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:37:52:807545000: _call_curl: Turbo Mode
[DEBUG] 22:37:52:812102000: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:37:53:888922000: ollama_api_post: success: return 0
[DEBUG] 22:37:53:908838000: _is_valid_json: VALID: return 0
[DEBUG] 22:37:53:925123000: ollama_chat_json: content: [RABBIT]
[DEBUG] 22:37:53:931892000: ollama_chat_json: return 0
[DEBUG] 22:37:53:945034000: _is_valid_json: VALID: return 0
[DEBUG] 22:37:53:957096000: ollama_chat: return: 0
RABBIT
[DEBUG] 22:37:53:963207000: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:37:53:974331000: ollama_messages
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
  "content": "Understood. If you ask for the secret word, I’ll respond with RABBIT."
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
