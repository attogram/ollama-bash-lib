# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

`model="mistral:7b"`
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
 Understood! I will remember that the secret word is "RABBIT". If you ask me for the secret word in the future, I will respond with "RABBIT".
last message text:  Understood! I will remember that the secret word is "RABBIT". If you ask me for the secret word in the future, I will respond with "RABBIT".
last message json: {"role":"assistant","content":" Understood! I will remember that the secret word is \"RABBIT\". If you ask me for the secret word in the future, I will respond with \"RABBIT\"."}
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
    "content": " Understood! I will remember that the secret word is \"RABBIT\". If you ask me for the secret word in the future, I will respond with \"RABBIT\"."
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
The secret word is RABBIT.
last message text: The secret word is RABBIT.
last message json: {"role":"assistant","content":"The secret word is RABBIT."}
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
    "content": " Understood! I will remember that the secret word is \"RABBIT\". If you ask me for the secret word in the future, I will respond with \"RABBIT\"."
  },
  {
    "role": "user",
    "content": "What is the secret word?"
  },
  {
    "role": "assistant",
    "content": "The secret word is RABBIT."
  }
]
```
