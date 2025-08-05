# ollama_chat
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.9

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```


```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
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
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:27:14:163187900: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 23:27:14:187369900: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 23:27:14:216302000: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:27:14:231502200: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:27:14:257951800: ollama_chat_json: json_payload: {
  "model": "gpt-oss:20b",
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
[DEBUG] 23:27:14:274525500: ollama_api_post: [ollama.com/api/chat] [{
  "model": "gpt-oss:20b",
  "messages": ]
[DEBUG] 23:27:14:844718000: ollama_api_post: return 0
[DEBUG] 23:27:14:880315000: ollama_chat_json: content: []
[DEBUG] 23:27:14:891314600: ollama_chat_json: return 0
[DEBUG] 23:27:14:925745100: ollama_chat: return: 0

[DEBUG] 23:27:14:938730600: ollama_messages_add: [assistant] []
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 23:27:14:962312800: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 23:27:14:989986500: ollama_chat: [gpt-oss:20b]
[DEBUG] 23:27:15:006530100: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 23:27:15:032944700: ollama_chat_json: json_payload: {
  "model": "gpt-oss:20b",
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
[DEBUG] 23:27:15:049714100: ollama_api_post: [ollama.com/api/chat] [{
  "model": "gpt-oss:20b",
  "messages": ]
[DEBUG] 23:27:15:220693800: ollama_api_post: return 0
[DEBUG] 23:27:15:254268200: ollama_chat_json: content: []
[DEBUG] 23:27:15:267384900: ollama_chat_json: return 0
[DEBUG] 23:27:15:304860400: ollama_chat: return: 0

[DEBUG] 23:27:15:322679300: ollama_messages_add: [assistant] []
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 23:27:15:356036200: ollama_messages
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
