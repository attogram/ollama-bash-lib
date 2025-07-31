# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.12

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "cogito:3b"
```
```
Yes, I understand that if someone asks me for the secret word, I should respond with "RABBIT." I'm ready to help with this task!
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "cogito:3b"
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
  "content": "Yes, I understand that if someone asks me for the secret word, I should respond with \"RABBIT.\" I'm ready to help with this task!"
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
ollama_chat "cogito:3b"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] json_clean: 7 bytes [system]
[DEBUG] json_clean: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 94 bytes [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [cogito:3b]
[DEBUG] ollama_chat_json: [cogito:3b]
[DEBUG] json_clean: 10 bytes [cogito:3b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"cogito:3b","messages":[{"role":"]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 300 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 300 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
[DEBUG] ollama_chat_json: content: [Understood.]
[DEBUG] ollama_messages_add: [assistant] [Understood.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 12 bytes [Understood.]
[DEBUG] json_sanitize: 300 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 300 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
[DEBUG] ollama_chat: content: Understood.
Understood.
[DEBUG] ollama_messages_add: [assistant] [Understood.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 12 bytes [Understood.]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "cogito:3b"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [cogito:3b]
[DEBUG] ollama_chat_json: [cogito:3b]
[DEBUG] json_clean: 10 bytes [cogito:3b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"cogito:3b","messages":[{"role":"]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 296 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 296 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
[DEBUG] ollama_chat_json: content: [RABBIT]
[DEBUG] ollama_messages_add: [assistant] [RABBIT]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 7 bytes [RABBIT]
[DEBUG] json_sanitize: 296 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 296 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
[DEBUG] ollama_chat: content: RABBIT
RABBIT
[DEBUG] ollama_messages_add: [assistant] [RABBIT]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 7 bytes [RABBIT]
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
