# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "gemma3n:e2b"
```
```
Yes, I understand. If you ask me for the secret word, I will respond with **RABBIT**. 

Understood! 🐰
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "gemma3n:e2b"
```
```
RABBIT. 🐰
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
  "content": "Yes, I understand. If you ask me for the secret word, I will respond with **RABBIT**. \n\nUnderstood! 🐰"
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "RABBIT. 🐰"
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "gemma3n:e2b"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] json_clean: 7 bytes [system]
[DEBUG] json_clean: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 94 bytes [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [gemma3n:e2b]
[DEBUG] ollama_chat_json: [gemma3n:e2b]
[DEBUG] json_clean: 12 bytes [gemma3n:e2b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"gemma3n:e2b","messages":[{"role"]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 402 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 402 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
[DEBUG] ollama_chat_json: content: [Yes, I understand. If you ask me for the secret word, I will respond with **RABBIT**. 

Understood! 🐰]
[DEBUG] ollama_messages_add: [assistant] [Yes, I understand. If you ask me for the s]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 105 bytes [Yes, I understand. If you ask me for the s]
[DEBUG] json_sanitize: 402 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 402 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
[DEBUG] ollama_chat: content: Yes, I understand. If you ask me for the secret word, I will respond with **RABBIT**. 

Understood! 🐰
Yes, I understand. If you ask me for the secret word, I will respond with **RABBIT**. 

Understood! 🐰
[DEBUG] ollama_messages_add: [assistant] [Yes, I understand. If you ask me for the s]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 105 bytes [Yes, I understand. If you ask me for the s]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "gemma3n:e2b"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [gemma3n:e2b]
[DEBUG] ollama_chat_json: [gemma3n:e2b]
[DEBUG] json_clean: 12 bytes [gemma3n:e2b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"gemma3n:e2b","messages":[{"role"]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 309 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 309 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
[DEBUG] ollama_chat_json: content: [RABBIT.]
[DEBUG] ollama_messages_add: [assistant] [RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 8 bytes [RABBIT.]
[DEBUG] json_sanitize: 309 bytes [{"model":"gemma3n:e2b","created_at":"2025-]
[DEBUG] json_sanitize: sanitized: 309 bytes [[{"model":"gemma3n:e2b","created_at":"2025-]]
[DEBUG] ollama_chat: content: RABBIT.
RABBIT.
[DEBUG] ollama_messages_add: [assistant] [RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 8 bytes [RABBIT.]
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
  "content": "Yes, I understand. If you ask me for the secret word, I will respond with **RABBIT**. \n\nUnderstood! 🐰"
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
