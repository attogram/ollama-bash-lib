# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "cogito:3b"
```
```
Understood! If you ask me for the secret word "RABBIT," I'll simply respond with:

RABBIT
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "cogito:3b"
```
```
I'm not supposed to reveal the secret word. But if you guess it correctly, I might tell you. Otherwise, I just say RABBIT! 😊
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
  "content": "Understood! If you ask me for the secret word \"RABBIT,\" I'll simply respond with:\n\nRABBIT"
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "I'm not supposed to reveal the secret word. But if you guess it correctly, I might tell you. Otherwise, I just say RABBIT! 😊"
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
[DEBUG] json_sanitize: 430 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 430 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
[DEBUG] ollama_chat_json: content: [Yes, I understand. If someone asks me what the secret word is, I should just reply "RABBIT" without any further explanation or context.]
[DEBUG] ollama_messages_add: [assistant] [Yes, I understand. If someone asks me what]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 136 bytes [Yes, I understand. If someone asks me what]
[DEBUG] json_sanitize: 430 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 430 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
[DEBUG] ollama_chat: content: Yes, I understand. If someone asks me what the secret word is, I should just reply "RABBIT" without any further explanation or context.
Yes, I understand. If someone asks me what the secret word is, I should just reply "RABBIT" without any further explanation or context.
[DEBUG] ollama_messages_add: [assistant] [Yes, I understand. If someone asks me what]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 136 bytes [Yes, I understand. If someone asks me what]
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
[DEBUG] json_sanitize: 297 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 297 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
[DEBUG] ollama_chat_json: content: [RABBIT.]
[DEBUG] ollama_messages_add: [assistant] [RABBIT.]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 8 bytes [RABBIT.]
[DEBUG] json_sanitize: 297 bytes [{"model":"cogito:3b","created_at":"2025-07]
[DEBUG] json_sanitize: sanitized: 297 bytes [[{"model":"cogito:3b","created_at":"2025-07]]
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
  "content": "Yes, I understand. If someone asks me what the secret word is, I should just reply \"RABBIT\" without any further explanation or context."
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
