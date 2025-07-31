spawn ./interactive.chat.sh
# ollama_chat interactive

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.12

```
ollama_chat with model: qwen2.5-coder:7b

Press Control-C to view message history and exit

>>> The secret word is RABBIT. Understand?

Yes, I understand. The secret word is "RABBIT."

>>> 3 words describing Bash

1. Scripting language
2. Automation tool
3. Unix-based shell.

>>> What is the secret word?

The secret word is "Bash."

>>> ^C
```
Control-C shutdown

7 Messages:
```json
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"system"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"You are a helpful assistant"[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"user"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"The secret word is RABBIT. Understand?"[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"assistant"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"Yes, I understand. The secret word is \"RABBIT.\""[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"user"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"3 words describing Bash"[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"assistant"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"1. Scripting language\n2. Automation tool\n3. Unix-based shell."[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"user"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"What is the secret word?"[0m[1;39m[1;39m}[0m
[1;39m{[0m[1;34m"role"[0m[1;39m:[0m[0;32m"assistant"[0m[1;39m,[0m[1;34m"content"[0m[1;39m:[0m[0;32m"The secret word is \"Bash.\""[0m[1;39m[1;39m}[0m
```
