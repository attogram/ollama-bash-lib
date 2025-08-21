# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

```
ollama_thinking on
ollama_thinking
ollama_generate_stream -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on

#### User wants list of 10 things about bash, one per line. Provide.

1. Bash stands for **Bourne‑Again SHell**, a successor to the original Unix Bourne shell.  
2. It is the default login shell on most Linux distributions and macOS (until macOS 12).  
3. Bash supports **command-line editing** with Emacs‑ and Vi‑style key bindings.  
4. It offers **programmable completion**, allowing custom tab‑completion for commands and arguments.  
5. Bash includes **arrays** (indexed and associative) for storing multiple values in a single variable.  
6. It provides **brace expansion** (e.g., `file{1..5}.txt`) for generating sequences of strings.  
7. Bash can execute **shell scripts** with shebang `#!/usr/bin/env bash` and supports functions and local variables.  
8. It features **command substitution** using backticks `` `cmd` `` or `$(cmd)` to capture command output.  
9. Bash has built‑in **job control**, enabling background (`&`), foreground (`fg`), and stopped (`Ctrl‑Z`) processes.  
10. It supports **process substitution** (`<(cmd)` and `>(cmd)`) to treat command output/input as files.
