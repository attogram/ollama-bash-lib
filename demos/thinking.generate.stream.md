# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11

```
ollama_thinking on
ollama_thinking
ollama_generate_stream -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on

#### We need to comply with request. It's a simple list, no disallowed content. Provide 10 things about bash, one per line. Ensure each line is a separate bullet maybe. That's fine.

1. Bash stands for “Bourne‑Again SHell,” a successor to the original Bourne shell (sh).  
2. It is the default login shell on most Linux distributions and macOS.  
3. Bash supports command‑line editing via GNU Readline, enabling Emacs‑ and Vi‑style shortcuts.  
4. It offers powerful scripting capabilities with loops, conditionals, functions, and arrays.  
5. Bash can perform job control, allowing you to start, stop, background, and foreground processes.  
6. It includes built‑in arithmetic evaluation and supports integer math with $((…)).  
7. Bash provides brace expansion for generating multiple strings (e.g., `echo file{1..5}.txt`).  
8. It features filename globbing (wildcards) like `*`, `?`, and `[…]` for pattern matching.  
9. Bash can source other scripts with the `source` (or `.`) command to import variables and functions.  
10. It supports command substitution using backticks `` `cmd` `` or `$(cmd)` to embed command output.
