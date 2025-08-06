# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gemma3:4b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
RABBIT. 

Understood! 😊 

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gemma3:4b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
RABBIT. 

You got it! 😄

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
  "content": "RABBIT. \n\nUnderstood! 😊 "
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "RABBIT. \n\nYou got it! 😄"
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gemma3:4b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 14:10:44:356039000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 14:10:44:371968000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 14:10:44:388166000: ollama_chat: [gemma3:4b]
[DEBUG] 14:10:44:396115000: ollama_chat_json: [gemma3:4b]
[DEBUG] 14:10:44:413304000: ollama_chat_json: json_payload: {"model":"gemma3:4b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 14:10:44:421301000: ollama_api_post: [/api/chat] [{"model":"gemma3:4b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The]
[DEBUG] 14:10:44:428655000: _call_curl: [POST] [/api/chat] [{"model":"gemma3:4b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The]
[DEBUG] 14:10:44:435823000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 14:10:44:443233000: _call_curl: adding json body
[DEBUG] 14:10:45:097127000: ollama_api_post: success: return 0
[DEBUG] 14:10:47:192930000: ollama_chat_json: content: [RABBIT. 

Understood! 😊 ]
[DEBUG] 14:10:47:199651000: ollama_chat_json: return 0
[DEBUG] 14:10:49:744573000: ollama_chat: return: 0
RABBIT. 

Understood! 😊 
[DEBUG] 14:10:49:752496000: ollama_messages_add: [assistant] [RABBIT. 

Understood! 😊 ]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gemma3:4b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 14:10:49:767713000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 14:10:49:783077000: ollama_chat: [gemma3:4b]
[DEBUG] 14:10:49:791020000: ollama_chat_json: [gemma3:4b]
[DEBUG] 14:10:49:808083000: ollama_chat_json: json_payload: {"model":"gemma3:4b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"RABBIT. \n\nUnderstood! 😊 "},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 14:10:49:816082000: ollama_api_post: [/api/chat] [{"model":"gemma3:4b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The]
[DEBUG] 14:10:49:823584000: _call_curl: [POST] [/api/chat] [{"model":"gemma3:4b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The]
[DEBUG] 14:10:49:830852000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 14:10:49:837584000: _call_curl: adding json body
[DEBUG] 14:10:50:545423000: ollama_api_post: success: return 0
[DEBUG] 14:10:52:871264000: ollama_chat_json: content: [RABBIT. 

You got it! 😄]
[DEBUG] 14:10:52:879451000: ollama_chat_json: return 0
[DEBUG] 14:10:55:161977000: ollama_chat: return: 0
RABBIT. 

You got it! 😄
[DEBUG] 14:10:55:169789000: ollama_messages_add: [assistant] [RABBIT. 

You got it! 😄]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 14:10:55:185107000: ollama_messages
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
  "content": "RABBIT. \n\nUnderstood! 😊 "
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "RABBIT. \n\nYou got it! 😄"
}
```
