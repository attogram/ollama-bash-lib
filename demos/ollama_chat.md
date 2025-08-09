# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.40

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it—I’ll respond with “RABBIT” if you ask for the secret word.

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
  "content": "Got it—I’ll respond with “RABBIT” if you ask for the secret word."
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
[DEBUG] 23:01:41:468396900: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:01:41:490193100: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:01:41:519720800: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:01:41:534351700: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:01:41:561296700: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:01:41:578122100: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:01:41:588839000: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:01:41:600058900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:01:41:611389700: _call_curl: Turbo Mode
[DEBUG] 23:01:41:622872400: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:01:42:744291500: ollama_api_post: success: return 0
[DEBUG] 23:01:42:773409100: _is_valid_json: VALID: return 0
[DEBUG] 23:01:42:821596500: ollama_chat_json: content: [Understood.]
[DEBUG] 23:01:42:832650800: ollama_chat_json: return 0
[DEBUG] 23:01:42:868981300: _is_valid_json: VALID: return 0
[DEBUG] 23:01:42:917820300: ollama_chat: return: 0
Understood.
[DEBUG] 23:01:42:931187700: ollama_messages_add: [assistant] [Understood.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:01:42:954291100: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:01:42:982554000: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:01:42:999108800: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:01:43:026232300: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:01:43:043578500: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:01:43:055616500: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:01:43:066565900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:01:43:077410000: _call_curl: Turbo Mode
[DEBUG] 23:01:43:087963300: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:01:44:066918200: ollama_api_post: success: return 0
[DEBUG] 23:01:44:096572100: _is_valid_json: VALID: return 0
[DEBUG] 23:01:44:132121400: ollama_chat_json: content: [RABBIT]
[DEBUG] 23:01:44:142650300: ollama_chat_json: return 0
[DEBUG] 23:01:44:172565300: _is_valid_json: VALID: return 0
[DEBUG] 23:01:44:205317300: ollama_chat: return: 0
RABBIT
[DEBUG] 23:01:44:217297300: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:01:44:245802900: ollama_messages
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
