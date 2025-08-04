# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "qwen2.5vl:7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Understood. The secret word is RABBIT.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "qwen2.5vl:7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
The secret word is RABBIT.

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
  "content": "Understood. The secret word is RABBIT."
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
response="$(ollama_chat "qwen2.5vl:7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[DEBUG] 00:49:41:095931100: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:49:41:118763000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:49:41:149131000: ollama_chat: [qwen2.5vl:7b]
[DEBUG] 00:49:41:167881600: ollama_chat_json: [qwen2.5vl:7b]
[DEBUG] 00:49:41:210582800: ollama_chat_json: json_payload: {
  "model": "qwen2.5vl:7b",
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
[DEBUG] 00:49:41:227989600: ollama_api_post: [/api/chat] [{
  "model": "qwen2.5vl:7b",
  "messages":]
[DEBUG] 00:49:42:334487500: ollama_api_post: return 0
[DEBUG] 00:49:54:865666700: ollama_chat_json: content: [Understood. The secret word is RABBIT.]
[DEBUG] 00:49:54:879006500: ollama_chat_json: return 0
[DEBUG] 00:50:06:403160700: ollama_chat: return: 0
Understood. The secret word is RABBIT.
[DEBUG] 00:50:06:415043200: ollama_messages_add: [assistant] [Understood. The secret word is RABBIT.]

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "qwen2.5vl:7b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[DEBUG] 00:50:06:440362700: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:50:06:470868000: ollama_chat: [qwen2.5vl:7b]
[DEBUG] 00:50:06:487612800: ollama_chat_json: [qwen2.5vl:7b]
[DEBUG] 00:50:06:516352900: ollama_chat_json: json_payload: {
  "model": "qwen2.5vl:7b",
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
      "content": "Understood. The secret word is RABBIT."
    },
    {
      "role": "user",
      "content": "What is the secret word??"
    }
  ],
  "stream": false
}
[DEBUG] 00:50:06:535183100: ollama_api_post: [/api/chat] [{
  "model": "qwen2.5vl:7b",
  "messages":]
[DEBUG] 00:50:07:357366800: ollama_api_post: return 0
[DEBUG] 00:50:18:538296600: ollama_chat_json: content: [The secret word is RABBIT.]
[DEBUG] 00:50:18:551841300: ollama_chat_json: return 0
[DEBUG] 00:50:29:480747900: ollama_chat: return: 0
The secret word is RABBIT.
[DEBUG] 00:50:29:493790400: ollama_messages_add: [assistant] [The secret word is RABBIT.]

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:50:29:523477000: ollama_messages
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
  "content": "Understood. The secret word is RABBIT."
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
