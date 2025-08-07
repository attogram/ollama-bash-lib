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
Understood! If you ask for the secret word, I’ll respond with **RABBIT**.

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
[DEBUG] 21:35:39:807794100: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 21:35:39:840210700: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 21:35:39:877182400: ollama_chat: [gpt-oss:120b]
[DEBUG] 21:35:39:893520200: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 21:35:39:923727700: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 21:35:39:943915500: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:35:39:955824300: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:35:39:968090800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:35:39:979896700: _call_curl: Turbo Mode
[DEBUG] 21:35:39:990693100: _call_curl: adding json body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:35:41:216498800: ollama_api_post: success: return 0
[DEBUG] 21:35:41:238671500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:41:250212600: ollama_chat_json: content: [Understood.]
[DEBUG] 21:35:41:260930100: ollama_chat_json: return 0
[DEBUG] 21:35:41:282896400: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:41:296070300: ollama_chat: return: 0
Understood.
[DEBUG] 21:35:41:307652300: ollama_messages_add: [assistant] [Understood.]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 21:35:41:330993300: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 21:35:41:359715900: ollama_chat: [gpt-oss:120b]
[DEBUG] 21:35:41:377003700: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 21:35:41:405595300: ollama_chat_json: json_payload: {"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Understood."},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 21:35:41:423065800: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:35:41:436825600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:35:41:448736800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:35:41:459759700: _call_curl: Turbo Mode
[DEBUG] 21:35:41:470656700: _call_curl: adding json body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 21:35:42:445037700: ollama_api_post: success: return 0
[DEBUG] 21:35:42:466991500: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:42:478693300: ollama_chat_json: content: [RABBIT.]
[DEBUG] 21:35:42:490737400: ollama_chat_json: return 0
[DEBUG] 21:35:42:514691200: _escape_control_characters: Safe Mode OFF
[DEBUG] 21:35:42:527874400: ollama_chat: return: 0
RABBIT.
[DEBUG] 21:35:42:540566100: ollama_messages_add: [assistant] [RABBIT.]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 21:35:42:568386400: ollama_messages
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
  "content": "RABBIT."
}
```
