# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.7

```
ollama_thinking on
ollama_thinking
ollama_generate $(ollama_model_random) "list 10 things about bash, 1 per line" 
```

thinking is on
# <thinking>
# User asks: "list 10 things about bash, 1 per line" They want a list of 10 things about bash. That's allowed. We comply. We need 10 items, each one per line. Provide plain text.

We must not mention policy. Just list.
# </thinking>

1. Bash stands for "Bourne Again SHell" and is a command processor that typically runs in a text terminal.  
2. It interprets commands entered by the user or read from a script file, providing a powerful shell scripting language.  
3. Bash supports variable assignment, arithmetic operations, and string manipulation directly in the shell.  
4. It offers command substitution (`$(command)` or backticks `` `command` ``) to capture the output of a command into a variable or command argument.  
5. Bash includes pattern matching with globbing (`*`, `?`, `[]`) and extended globbing (enabled via `shopt -s extglob`).  
6. It has built‑in control structures such as `if`, `case`, `for`, `while`, and `until`, allowing complex conditional logic and loops.  
7. Bash supports functions, which can be defined and called within scripts or interactively.  
8. The `read` builtin lets Bash pause and wait for user input, optionally with a prompt or silent password entry.  
9. Bash can perform job control; it can run processes in the background (`&`) and bring them to the foreground with `fg`.  
10. The `trap` builtin can catch signals (e.g., `SIGINT`, `SIGTERM`) to execute cleanup code when a script or shell session exits or is interrupted.
