# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11

```
ollama_thinking on
ollama_thinking
ollama_generate -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on
#### <thinking>
#### User: "list 10 things about bash, 1 per line". Just list 10 facts/ tips or features. Probably short lines. Ensure 10 lines.
#### </thinking>

1. Bash is the default shell on most Linux distributions, providing command-line execution and scripting.  
2. It supports built-in globbing (`*`, `?`, `**`) for pattern matching file paths.  
3. Bash can expand variables with `${VAR:-default}` syntax, supplying defaults if unset.  
4. It includes an associative array feature (hash tables) available from Bash 4.x onward.  
5. Bash’s job control (`jobs`, `bg`, `fg`, `Ctrl‑Z`) lets you pause, background, or bring jobs to the foreground.  
6. The `read` built‑in can prompt the user and read input, supporting the `-p` and `-s` flags for visibility and silence.  
7. Bash supports command substitution `$(command)` and legacy backticks `` `command` `` to insert command output.  
8. It has the `trap` command to execute cleanup code on signals like `EXIT`, `SIGINT`, or `SIGTERM`.  
9. Bash can run in “POSIX” mode, restricting extensions for greater portability across Unix-like systems.  
10. With `printf` and `echo -e`, Bash lets you format output, including escape sequences for color and formatting.
