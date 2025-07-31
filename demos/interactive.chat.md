spawn ./interactive.chat.sh
# ollama_chat interactive

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

```
ollama_chat with model: smollm2:1.7b

Press Control-C to view message history and exit

>>> The secret word is RABBIT. Understand?

Yes, I understand. The secret word is indeed "RABBIT". If you need any other information or have different requests in the future, feel free to ask.

>>> 3 words describing Bash

1. Shell scripting language - Bash is a Unix shell and command-line interpreter that provides a simple and flexible way to write scripts for automation of tasks on Linux systems.

2. Text processing language - Bash is capable of performing text processing, including reading input from the user, processing it with commands or functions, and writing output back onto an output stream like the console.

3. Interactive command-line interface - As a command-line interpreter, Bash allows users to interactively execute shell scripts, run programs, and perform various other tasks by typing commands into its prompt.

>>> What is the secret word?

The secret word is "QUICK".

>>> ^C
```
Control-C shutdown

7 Messages:
```json
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"system"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"You are a helpful assistant"[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"user"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"The secret word is RABBIT. Understand?"[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"assistant"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"Yes, I understand. The secret word is indeed \"RABBIT\". If you need any other information or have different requests in the future, feel free to ask."[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"user"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"3 words describing Bash"[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"assistant"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"1. Shell scripting language - Bash is a Unix shell and command-line interpreter that provides a simple and flexible way to write scripts for automation of tasks on Linux systems.\n\n2. Text processing language - Bash is capable of performing text processing, including reading input from the user, processing it with commands or functions, and writing output back onto an output stream like the console.\n\n3. Interactive command-line interface - As a command-line interpreter, Bash allows users to interactively execute shell scripts, run programs, and perform various other tasks by typing commands into its prompt."[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"user"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"What is the secret word?"[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"assistant"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"The secret word is \"QUICK\"."[0m[1;39m[1;39m}[0m
```
