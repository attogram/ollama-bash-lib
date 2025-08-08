# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.25

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood. If you ask me for the secret word, I’ll respond with **RABBIT**.

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
  "content": "Understood. If you ask me for the secret word, I’ll respond with **RABBIT**."
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
[DEBUG] 20:20:24:234760900: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 20:20:24:257064300: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 20:20:24:284123300: ollama_chat: [gpt-oss:120b]
[DEBUG] 20:20:24:299237500: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 20:20:24:338260100: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 20:20:24:353653200: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 20:20:24:364708900: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 20:20:24:375251400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:20:24:386368000: _call_curl: Turbo Mode
[DEBUG] 20:20:24:396953700: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 20:20:25:785418000: ollama_api_post: success: return 0
[DEBUG] 20:20:25:820663200: ollama_chat_json: content: [Understood. If you ask for the secret word]
[DEBUG] 20:20:25:831669500: ollama_chat_json: return 0
[DEBUG] 20:20:25:864217500: ollama_chat: return: 0
Understood. If you ask for the secret word, I’ll respond with “RABBIT.”
[DEBUG] 20:20:25:875552300: ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 20:20:25:898459300: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 20:20:25:925815200: ollama_chat: [gpt-oss:120b]
[DEBUG] 20:20:25:940498000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 20:20:25:967360400: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Understood. If you ask for the secret word, I’ll respond with “RABBIT.”"},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 20:20:25:984464200: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 20:20:25:994890900: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 20:20:26:005161000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:20:26:016234700: _call_curl: Turbo Mode
[DEBUG] 20:20:26:027022800: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 20:20:27:288335200: ollama_api_post: success: return 0
[DEBUG] 20:20:27:335546800: ollama_chat_json: content: [RABBIT]
[DEBUG] 20:20:27:346150600: ollama_chat_json: return 0
[DEBUG] 20:20:27:379509500: ollama_chat: return: 0
RABBIT
[DEBUG] 20:20:27:391783700: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 20:20:27:421338100: ollama_messages
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
  "content": "Understood. If you ask for the secret word, I’ll respond with “RABBIT.”"
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
