# ollama_messages, ollama_messages_add, ollama_messages_count

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.5
```

ollama_messages_count: 0
ollama_messages:

ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_count: 1
ollama_messages:
{
  "role": "system",
  "content": "You are a helpful assistant"
}

ollama_messages_add "user" "Hi"
ollama_messages_count: 2
ollama_messages:
{
  "role": "system",
  "content": "You are a helpful assistant"
}
{
  "role": "user",
  "content": "Hi"
}

ollama_messages_add "assistant" "Hello!"
ollama_messages_count: 3
ollama_messages:
{
  "role": "system",
  "content": "You are a helpful assistant"
}
{
  "role": "user",
  "content": "Hi"
}
{
  "role": "assistant",
  "content": "Hello!"
}

ollama_messages_clear
ollama_messages_count: 0
ollama_messages:
```
