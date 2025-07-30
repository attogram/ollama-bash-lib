# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.6

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "dolphin3:8b"
```
```
Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "dolphin3:8b"
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
  "content": "Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."
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
ollama_chat "dolphin3:8b"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] json_safe_value: 7 bytes [system]
[DEBUG] json_safe_value: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 94 bytes [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [dolphin3:8b]
[DEBUG] ollama_chat_json: [dolphin3:8b]
[DEBUG] json_safe_value: 12 bytes [dolphin3:8b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"dolphin3:8b","messages":[{"role"]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 394 bytes [{"model":"dolphin3:8b","created_at":"2025-]
[DEBUG] jq_sanitize: sanitized: 394 bytes [[{"model":"dolphin3:8b","created_at":"2025-]]
[DEBUG] ollama_chat_json: content: [Yes, I understand. The secret word is RABBIT. If you ask me for it, I will respond with "RABBIT".]
[DEBUG] ollama_messages_add: [assistant] [Yes, I understand. The secret word is RABB]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 98 bytes [Yes, I understand. The secret word is RABB]
[DEBUG] jq_sanitize: 394 bytes [{"model":"dolphin3:8b","created_at":"2025-]
[DEBUG] jq_sanitize: sanitized: 394 bytes [[{"model":"dolphin3:8b","created_at":"2025-]]
[DEBUG] ollama_chat: content: Yes, I understand. The secret word is RABBIT. If you ask me for it, I will respond with "RABBIT".
Yes, I understand. The secret word is RABBIT. If you ask me for it, I will respond with "RABBIT".
[DEBUG] ollama_messages_add: [assistant] [Yes, I understand. The secret word is RABB]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 98 bytes [Yes, I understand. The secret word is RABB]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "dolphin3:8b"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [dolphin3:8b]
[DEBUG] ollama_chat_json: [dolphin3:8b]
[DEBUG] json_safe_value: 12 bytes [dolphin3:8b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"dolphin3:8b","messages":[{"role"]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 319 bytes [{"model":"dolphin3:8b","created_at":"2025-]
[DEBUG] jq_sanitize: sanitized: 319 bytes [[{"model":"dolphin3:8b","created_at":"2025-]]
[DEBUG] ollama_chat_json: content: [The secret word is RABBIT.]
[DEBUG] ollama_messages_add: [assistant] [The secret word is RABBIT.]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 27 bytes [The secret word is RABBIT.]
[DEBUG] jq_sanitize: 319 bytes [{"model":"dolphin3:8b","created_at":"2025-]
[DEBUG] jq_sanitize: sanitized: 319 bytes [[{"model":"dolphin3:8b","created_at":"2025-]]
[DEBUG] ollama_chat: content: The secret word is RABBIT.
The secret word is RABBIT.
[DEBUG] ollama_messages_add: [assistant] [The secret word is RABBIT.]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 27 bytes [The secret word is RABBIT.]
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
  "content": "Yes, I understand. The secret word is RABBIT. If you ask me for it, I will respond with \"RABBIT\"."
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
