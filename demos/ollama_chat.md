# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Yes, I understand. The secret word is **RABBIT**.

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
  "content": "Yes, I understand. The secret word is **RABBIT**."
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
[DEBUG] 00:37:22:451605200: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:37:22:488666400: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:37:22:531488400: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:37:22:569408500: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:37:22:593738700: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 00:37:22:623894000: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:37:22:659036900: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:37:22:683884400: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 00:37:22:727910100: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:37:22:759777700: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:37:22:787935400: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:37:22:810774500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:37:22:836410400: _call_curl: Turbo Mode
[DEBUG] 00:37:22:874207500: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:37:23:987714600: ollama_api_post: success: return 0
[DEBUG] 00:37:24:033283800: _is_valid_json: VALID: return 0
[DEBUG] 00:37:24:087390500: ollama_chat_json: content: [Understood! If you ask for the secret word]
[DEBUG] 00:37:24:109170000: ollama_chat_json: return 0
[DEBUG] 00:37:24:173334200: _is_valid_json: VALID: return 0
[DEBUG] 00:37:24:227540500: ollama_chat: return: 0
Understood! If you ask for the secret word, I’ll respond with **RABBIT**.
[DEBUG] 00:37:24:250696900: ollama_messages_add: [assistant] [Understood! If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:37:24:286550100: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:37:24:326491600: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:37:24:367081200: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:37:24:405649800: ollama_chat: model: [gpt-oss:120b]
[DEBUG] 00:37:24:434946500: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:37:24:472601800: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:37:24:495670800: ollama_chat_json: model: [gpt-oss:120b]
[DEBUG] 00:37:24:545741000: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:37:24:574264400: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:37:24:596056800: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:37:24:619368300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:37:24:653554700: _call_curl: Turbo Mode
[DEBUG] 00:37:24:677354700: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:37:25:768619400: ollama_api_post: success: return 0
[DEBUG] 00:37:25:817554800: _is_valid_json: VALID: return 0
[DEBUG] 00:37:25:869210600: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:37:25:892619700: ollama_chat_json: return 0
[DEBUG] 00:37:25:940763200: _is_valid_json: VALID: return 0
[DEBUG] 00:37:26:002609700: ollama_chat: return: 0
RABBIT
[DEBUG] 00:37:26:033550400: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:37:26:081575700: ollama_messages
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
  "content": "Understood! If you ask for the secret word, I’ll respond with **RABBIT**."
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
