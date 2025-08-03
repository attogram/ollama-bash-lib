# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS"
```
```
Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS"
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
  "role": "user",
  "content": "What is the secret word??"
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS]
[DEBUG] ollama_chat_json: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS]
[DEBUG] ollama_api_post: [/api/chat] [{
  "model": "hf.co/bartowski/Ministral-8B]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_chat_json: content: [Yes, I understand.]
[DEBUG] ollama_messages_add: [assistant] [Yes, I understand.]
[DEBUG] ollama_chat_json: added response from assistant to messages
[DEBUG] ollama_chat: content: Yes, I understand.
Yes, I understand.
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] ollama_chat: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS]
[DEBUG] ollama_chat_json: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS]
[DEBUG] ollama_api_post: [/api/chat] [{
  "model": "hf.co/bartowski/Ministral-8B]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_chat_json: content: [RABBIT]
[DEBUG] ollama_messages_add: [assistant] [RABBIT]
[DEBUG] ollama_chat_json: added response from assistant to messages
[DEBUG] ollama_chat: content: RABBIT
RABBIT
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
  "role": "user",
  "content": "What is the secret word??"
}
```
