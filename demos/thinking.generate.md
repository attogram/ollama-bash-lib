# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

```
ollama_thinking on
ollama_thinking
ollama_generate $(ollama_model_random) "list 10 things about bash, 1 per line" 
```

thinking is on
# <thinking>
# The user wants a list of 10 things about bash, one per line. This is benign. Provide list.
# </thinking>

1. Bash stands for “Bourne Again SHell,” a modern replacement for the original Bourne shell.  
2. It supports command-line editing, history navigation, and tab completion.  
3. Bash scripts can use variables, functions, loops (for, while, until), and conditional statements (if, case).  
4. It provides built‑in arithmetic expansion, allowing integer calculations directly in the shell.  
5. Bash includes powerful redirection operators for input, output, and error streams (>, >>, <, <<, 2>, &> etc.).  
6. It supports job control, letting you pause, background, and resume processes with `Ctrl‑Z`, `bg`, `fg`, and `jobs`.  
7. Bash can source other files with the `source` or `.` command to import functions and variables.  
8. The shell’s prompt can be customized via the PS1 environment variable, using escape sequences for colors and information.  
9. Bash implements command substitution using backticks `` `cmd` `` or the modern `$(cmd)` syntax.  
10. It includes advanced pattern matching with globbing (e.g., `*`, `?`, `[a-z]`) and extended globbing features when enabled (shopt -s extglob).
