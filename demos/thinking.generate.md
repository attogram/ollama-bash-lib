# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.8

```
ollama_thinking on
ollama_thinking
ollama_generate -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# Task: user wants a list of 10 things about bash, one per line. Just produce 10 items, each on separate line. Should be distinct facts / points. We'll output exactly 10 lines. Ensure each line is a single item. Probably something like "Bash is a Unix shell," etc. Let's do that. Provide list.
# </thinking>

Bash is the default shell on most Linux distributions and macOS.  
It follows the POSIX shell standard, meaning scripts will generally run on any POSIX‑compliant shell.  
Bash supports command substitution with ``$(…)`` and older ``…`` syntax, allowing dynamic command execution.  
The programmable completion feature in Bash can auto-complete commands, options, and file names.  
Bash uses a special file (.bashrc or .bash_profile) for user-specific startup configuration.  
The “$?” variable holds the exit status of the last executed command.  
File globbing in Bash uses patterns like `*`, `?`, and `[ ]` to match filenames.  
Bash incorporates associative arrays (hash tables) starting from version 4.0.  
The `set -x` option enables debug tracing, printing each command before execution.  
Bash can be invoked in “posix mode” with `bash --posix` to enforce stricter POSIX compliance.
