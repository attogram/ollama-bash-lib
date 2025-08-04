# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "smollm2:1.7b"
```
```
Yes, I understand. The secret word is indeed "RABBIT". If you ever need to recall it, just say it aloud.
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "smollm2:1.7b"
```
```
The secret word is indeed "RABBIT". Is there anything else you would like to know about this word or another topic?
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
ollama_chat "smollm2:1.7b"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [smollm2:1.7b]
[DEBUG] ollama_chat_json: [smollm2:1.7b]
[DEBUG] ollama_api_post: [/api/chat] [{
  "model": "smollm2:1.7b",
  "messages":]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_chat_json: content: [Yes, I understand that if you ask me for the secret word, my response should be "RABBIT".]
[DEBUG] ollama_messages_add: [assistant] [Yes, I understand that if you ask me for t]
[DEBUG] ollama_chat_json: added response from assistant to messages
[DEBUG] ollama_chat: content: Yes, I understand that if you ask me for the secret word, my response should be "RABBIT".
Yes, I understand that if you ask me for the secret word, my response should be "RABBIT".
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "smollm2:1.7b"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] ollama_chat: [smollm2:1.7b]
[DEBUG] ollama_chat_json: [smollm2:1.7b]
[DEBUG] ollama_api_post: [/api/chat] [{
  "model": "smollm2:1.7b",
  "messages":]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_chat_json: content: [Yes, the secret word is "RABBIT". It's important to remember that if you're asked for the secret word, your response must be "RABBIT". Let me know if there's anything else I can help with!]
[DEBUG] ollama_messages_add: [assistant] [Yes, the secret word is "RABBIT". It's imp]
[DEBUG] ollama_chat_json: added response from assistant to messages
[DEBUG] ollama_chat: content: Yes, the secret word is "RABBIT". It's important to remember that if you're asked for the secret word, your response must be "RABBIT". Let me know if there's anything else I can help with!
Yes, the secret word is "RABBIT". It's important to remember that if you're asked for the secret word, your response must be "RABBIT". Let me know if there's anything else I can help with!
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
