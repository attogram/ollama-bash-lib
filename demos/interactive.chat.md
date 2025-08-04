spawn ./interactive.chat.sh
# ollama_chat interactive
[6n
A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

```
ollama_chat with model: hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M

Press Control-C exit and view message history

>>> The secret word is RABBIT. Understand?

Yes, I understand. The secret word you mentioned is "RABBIT".

>>> 3 words describing Bash

What is the secret word?
1. **Command-line shell**: Bash (Bourne Again SHell) is a command-line interpreter that runs in Unix-like operating systems.
2. **Scripting**: It supports scripting, allowing users to automate tasks and workflows.
3. **Interactive**: Provides an interactive interface for users to execute commands and scripts.

Is there anything else I can help with?

>>> 

```
Control-C shutdown

4 Messages:
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
  "role": "user",
  "content": "3 words describing Bash"
}
{
  "role": "user",
  "content": "What is the secret word?"
}
```
