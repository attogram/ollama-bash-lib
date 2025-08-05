# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "smollm2:1.7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Yes, I understand. Please proceed by asking your question or giving command related to the secret word RABBIT.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "smollm2:1.7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
The secret word is RABBIT. If you ask me for the secret word again, I will respond with "RABBIT".

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
  "content": "Yes, I understand. Please proceed by asking your question or giving command related to the secret word RABBIT."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "The secret word is RABBIT. If you ask me for the secret word again, I will respond with \"RABBIT\"."
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "smollm2:1.7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 21:02:09:458695100: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 21:02:09:482415300: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 21:02:09:511540300: ollama_chat: [smollm2:1.7b]
[DEBUG] 21:02:09:528492000: ollama_chat_json: [smollm2:1.7b]
[DEBUG] 21:02:09:556198300: ollama_chat_json: json_payload: {
  "model": "smollm2:1.7b",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful assistant"
    },
    {
      "role": "user",
      "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
    }
  ],
  "stream": false
}
[DEBUG] 21:02:09:573254800: ollama_api_post: [/api/chat] [{
  "model": "smollm2:1.7b",
  "messages":]
[DEBUG] 21:02:10:264153600: ollama_api_post: return 0
[DEBUG] 21:02:21:991555300: ollama_chat_json: content: [Yes, understand. The secret word is indeed]
[DEBUG] 21:02:22:002945000: ollama_chat_json: return 0
[DEBUG] 21:02:33:686030700: ollama_chat: return: 0
Yes, understand. The secret word is indeed RABBIT.
[DEBUG] 21:02:33:699179800: ollama_messages_add: [assistant] [Yes, understand. The secret word is indeed]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "smollm2:1.7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 21:02:33:727203500: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 21:02:33:758210600: ollama_chat: [smollm2:1.7b]
[DEBUG] 21:02:33:776462400: ollama_chat_json: [smollm2:1.7b]
[DEBUG] 21:02:33:807880400: ollama_chat_json: json_payload: {
  "model": "smollm2:1.7b",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful assistant"
    },
    {
      "role": "user",
      "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
    },
    {
      "role": "assistant",
      "content": "Yes, understand. The secret word is indeed RABBIT."
    },
    {
      "role": "user",
      "content": "What is the secret word??"
    }
  ],
  "stream": false
}
[DEBUG] 21:02:33:830218400: ollama_api_post: [/api/chat] [{
  "model": "smollm2:1.7b",
  "messages":]
[DEBUG] 21:02:34:761590200: ollama_api_post: return 0
[DEBUG] 21:02:50:231165500: ollama_chat_json: content: [I'm sorry, but as an AI, I don't have a "s]
[DEBUG] 21:02:50:243921600: ollama_chat_json: return 0
[DEBUG] 21:03:06:819742900: ollama_chat: return: 0
I'm sorry, but as an AI, I don't have a "secret" word to tell you. I can only respond based on information I've been programmed with. Can we focus on that now?
[DEBUG] 21:03:06:832068200: ollama_messages_add: [assistant] [I'm sorry, but as an AI, I don't have a "s]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 21:03:06:863671500: ollama_messages
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
  "content": "Yes, understand. The secret word is indeed RABBIT."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "I'm sorry, but as an AI, I don't have a \"secret\" word to tell you. I can only respond based on information I've been programmed with. Can we focus on that now?"
}
```
