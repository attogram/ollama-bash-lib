# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# The user wants "list 10 things about bash, 1 per line". So just give 10 bullet points or just lines. No special constraints. Provide 10 distinct facts about Bash. Should be concise.1. Bash stands for “Bourne Again SHell” and is an enhanced version of the original Bourne shell.  2. It is the default command‑line interpreter on most Linux distributions and macOS.  3. Bash supports command history, tab completion, and line editing via the GNU Readline library.  4. It provides powerful scripting features such as loops, conditionals, functions, and arrays.  5. Bash can perform command substitution using backticks `` `cmd` `` or the modern `$(cmd)` syntax.  6. It includes built‑in arithmetic evaluation with `$(( expression ))`.  7. Bash uses environment variables (e.g., `PATH`, `HOME`) that can be exported to child processes.  8. It supports job control, allowing users to run processes in the background (`&`) and manage them with `fg`, `bg`, and `jobs`.  9. Bash scripts can be made executable with a shebang line (`#!/usr/bin/env bash`).  10. The shell offers extensive pattern matching and globbing capabilities, such as `*`, `?`, and `[a-z]`.
# </thinking>
