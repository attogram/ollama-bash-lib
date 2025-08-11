# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.7

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it! If you ask for the secret word, I'll reply with RABBIT.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
The secret word is RABBIT.

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
  "content": "Got it! If you ask for the secret word, I'll reply with RABBIT."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "The secret word is RABBIT."
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
[DEBUG] 23:21:08:092797000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:21:08:106923000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:21:08:120162000: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:21:08:126577000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:21:08:132490000: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 23:21:08:138743000: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:21:08:144822000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:21:08:150469000: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 23:21:08:161865000: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:21:08:167532000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:21:08:172716000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:21:08:177754000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:21:08:182843000: _call_curl: Turbo Mode
[DEBUG] 23:21:08:187299000: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:21:09:385025000: ollama_api_post: success: return 0
[DEBUG] 23:21:09:406729000: _is_valid_json: VALID: return 0
[DEBUG] 23:21:09:423994000: ollama_chat_json: content: [Yes, I understand.]
[DEBUG] 23:21:09:431346000: ollama_chat_json: return 0
[DEBUG] 23:21:09:445556000: _is_valid_json: VALID: return 0
[DEBUG] 23:21:09:458472000: ollama_chat: return: 0
Yes, I understand.
[DEBUG] 23:21:09:465235000: ollama_messages_add: [assistant] [Yes, I understand.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:21:09:477681000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:21:09:489565000: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:21:09:495503000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:21:09:500871000: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 23:21:09:506734000: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:21:09:512535000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:21:09:517827000: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 23:21:09:528762000: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:21:09:533712000: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:21:09:538337000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:21:09:542843000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:21:09:547440000: _call_curl: Turbo Mode
[DEBUG] 23:21:09:551836000: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:21:10:612575000: ollama_api_post: success: return 0
[DEBUG] 23:21:10:633667000: _is_valid_json: VALID: return 0
[DEBUG] 23:21:10:648550000: ollama_chat_json: content: [RABBIT]
[DEBUG] 23:21:10:655252000: ollama_chat_json: return 0
[DEBUG] 23:21:10:669241000: _is_valid_json: VALID: return 0
[DEBUG] 23:21:10:682148000: ollama_chat: return: 0
RABBIT
[DEBUG] 23:21:10:688979000: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:21:10:701020000: ollama_messages
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
