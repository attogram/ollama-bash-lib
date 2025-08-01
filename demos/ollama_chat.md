# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "mistral:7b"
```
```
 Yes, I understand. The secret word is RABBIT. If you ask me for the secret word, I will respond with RABBIT.
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "mistral:7b"
```
```
 The secret word is RABBIT.
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
  "content": " Yes, I understand. The secret word is RABBIT. If you ask me for the secret word, I will respond with RABBIT."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": " The secret word is RABBIT."
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "mistral:7b"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] json_clean: 7 bytes [system]
[DEBUG] json_clean: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 94 bytes [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [mistral:7b]
[DEBUG] ollama_chat_json: [mistral:7b]
[DEBUG] json_clean: 11 bytes [mistral:7b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"mistral:7b","messages":[{"role":]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 380 bytes [{"model":"mistral:7b","created_at":"2025-0]
[DEBUG] json_sanitize: sanitized: 380 bytes [[{"model":"mistral:7b","created_at":"2025-0]]
[DEBUG] ollama_chat_json: content: [ Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".]
[DEBUG] ollama_messages_add: [assistant] [ Yes, I understand. If you ask me for the ]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 85 bytes [ Yes, I understand. If you ask me for the ]
[DEBUG] json_sanitize: 380 bytes [{"model":"mistral:7b","created_at":"2025-0]
[DEBUG] json_sanitize: sanitized: 380 bytes [[{"model":"mistral:7b","created_at":"2025-0]]
[DEBUG] ollama_chat: content:  Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".
 Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".
[DEBUG] ollama_messages_add: [assistant] [ Yes, I understand. If you ask me for the ]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 85 bytes [ Yes, I understand. If you ask me for the ]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "mistral:7b"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [mistral:7b]
[DEBUG] ollama_chat_json: [mistral:7b]
[DEBUG] json_clean: 11 bytes [mistral:7b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"mistral:7b","messages":[{"role":]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 319 bytes [{"model":"mistral:7b","created_at":"2025-0]
[DEBUG] json_sanitize: sanitized: 319 bytes [[{"model":"mistral:7b","created_at":"2025-0]]
[DEBUG] ollama_chat_json: content: [ The secret word is RABBIT.]
[DEBUG] ollama_messages_add: [assistant] [ The secret word is RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 28 bytes [ The secret word is RABBIT.]
[DEBUG] json_sanitize: 319 bytes [{"model":"mistral:7b","created_at":"2025-0]
[DEBUG] json_sanitize: sanitized: 319 bytes [[{"model":"mistral:7b","created_at":"2025-0]]
[DEBUG] ollama_chat: content:  The secret word is RABBIT.
 The secret word is RABBIT.
[DEBUG] ollama_messages_add: [assistant] [ The secret word is RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 28 bytes [ The secret word is RABBIT.]
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
  "content": " Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": " The secret word is RABBIT."
}
```
