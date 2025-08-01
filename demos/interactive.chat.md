spawn ./interactive.chat.sh
# ollama_chat interactive
[6n
A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.18

```
ollama_chat with model: qwen2.5vl:7b

Press Control-C exit and view message history

>>> The secret word is RABBIT. Understand?

null

>>> 3 words describing Bash

null

>>> What is the secret word?

null

>>> 
```
Control-C shutdown

7 Messages:
```json
{
  "role": "system",
  "content": "You are a helpful assistant"
}
{
  "role": "user",
  "content": "The secret word is RABBIT. Understand?"
}
{
  "role": "assistant",
  "content": "null"
}
{
  "role": "user",
  "content": "3 words describing Bash"
}
{
  "role": "assistant",
  "content": "null"
}
{
  "role": "user",
  "content": "What is the secret word?"
}
{
  "role": "assistant",
  "content": "null"
}
```
