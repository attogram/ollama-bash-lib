# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

`model="gpt-oss:120b"`
## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```

```
Error: Missing required arguments

Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]
Error: Missing required arguments

Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
[ERROR] ollama_messages_last: error getting message content: 1
last message text: 
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
last message json: 
[]
```
```bash
ollama_chat "$model"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```

```
[ERROR] _ollama_chat_payload: Message history is empty
[ERROR] _call_curl: HTTP error 502: {"error": "upstream error"}
[ERROR] ollama_api_post: curl error: 1
[ERROR] _ollama_chat_stream_false: ollama_api_post failed
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
[ERROR] ollama_messages_last: error getting message content: 1
[ERROR] ollama_chat: ollama_chat_json response empty
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
[ERROR] ollama_messages_last: error getting message content: 1
last message text: 
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
last message json: 
[]
```
```bash
ollama_messages_add "user" "What is the secret word?"
ollama_chat "$model"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```

```
Error: Missing required arguments

Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]
[ERROR] _ollama_chat_payload: Message history is empty
[ERROR] _call_curl: HTTP error 502: {"error": "upstream error"}
[ERROR] ollama_api_post: curl error: 1
[ERROR] _ollama_chat_stream_false: ollama_api_post failed
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
[ERROR] ollama_messages_last: error getting message content: 1
[ERROR] ollama_chat: ollama_chat_json response empty
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
[ERROR] ollama_messages_last: error getting message content: 1
last message text: 
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
last message json: 
[]
```
