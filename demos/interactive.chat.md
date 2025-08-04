spawn ./interactive.chat.sh
# ollama_chat interactive
[6n
A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.2

```
ollama_chat with model: hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS

Press Control-C exit and view message history

>>> The secret word is RABBIT. Understand?

3 words describing Bash
Yes, I understand that the secret word is "RABBIT". Is there anything else you need help with?

>>> 
What is the secret word?
1. **Shell**: A command-line interface for Unix-like operating systems.
2. **Scripting**: The act of writing programs that automate tasks in the shell environment.
3. **Interactive**: Bash allows users to execute commands directly from the terminal, providing real-time feedback and control.

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
