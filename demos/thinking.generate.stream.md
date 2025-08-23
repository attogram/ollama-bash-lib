# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

```
ollama_thinking on
ollama_thinking
ollama_generate_stream -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on

#### The user asks: \"list 10 things about bash, 1 per line\". That's a straightforward request. We can produce a list of ten items related to Bash, each on its own line. No policy violation. Provide answer.

1. Bash is the Bourne‑Again SHell, the default command‑line interpreter on most Linux distributions.  
2. It supports both interactive use and scripting, allowing automation of tasks.  
3. Bash includes powerful built‑in commands like `cd`, `echo`, `export`, and `read`.  
4. It provides advanced globbing and pattern matching for filename expansion.  
5. Bash has control structures (if, for, while, case) for flow‑control in scripts.  
6. It supports command substitution using backticks \(``\) or `$(...)`.  
7. Bash can handle arrays and associative arrays for complex data storage.  
8. It offers command history and line editing via Readline (arrow keys, Ctrl‑R, etc.).  
9. Bash includes job control, enabling background processes and foreground/ background toggling with `&`, `fg`, and `bg`.  
10. It supports programmable completion, allowing custom tab‑completion scripts for commands.
