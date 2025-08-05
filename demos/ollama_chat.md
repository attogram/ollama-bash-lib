# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "minicpm-v:8b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Yes, understand! The secret word is "RABBIT." Just let me know if you need any more help or information on this topic.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "minicpm-v:8b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
The secret word is "RABBIT". Let me know if there's anything else I can assist you with regarding this concept!

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
  "content": "Yes, understand! The secret word is \"RABBIT.\" Just let me know if you need any more help or information on this topic."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "The secret word is \"RABBIT\". Let me know if there's anything else I can assist you with regarding this concept!"
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "minicpm-v:8b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 13:21:56:028102000: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 13:21:56:037544000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 13:21:56:047430000: ollama_chat: [minicpm-v:8b]
[DEBUG] 13:21:56:051721000: ollama_chat_json: [minicpm-v:8b]
[DEBUG] 13:21:56:063056000: ollama_chat_json: json_payload: {
  "model": "minicpm-v:8b",
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
[DEBUG] 13:21:56:068168000: ollama_api_post: [/api/chat] [{
  "model": "minicpm-v:8b",
  "messages":]
[DEBUG] 13:22:00:367498000: ollama_api_post: return 0
[DEBUG] 13:22:04:910274000: ollama_chat_json: content: [Yes, understood! Please feel free to ask m]
[DEBUG] 13:22:04:914001000: ollama_chat_json: return 0
[DEBUG] 13:22:08:950786000: ollama_chat: return: 0
Yes, understood! Please feel free to ask me any questions or provide instructions related to finding or revealing the hidden message within this context.

If my response has been helpful and meets your expectations, please let me know by using a "thumbs up" emoji 🤝 or another form of positive feedback. If not, simply reply with information on what you would like changed or added for better assistance!
[DEBUG] 13:22:08:955006000: ollama_messages_add: [assistant] [Yes, understood! Please feel free to ask m]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "minicpm-v:8b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 13:22:08:963521000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 13:22:08:971994000: ollama_chat: [minicpm-v:8b]
[DEBUG] 13:22:08:976153000: ollama_chat_json: [minicpm-v:8b]
[DEBUG] 13:22:08:985607000: ollama_chat_json: json_payload: {
  "model": "minicpm-v:8b",
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
      "content": "Yes, understood! Please feel free to ask me any questions or provide instructions related to finding or revealing the hidden message within this context.\n\nIf my response has been helpful and meets your expectations, please let me know by using a \"thumbs up\" emoji 🤝 or another form of positive feedback. If not, simply reply with information on what you would like changed or added for better assistance!"
    },
    {
      "role": "user",
      "content": "What is the secret word??"
    }
  ],
  "stream": false
}
[DEBUG] 13:22:08:989644000: ollama_api_post: [/api/chat] [{
  "model": "minicpm-v:8b",
  "messages":]
[DEBUG] 13:22:12:686039000: ollama_api_post: return 0
[DEBUG] 13:22:17:082030000: ollama_chat_json: content: [The hidden message within this context rev]
[DEBUG] 13:22:17:089094000: ollama_chat_json: return 0
[DEBUG] 13:22:21:538418000: ollama_chat: return: 0
The hidden message within this context reveals that the secret word is RABBIT.

If my response has been helpful and meets your expectations, please let me know by using a "thumbs up" emoji 🤝 or another form of positive feedback. If not, simply reply with information on what you would like changed or added for better assistance!
[DEBUG] 13:22:21:543638000: ollama_messages_add: [assistant] [The hidden message within this context rev]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 13:22:21:554512000: ollama_messages
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
  "content": "Yes, understood! Please feel free to ask me any questions or provide instructions related to finding or revealing the hidden message within this context.\n\nIf my response has been helpful and meets your expectations, please let me know by using a \"thumbs up\" emoji 🤝 or another form of positive feedback. If not, simply reply with information on what you would like changed or added for better assistance!"
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "The hidden message within this context reveals that the secret word is RABBIT.\n\nIf my response has been helpful and meets your expectations, please let me know by using a \"thumbs up\" emoji 🤝 or another form of positive feedback. If not, simply reply with information on what you would like changed or added for better assistance!"
}
```
