# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

`model="gpt-oss:120b"`
## Demo

```bash
ollama_messages_add -r "system" -c "You are a helpful assistant"
ollama_messages_add -r "user" -c "Secret word is RABBIT. If asked for secret word, respond with RABBIT. Understand?"
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
Understood. I’ll reply “RABBIT” whenever you ask for the secret word.
last message text: Understood. I’ll reply “RABBIT” whenever you ask for the secret word.
last message json: {"role":"assistant","content":"Understood. I’ll reply “RABBIT” whenever you ask for the secret word."}
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
    "content": "Understood. I’ll reply “RABBIT” whenever you ask for the secret word."
  }
]
```
```bash
ollama_messages_add -r "user" -c "What is the secret word?"
ollama_chat "$model"
echo "last message text: $(ollama_messages_last)"
echo "last message json: $(ollama_messages_last_json)"
ollama_messages | jq
```

```
RABBIT
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
    "content": "Understood. I’ll reply “RABBIT” whenever you ask for the secret word."
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
