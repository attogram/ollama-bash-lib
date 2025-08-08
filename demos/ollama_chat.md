# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.32

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood.

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
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:33:54:725543100: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:33:54:748372100: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:33:54:774726200: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:33:54:793037900: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:33:54:828953300: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:33:54:846491300: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:33:54:856771700: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:33:54:867666600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:33:54:878149100: _call_curl: Turbo Mode
[DEBUG] 23:33:54:888744500: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:33:56:031986200: ollama_api_post: success: return 0
[DEBUG] 23:33:56:069777600: ollama_chat_json: content: [Got it—if you ask for the secret word, I'l]
[DEBUG] 23:33:56:081557900: ollama_chat_json: return 0
[DEBUG] 23:33:56:127456300: ollama_chat: return: 0
Got it—if you ask for the secret word, I'll reply with “RABBIT.”
[DEBUG] 23:33:56:140294400: ollama_messages_add: [assistant] [Got it—if you ask for the secret word, I'l]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:33:56:163811600: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:33:56:197118700: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:33:56:214459800: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:33:56:246469800: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:33:56:264112300: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:33:56:275871900: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:33:56:286608100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:33:56:297811800: _call_curl: Turbo Mode
[DEBUG] 23:33:56:309170900: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 23:33:57:407962700: ollama_api_post: success: return 0
[DEBUG] 23:33:57:444082300: ollama_chat_json: content: [RABBIT]
[DEBUG] 23:33:57:456408500: ollama_chat_json: return 0
[DEBUG] 23:33:57:492789900: ollama_chat: return: 0
RABBIT
[DEBUG] 23:33:57:504139400: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:33:57:532520200: ollama_messages
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
  "content": "Got it—if you ask for the secret word, I'll reply with “RABBIT.”"
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
