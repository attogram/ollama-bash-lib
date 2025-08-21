# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1

```
ollama_thinking on
ollama_thinking
ollama_generate_stream -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on

#### The user asks: \"list 10 things about bash, 1 per line\". They want a list of 10 items, each on its own line, about bash. This is straightforward. Provide 10 things (features, characteristics). Should be simple. Use plain text, each line separate. No extra commentary.

- Bash stands for “Bourne Again SHell,” a successor to the original Bourne shell.  
- It supports command-line editing with Emacs- and vi-style key bindings.  
- Bash includes powerful scripting capabilities, such as loops, conditionals, and functions.  
- It provides command history and completion, making repeated commands easy to reuse.  
- Bash can perform job control, allowing you to suspend, resume, and manage background processes.  
- It features brace expansion, which simplifies the creation of multiple similar strings or filenames.  
- Bash supports arrays and associative arrays for handling collections of data.  
- It includes built-in arithmetic evaluation for integer math without external tools.  
- Bash can source other scripts or configuration files using the `source` or `.` command.  
- It offers extensive customizable prompts and environment variables via the `PS1`, `PATH`, and other settings.
