# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "smollm2:1.7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Yes, I understand. If you want me to use the secret word "RABBIT," please let me know by saying so.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "smollm2:1.7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
The secret word is "RABBIT". Please remember to say it if you need assistance.

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
  "content": "Yes, I understand. If you want me to use the secret word \"RABBIT,\" please let me know by saying so."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "The secret word is \"RABBIT\". Please remember to say it if you need assistance."
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
[DEBUG] 00:53:47:587309200: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:53:47:610501700: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:53:47:640423900: ollama_chat: [smollm2:1.7b]
[DEBUG] 00:53:47:658060500: ollama_chat_json: [smollm2:1.7b]
[DEBUG] 00:53:47:685420100: ollama_chat_json: json_payload: {
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
[DEBUG] 00:53:47:701060000: ollama_api_post: [/api/chat] [{
  "model": "smollm2:1.7b",
  "messages":]
[DEBUG] 00:53:48:427821800: ollama_api_post: return 0
[DEBUG] 00:54:01:387890400: ollama_chat_json: content: [Yes, I understand that if asked about the ]
[DEBUG] 00:54:01:399046800: ollama_chat_json: return 0
[DEBUG] 00:54:14:286665500: ollama_chat: return: 0
Yes, I understand that if asked about the secret word, I should respond with RABBIT.
[DEBUG] 00:54:14:299626700: ollama_messages_add: [assistant] [Yes, I understand that if asked about the ]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "smollm2:1.7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:54:14:322544700: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:54:14:351537500: ollama_chat: [smollm2:1.7b]
[DEBUG] 00:54:14:368210200: ollama_chat_json: [smollm2:1.7b]
[DEBUG] 00:54:14:395652300: ollama_chat_json: json_payload: {
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
      "content": "Yes, I understand that if asked about the secret word, I should respond with RABBIT."
    },
    {
      "role": "user",
      "content": "What is the secret word??"
    }
  ],
  "stream": false
}
[DEBUG] 00:54:14:411556400: ollama_api_post: [/api/chat] [{
  "model": "smollm2:1.7b",
  "messages":]
[DEBUG] 00:54:15:109751700: ollama_api_post: return 0
[DEBUG] 00:54:25:679896100: ollama_chat_json: content: [The secret word is RABBIT.]
[DEBUG] 00:54:25:692629100: ollama_chat_json: return 0
[DEBUG] 00:54:36:488675500: ollama_chat: return: 0
The secret word is RABBIT.
[DEBUG] 00:54:36:501988200: ollama_messages_add: [assistant] [The secret word is RABBIT.]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:54:36:530770200: ollama_messages
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
  "content": "Yes, I understand that if asked about the secret word, I should respond with RABBIT."
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
