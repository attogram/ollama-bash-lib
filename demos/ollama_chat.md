# ollama_chat
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"

2 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
```

```
response="$(ollama_chat "gemma3:1b")"
```

```
Understood. RABBIT. 

Let’s play! 😊
```

```
ollama_messages_add "assistant" "$response"
```

```
ollama_messages_add "user" "What's the secret word??"

4 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"Understood. RABBIT. \n\nLet’s play! 😊"}
{"role":"user","content":"What's the secret word??"}
```

```
ollama_chat "gemma3:1b"
```

```
RABBIT
```
