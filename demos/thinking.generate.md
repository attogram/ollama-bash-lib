# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2

```
ollama_thinking on
ollama_thinking
ollama_generate -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on
#### <thinking>
#### The user asks: "list 10 things about bash, 1 per line". We just need to output 10 items (facts or features) about Bash, each on its own line. Should be concise. Provide 10 lines. No extra text. Use plain text.
#### </thinking>

1. Bash stands for “Bourne Again SHell,” a successor to the original Bourne shell.  
2. It supports command-line editing, history, and tab completion.  
3. Bash scripts can include functions, loops, and conditional statements.  
4. It provides powerful parameter expansion and string manipulation features.  
5. Bash can execute pipelines and redirections for input and output streams.  
6. It includes built‑in arithmetic using integer arithmetic and the $((…)) syntax.  
7. Bash supports job control, allowing background and foreground process management.  
8. It offers associative arrays (hash tables) for key‑value storage.  
9. Bash can source other scripts with the `source` or `.` command to share variables and functions.  
10. It is the default login shell on most Linux distributions and macOS (until recent changes).
