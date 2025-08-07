# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood.

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
[DEBUG] 21:46:27:671818800: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 21:46:27:695717400: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 21:46:27:725366600: ollama_chat: [gpt-oss:120b]
[DEBUG] 21:46:27:743811800: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 21:46:27:778726700: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 21:46:27:796814800: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:46:27:807886800: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:46:27:820095900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:27:832039400: _call_curl: Turbo Mode
[DEBUG] 21:46:27:843770000: _call_curl: adding json body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:46:28:903450300: ollama_api_post: success: return 0
[DEBUG] 21:46:28:938322300: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:28:951246100: ollama_chat_json: content: [Understood. If you ask for the secret word]
[DEBUG] 21:46:28:963141700: ollama_chat_json: return 0
[DEBUG] 21:46:28:986262600: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:29:003456100: ollama_chat: return: 0
Understood. If you ask for the secret word, I’ll reply with **RABBIT**.
[DEBUG] 21:46:29:015325400: ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 21:46:29:041111600: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 21:46:29:068745500: ollama_chat: [gpt-oss:120b]
[DEBUG] 21:46:29:087444200: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 21:46:29:127043300: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Understood. If you ask for the secret word, I’ll reply with **RABBIT**."},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 21:46:29:147413900: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:46:29:161489600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:46:29:171975800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:29:182581100: _call_curl: Turbo Mode
[DEBUG] 21:46:29:195029900: _call_curl: adding json body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:46:30:279276600: ollama_api_post: success: return 0
[DEBUG] 21:46:30:302892700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:30:321536400: ollama_chat_json: content: [RABBIT]
[DEBUG] 21:46:30:333297300: ollama_chat_json: return 0
[DEBUG] 21:46:30:358293700: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:46:30:370204100: ollama_chat: return: 0
RABBIT
[DEBUG] 21:46:30:396685800: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 21:46:30:425200600: ollama_messages
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
  "content": "Understood. If you ask for the secret word, I’ll reply with **RABBIT**."
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
