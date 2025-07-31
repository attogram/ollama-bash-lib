# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.21

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "qwen2.5-coder:7b"
```
```
Yes, I understand. The secret word is RABBIT.
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "qwen2.5-coder:7b"
```
```
RABBIT
```
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
  "content": "Yes, I understand. The secret word is RABBIT."
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
ollama_chat "qwen2.5-coder:7b"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] json_clean: 7 bytes [system]
[DEBUG] json_clean: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 94 bytes [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [qwen2.5-coder:7b]
[DEBUG] ollama_chat_json: [qwen2.5-coder:7b]
[DEBUG] json_clean: 17 bytes [qwen2.5-coder:7b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"qwen2.5-coder:7b","messages":[{"]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 336 bytes [{"model":"qwen2.5-coder:7b","created_at":"]
[DEBUG] json_sanitize: sanitized: 336 bytes [[{"model":"qwen2.5-coder:7b","created_at":"]]
[DEBUG] ollama_chat_json: content: [Understood. The secret word is RABBIT.]
[DEBUG] ollama_messages_add: [assistant] [Understood. The secret word is RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 39 bytes [Understood. The secret word is RABBIT.]
[DEBUG] json_sanitize: 336 bytes [{"model":"qwen2.5-coder:7b","created_at":"]
[DEBUG] json_sanitize: sanitized: 336 bytes [[{"model":"qwen2.5-coder:7b","created_at":"]]
[DEBUG] ollama_chat: content: Understood. The secret word is RABBIT.
Understood. The secret word is RABBIT.
[DEBUG] ollama_messages_add: [assistant] [Understood. The secret word is RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 39 bytes [Understood. The secret word is RABBIT.]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "qwen2.5-coder:7b"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [qwen2.5-coder:7b]
[DEBUG] ollama_chat_json: [qwen2.5-coder:7b]
[DEBUG] json_clean: 17 bytes [qwen2.5-coder:7b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"qwen2.5-coder:7b","messages":[{"]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 324 bytes [{"model":"qwen2.5-coder:7b","created_at":"]
[DEBUG] json_sanitize: sanitized: 324 bytes [[{"model":"qwen2.5-coder:7b","created_at":"]]
[DEBUG] ollama_chat_json: content: [The secret word is RABBIT.]
[DEBUG] ollama_messages_add: [assistant] [The secret word is RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 27 bytes [The secret word is RABBIT.]
[DEBUG] json_sanitize: 324 bytes [{"model":"qwen2.5-coder:7b","created_at":"]
[DEBUG] json_sanitize: sanitized: 324 bytes [[{"model":"qwen2.5-coder:7b","created_at":"]]
[DEBUG] ollama_chat: content: The secret word is RABBIT.
The secret word is RABBIT.
[DEBUG] ollama_messages_add: [assistant] [The secret word is RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 27 bytes [The secret word is RABBIT.]
```
```bash
ollama_messages | jq
```
```json
[DEBUG] ollama_messages
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
  "content": "Understood. The secret word is RABBIT."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "The secret word is RABBIT."
}
```
