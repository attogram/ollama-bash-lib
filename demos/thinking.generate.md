# ollama_thinking, ollama_generate
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1

```
ollama_thinking on
ollama_thinking
ollama_generate $(ollama_model_random) "list 10 things about bash, 1 per line" 
```

thinking is on
# <thinking>
# The user asks: "list 10 things about bash, 1 per line". Provide 10 items about Bash. Should be simple list. No disallowed content. Provide a list each on its own line.
# </thinking>

- Bash is a Unix shell and command‑language interpreter.  
- It stands for “Bourne Again SHell,” a successor to the original Bourne shell (sh).  
- Bash supports command completion and history navigation using the Tab key and arrow keys.  
- It provides programmable completion, allowing custom scripts to suggest arguments for commands.  
- Bash scripts can use variables, loops, conditionals, and functions for automation.  
- It includes built‑in arithmetic expansion for integer calculations (e.g., $((5+3))).  
- Bash supports job control, enabling background execution and process management with `&`, `fg`, and `bg`.  
- It offers command substitution using backticks `` `cmd` `` or `$(cmd)` to embed output.  
- Bash can source other files with the `.` or `source` command to import functions and variables.  
- It provides extensive redirection operators for input/output, including `>`, `>>`, `<`, `|`, and `tee`.
