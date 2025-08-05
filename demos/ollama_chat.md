# ollama_chat
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```


```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
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
  "content": ""
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": ""
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:18:41:504923300: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:18:41:527438500: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:18:41:556585400: ollama_chat: [gpt-oss:120b]
[DEBUG] 23:18:41:571732600: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 23:18:41:600078700: ollama_chat_json: json_payload: {
  "model": "gpt-oss:120b",
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
[DEBUG] 23:18:41:616498400: ollama_api_post: [/api/chat] [{
  "model": "gpt-oss:120b",
  "messages":]
[DEBUG] 23:18:42:029695100: ollama_api_post: return 0
[DEBUG] 23:18:42:073533800: ollama_chat_json: content: []
[DEBUG] 23:18:42:086802200: ollama_chat_json: return 0
[DEBUG] 23:18:42:134450500: ollama_chat: return: 0

[DEBUG] 23:18:42:146996700: ollama_messages_add: [assistant] []
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:120b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:18:42:169480000: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:18:42:200227800: ollama_chat: [gpt-oss:120b]
[DEBUG] 23:18:42:217717300: ollama_chat_json: [gpt-oss:120b]
[DEBUG] 23:18:42:247425100: ollama_chat_json: json_payload: {
  "model": "gpt-oss:120b",
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
      "content": ""
    },
    {
      "role": "user",
      "content": "What is the secret word??"
    }
  ],
  "stream": false
}
[DEBUG] 23:18:42:265031200: ollama_api_post: [/api/chat] [{
  "model": "gpt-oss:120b",
  "messages":]
[DEBUG] 23:18:42:369485600: ollama_api_post: return 0
[DEBUG] 23:18:42:416272900: ollama_chat_json: content: []
[DEBUG] 23:18:42:426940200: ollama_chat_json: return 0
[DEBUG] 23:18:42:463693700: ollama_chat: return: 0

[DEBUG] 23:18:42:475914600: ollama_messages_add: [assistant] []
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:18:42:504375700: ollama_messages
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
  "content": ""
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": ""
}
```
