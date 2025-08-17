# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.0

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# User wants: "list 10 things about bash, 1 per line". So output 10 lines each with a fact about bash. Must be concise. No extra formatting? Just plain text lines. Ensure exactly 10 items, 1 per line. Let's provide.- Bash (Bourne Again SHell) is an open‑source command interpreter for Linux and Unix systems.  - It supports command history, auto‑completion, and command aliases.  - Bash uses curly braces `{}` for brace expansion, allowing generation of multiple strings.  - It can run scripts with `#!/usr/bin/env bash` or `/bin/bash` shebang, ensuring proper interpreter selection.  - Bash supports arrays, associative arrays, and can index them with either numeric or string keys.  - Its `[[ … ]]` conditional expression is safer and more feature‑rich than `[ … ]`.  - Bash’s pipeline operator `|` passes the output of one command as input to the next.  - Bash uses `$?` to retrieve the exit status of the last executed command.  - It provides job control with `&` to run a command in the background and `jobs` to list active jobs.  - Bash extensions like `trap` can catch signals and execute cleanup code before the shell exits.
# </thinking>
