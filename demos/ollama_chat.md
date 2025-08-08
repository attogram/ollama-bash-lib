# ollama_chat
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.27

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[ERROR] ollama_chat: ollama_chat_json failed


```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[ERROR] ollama_chat: ollama_chat_json failed


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
  "content": ""
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": ""
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
[DEBUG] 22:40:25:056286200: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 22:40:25:080965700: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 22:40:25:111194000: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:40:25:128699300: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:40:25:161035800: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:40:25:179142800: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:40:25:191470400: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:40:25:202983700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:40:25:213929600: _call_curl: Turbo Mode
[DEBUG] 22:40:25:226738800: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:40:26:277427900: ollama_api_post: success: return 0
[DEBUG] 22:40:26:322459500: ollama_chat_json: content: [Got it—if you ask for the secret word, I’l]
[DEBUG] 22:40:26:333159200: ollama_chat_json: return 0
[DEBUG] 22:40:26:368803800: ollama_chat: return: 0
Got it—if you ask for the secret word, I’ll reply with RABBIT.
[DEBUG] 22:40:26:379792500: ollama_messages_add: [assistant] [Got it—if you ask for the secret word, I’l]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 22:40:26:402642200: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 22:40:26:430343400: ollama_chat: [gpt-oss:20b]
[DEBUG] 22:40:26:445804000: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 22:40:26:473922800: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:40:26:491316200: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:40:26:503158900: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:40:26:513747400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:40:26:524094600: _call_curl: Turbo Mode
[DEBUG] 22:40:26:534974200: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 22:40:27:518581200: ollama_api_post: success: return 0
[DEBUG] 22:40:27:551888200: ollama_chat_json: content: [RABBIT]
[DEBUG] 22:40:27:562507500: ollama_chat_json: return 0
[DEBUG] 22:40:27:595619800: ollama_chat: return: 0
RABBIT
[DEBUG] 22:40:27:608064700: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 22:40:27:637374000: ollama_messages
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
  "content": "Got it—if you ask for the secret word, I’ll reply with RABBIT."
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
