# ollama_chat
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.26

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
[DEBUG] 22:26:16:848126700: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:26:16:869700900: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:26:16:898923100: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:26:16:915637500: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:26:16:952341600: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:26:16:968847100: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:26:16:979688200: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:26:16:989665700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:26:16:999404800: _call_curl: Turbo Mode
[DEBUG] 22:26:17:010705100: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:26:18:196110200: ollama_api_post: success: return 0
[DEBUG] 22:26:18:242235600: ollama_chat_json: content: [Got it—if you ever ask for the secret word]
[DEBUG] 22:26:18:252930900: ollama_chat_json: return 0
[DEBUG] 22:26:18:285302000: ollama_chat: return: 0
Got it—if you ever ask for the secret word, I’ll reply with “RABBIT.”
[DEBUG] 22:26:18:296912900: ollama_messages_add: [assistant] [Got it—if you ever ask for the secret word]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:26:18:320136300: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:26:18:347428400: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:26:18:364118400: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:26:18:393073300: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:26:18:409558700: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:26:18:421680300: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:26:18:433345900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:26:18:443925500: _call_curl: Turbo Mode
[DEBUG] 22:26:18:455218800: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:26:19:275476500: ollama_api_post: success: return 0
[DEBUG] 22:26:19:321484800: ollama_chat_json: content: [RABBIT]
[DEBUG] 22:26:19:332179300: ollama_chat_json: return 0
[DEBUG] 22:26:19:384254300: ollama_chat: return: 0
RABBIT
[DEBUG] 22:26:19:395972900: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:26:19:424220800: ollama_messages
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
  "content": "Got it—if you ever ask for the secret word, I’ll reply with “RABBIT.”"
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
