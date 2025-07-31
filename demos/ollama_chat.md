# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "granite3.3:8b"
```
```
Understood. If you ask for the secret word, I will respond with "RABBIT".
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "granite3.3:8b"
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
  "content": "Understood. If you ask for the secret word, I will respond with \"RABBIT\"."
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

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "granite3.3:8b"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] json_clean: 7 bytes [system]
[DEBUG] json_clean: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 94 bytes [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [granite3.3:8b]
[DEBUG] ollama_chat_json: [granite3.3:8b]
[DEBUG] json_clean: 14 bytes [granite3.3:8b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"granite3.3:8b","messages":[{"rol]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 368 bytes [{"model":"granite3.3:8b","created_at":"202]
[DEBUG] json_sanitize: sanitized: 368 bytes [[{"model":"granite3.3:8b","created_at":"202]]
[DEBUG] ollama_chat_json: content: [Understood. If you ask for the secret word, I will respond with RABBIT.]
[DEBUG] ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 72 bytes [Understood. If you ask for the secret word]
[DEBUG] json_sanitize: 368 bytes [{"model":"granite3.3:8b","created_at":"202]
[DEBUG] json_sanitize: sanitized: 368 bytes [[{"model":"granite3.3:8b","created_at":"202]]
[DEBUG] ollama_chat: content: Understood. If you ask for the secret word, I will respond with RABBIT.
Understood. If you ask for the secret word, I will respond with RABBIT.
[DEBUG] ollama_messages_add: [assistant] [Understood. If you ask for the secret word]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 72 bytes [Understood. If you ask for the secret word]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "granite3.3:8b"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [granite3.3:8b]
[DEBUG] ollama_chat_json: [granite3.3:8b]
[DEBUG] json_clean: 14 bytes [granite3.3:8b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"granite3.3:8b","messages":[{"rol]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 321 bytes [{"model":"granite3.3:8b","created_at":"202]
[DEBUG] json_sanitize: sanitized: 321 bytes [[{"model":"granite3.3:8b","created_at":"202]]
[DEBUG] ollama_chat_json: content: [The secret word is RABBIT.]
[DEBUG] ollama_messages_add: [assistant] [The secret word is RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 27 bytes [The secret word is RABBIT.]
[DEBUG] json_sanitize: 321 bytes [{"model":"granite3.3:8b","created_at":"202]
[DEBUG] json_sanitize: sanitized: 321 bytes [[{"model":"granite3.3:8b","created_at":"202]]
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
  "content": "Understood. If you ask for the secret word, I will respond with RABBIT."
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
