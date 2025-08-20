# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

`model="gpt-oss:20b"`
## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```

```
last message text: Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?
last message json: {"role":"user","content":"Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"}
[
  {
    "role": "system",
    "content": "You are a helpful assistant"
  },
  {
    "role": "user",
    "content": "Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"
  }
]
```
```bash
ollama_chat "$model"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```

```
last message text: Understood. The secret word is RABBIT.
last message json: {"role":"assistant","content":"Understood. The secret word is RABBIT."}
[
  {
    "role": "system",
    "content": "You are a helpful assistant"
  },
  {
    "role": "user",
    "content": "Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"
  },
  {
    "role": "assistant",
    "content": "Understood. The secret word is RABBIT."
  }
]
```
```bash
ollama_messages_add "user" "What is the secret word?"
ollama_chat "$model"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```

```
last message text: RABBIT
last message json: {"role":"assistant","content":"RABBIT"}
[
  {
    "role": "system",
    "content": "You are a helpful assistant"
  },
  {
    "role": "user",
    "content": "Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"
  },
  {
    "role": "assistant",
    "content": "Understood. The secret word is RABBIT."
  },
  {
    "role": "user",
    "content": "What is the secret word?"
  },
  {
    "role": "assistant",
    "content": "RABBIT"
  }
]
```
