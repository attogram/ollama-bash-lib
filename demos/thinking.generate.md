# ollama_thinking, ollama_generate
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

```
ollama_thinking on
ollama_thinking
ollama_generate $(ollama_model_random) "list 10 things about bash, 1 per line" 
```

thinking is on
# <thinking>
# Need to produce a list 10 things about bash, 1 per line. Probably a short item list.
# </thinking>

1. Bash is the default command‐line shell on most Linux distributions and macOS.  
2. It supports command history, allowing users to navigate and reuse previous commands with the up/down arrow keys.  
3. Bash permits variable assignment without spaces (`VAR=value`) and variable expansion with `${}` or `$`.  
4. It features pathname globbing (`*.txt`, `file[1-3]`) for pattern matching.  
5. Bash includes a powerful array type, which can be declared with `arr=(one two three)` and accessed with `arr[0]`.  
6. It supports control structures such as `if`, `for`, `while`, and `until`, enabling script logic.  
7. Bash can perform process substitution (`< <(command)`) and named pipes (using `mkfifo`).  
8. The `exec` builtin can replace the current shell with another program, or redirect file descriptors.  
9. Bash scripts can be made executable by adding a shebang line `#!/usr/bin/env bash` at the top.  
10. Its `read` builtin can capture user input, with options like `-p` to prompt and `-s` for silent (password) input.
