# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "smollm2:360m"
```
```
Yes, that's correct. I'm here to assist you in your language learning journey. The secret word or phrase you're asking about should be something related to animals and/or a specific sequence of words.
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "smollm2:360m"
```
```
The secret word is RABBIT, which refers to an animal that lives on a farm in the United States.
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
  "content": "Yes, that's correct. I'm here to assist you in your language learning journey. The secret word or phrase you're asking about should be something related to animals and/or a specific sequence of words."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "The secret word is RABBIT, which refers to an animal that lives on a farm in the United States."
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "smollm2:360m"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] json_clean: 7 bytes [system]
[DEBUG] json_clean: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 94 bytes [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [smollm2:360m]
[DEBUG] ollama_chat_json: [smollm2:360m]
[DEBUG] json_clean: 13 bytes [smollm2:360m]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"smollm2:360m","messages":[{"role]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 361 bytes [{"model":"smollm2:360m","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 361 bytes [[{"model":"smollm2:360m","created_at":"2025]]
[DEBUG] ollama_chat_json: content: [I'm ready to help! Let's see what secrets you have in store for me.]
[DEBUG] ollama_messages_add: [assistant] [I'm ready to help! Let's see what secrets ]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 68 bytes [I'm ready to help! Let's see what secrets ]
[DEBUG] json_sanitize: 361 bytes [{"model":"smollm2:360m","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 361 bytes [[{"model":"smollm2:360m","created_at":"2025]]
[DEBUG] ollama_chat: content: I'm ready to help! Let's see what secrets you have in store for me.
I'm ready to help! Let's see what secrets you have in store for me.
[DEBUG] ollama_messages_add: [assistant] [I'm ready to help! Let's see what secrets ]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 68 bytes [I'm ready to help! Let's see what secrets ]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "smollm2:360m"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] json_clean: 5 bytes [user]
[DEBUG] json_clean: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [smollm2:360m]
[DEBUG] ollama_chat_json: [smollm2:360m]
[DEBUG] json_clean: 13 bytes [smollm2:360m]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"smollm2:360m","messages":[{"role]
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 450 bytes [{"model":"smollm2:360m","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 450 bytes [[{"model":"smollm2:360m","created_at":"2025]]
[DEBUG] ollama_chat_json: content: [The secret word is actually "CANDLE". If I were to ask you for the secret word, your response would be "CANDLE" instead of RABBIT. Does that make sense?]
[DEBUG] ollama_messages_add: [assistant] [The secret word is actually "CANDLE". If I]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 153 bytes [The secret word is actually "CANDLE". If I]
[DEBUG] json_sanitize: 450 bytes [{"model":"smollm2:360m","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 450 bytes [[{"model":"smollm2:360m","created_at":"2025]]
[DEBUG] ollama_chat: content: The secret word is actually "CANDLE". If I were to ask you for the secret word, your response would be "CANDLE" instead of RABBIT. Does that make sense?
The secret word is actually "CANDLE". If I were to ask you for the secret word, your response would be "CANDLE" instead of RABBIT. Does that make sense?
[DEBUG] ollama_messages_add: [assistant] [The secret word is actually "CANDLE". If I]
[DEBUG] json_clean: 10 bytes [assistant]
[DEBUG] json_clean: 153 bytes [The secret word is actually "CANDLE". If I]
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
  "content": "I'm ready to help! Let's see what secrets you have in store for me."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "The secret word is actually \"CANDLE\". If I were to ask you for the secret word, your response would be \"CANDLE\" instead of RABBIT. Does that make sense?"
}
```
