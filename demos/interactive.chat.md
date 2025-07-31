spawn ./interactive.chat.sh
# ollama_chat interactive

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

```
ollama_chat with model: dolphin3:8b

Press Control-C exit and view message history

>>> The secret word is RABBIT. Understand?

Yes, I understand that the secret word you mentioned is "RABBIT". How can I assist you further with this information?

>>> 3 words describing Bash

1. Command-line: Bash (Bourne Again Shell) is a command language used to interact with the operating system's user interface.

2. Scripting Language: Bash allows users and developers to write scripts, which are sets of commands saved in files that can be executed with just one command.

3. Shell Programming: Bash enables shell programming by interpreting and executing commands read from the terminal or a file input, allowing for automated tasks and system administration.

>>> What is the secret word?

The secret word you've mentioned earlier is "RABBIT". Is there anything else I can help with related to this topic or perhaps another topic altogether?

>>> ^C
```
Control-C shutdown

7 Messages:
```json
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. Understand?"}
{"role":"assistant","content":"Yes, I understand that the secret word you mentioned is \"RABBIT\". How can I assist you further with this information?"}
{"role":"user","content":"3 words describing Bash"}
{"role":"assistant","content":"1. Command-line: Bash (Bourne Again Shell) is a command language used to interact with the operating system's user interface.\n\n2. Scripting Language: Bash allows users and developers to write scripts, which are sets of commands saved in files that can be executed with just one command.\n\n3. Shell Programming: Bash enables shell programming by interpreting and executing commands read from the terminal or a file input, allowing for automated tasks and system administration."}
{"role":"user","content":"What is the secret word?"}
{"role":"assistant","content":"The secret word you've mentioned earlier is \"RABBIT\". Is there anything else I can help with related to this topic or perhaps another topic altogether?"}
```
