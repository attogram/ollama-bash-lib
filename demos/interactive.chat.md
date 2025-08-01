spawn ./interactive.chat.sh
# ollama_chat interactive
[6n
A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24

```
ollama_chat with model: qwen2.5vl:7b

Press Control-C exit and view message history

>>> The secret word is RABBIT. Understand?

Yes, I understand. The secret word is "RABBIT".

>>> 3 words describing Bash

Bash is a shell, a command-line interface, and a scripting language.

>>> What is the secret word?

The secret word is "RABBIT".

>>> 
```
Control-C shutdown

7 Messages:
```json
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. Understand?"}
{"role":"assistant","content":"Yes, I understand. The secret word is \"RABBIT\"."}
{"role":"user","content":"3 words describing Bash"}
{"role":"assistant","content":"Bash is a shell, a command-line interface, and a scripting language."}
{"role":"user","content":"What is the secret word?"}
{"role":"assistant","content":"The secret word is \"RABBIT\"."}
```
