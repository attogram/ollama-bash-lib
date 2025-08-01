# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.13
./../ollama_bash_lib.sh: line 486: 019864500: value too great for base (error token is "019864500")

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "deepseek-r1:8b"
```
```
jq: error: $stream_bool is not defined at <top-level>, line 1, column 44:
    {role: $role, messages: $messages, stream: $stream_bool}
                                               ^^^^^^^^^^^^
jq: 1 compile error
null
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "deepseek-r1:8b"
```
```
jq: error: $stream_bool is not defined at <top-level>, line 1, column 44:
    {role: $role, messages: $messages, stream: $stream_bool}
                                               ^^^^^^^^^^^^
jq: 1 compile error
null
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
ollama_chat "deepseek-r1:8b"
```
```
[DEBUG] ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] ollama_chat: [deepseek-r1:8b]
[DEBUG] ollama_chat_json: [deepseek-r1:8b]
jq: error: $stream_bool is not defined at <top-level>, line 1, column 44:
    {role: $role, messages: $messages, stream: $stream_bool}
                                               ^^^^^^^^^^^^
jq: 1 compile error
[DEBUG] ollama_api_post: [/api/chat] []
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 33 bytes [{"error":"missing request body"}]
[DEBUG] json_sanitize: sanitized: 33 bytes [[{"error":"missing request body"}]]
[DEBUG] ollama_chat_json: content: [null]
[DEBUG] ollama_messages_add: [assistant] [null]
[DEBUG] ollama_chat_json: added response from assistant to messages
[DEBUG] json_sanitize: 33 bytes [{"error":"missing request body"}]
[DEBUG] json_sanitize: sanitized: 33 bytes [[{"error":"missing request body"}]]
[DEBUG] ollama_chat: content: null
null
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "deepseek-r1:8b"
```
```
[DEBUG] ollama_messages_add: [user] [What is the secret word??]
[DEBUG] ollama_chat: [deepseek-r1:8b]
[DEBUG] ollama_chat_json: [deepseek-r1:8b]
jq: error: $stream_bool is not defined at <top-level>, line 1, column 44:
    {role: $role, messages: $messages, stream: $stream_bool}
                                               ^^^^^^^^^^^^
jq: 1 compile error
[DEBUG] ollama_api_post: [/api/chat] []
[DEBUG] ollama_api_post: return 0
[DEBUG] json_sanitize: 33 bytes [{"error":"missing request body"}]
[DEBUG] json_sanitize: sanitized: 33 bytes [[{"error":"missing request body"}]]
[DEBUG] ollama_chat_json: content: [null]
[DEBUG] ollama_messages_add: [assistant] [null]
[DEBUG] ollama_chat_json: added response from assistant to messages
[DEBUG] json_sanitize: 33 bytes [{"error":"missing request body"}]
[DEBUG] json_sanitize: sanitized: 33 bytes [[{"error":"missing request body"}]]
[DEBUG] ollama_chat: content: null
null
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
