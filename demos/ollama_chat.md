# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.43

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood—if you ask for the secret word, I’ll respond with **RABBIT**.

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
  "content": "Understood—if you ask for the secret word, I’ll respond with **RABBIT**."
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
[DEBUG] 00:18:23:934401500: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:18:23:962147100: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:18:23:996728600: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:18:24:019430100: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:18:24:055422600: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:18:24:077034200: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:18:24:094844200: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:18:24:111900700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:18:24:127910200: _call_curl: Turbo Mode
[DEBUG] 00:18:24:146553900: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:18:25:612414500: ollama_api_post: success: return 0
[DEBUG] 00:18:25:657000100: _is_valid_json: VALID: return 0
[DEBUG] 00:18:25:704958300: ollama_chat_json: content: [Understood. If you ask for the secret word]
[DEBUG] 00:18:25:721508100: ollama_chat_json: return 0
[DEBUG] 00:18:25:767170900: _is_valid_json: VALID: return 0
[DEBUG] 00:18:25:814459000: ollama_chat: return: 0
Understood. If you ask for the secret word, I’ll respond with **RABBIT**.
[DEBUG] 00:18:25:832644600: ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:18:25:862424400: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:18:25:907819300: ollama_chat: [gpt-oss:120b]
[DEBUG] 00:18:25:929475900: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 00:18:25:963330300: ollama_chat_json: json_payload: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:18:25:985261400: ollama_api_post: [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:18:26:001499500: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:18:26:019320000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:18:26:036486500: _call_curl: Turbo Mode
[DEBUG] 00:18:26:053899000: _call_curl: json_body: [{"model":"gpt-oss:120b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"]
[DEBUG] 00:18:27:350733900: ollama_api_post: success: return 0
[DEBUG] 00:18:27:399807300: _is_valid_json: VALID: return 0
[DEBUG] 00:18:27:438517200: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:18:27:455483300: ollama_chat_json: return 0
[DEBUG] 00:18:27:522072200: _is_valid_json: VALID: return 0
[DEBUG] 00:18:27:566850100: ollama_chat: return: 0
RABBIT
[DEBUG] 00:18:27:584687500: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:18:27:619170500: ollama_messages
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
