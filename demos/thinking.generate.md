# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3

```
ollama_thinking on
ollama_thinking
ollama_generate $(ollama_model_random) "list 10 things about bash, 1 per line" 
```

thinking is on
# <thinking>
# User expects: "list 10 things about bash, 1 per line". Likely they want 10 distinct facts about Bash. Provide each on its line.

We need to respond with 10 lines. No numbering? Could be bullet but keep one per line. We'll just list them. Use brief sentences. Ensure no duplicates. Let's produce.
# </thinking>

Bash is the default shell on most Linux distributions.  
It interprets both interactive and script-based commands.  
Bash supports brace expansion, e.g., `echo a{b,c}` outputs `ab ac`.  
Process substitution with `<(command)` lets you use command output as a file.  
Command substitution with `$(command)` captures output into a variable.  
It provides associative arrays (hash tables) in Bash 4.0+.  
`set -e` causes a script to exit on any command returning a non‑zero status.  
Bash includes built‑in support for job control (`&`, `fg`, `bg`, `Ctrl‑Z`).  
The `source` (or `.`) command runs another script in the current shell context.  
Bash’s `readarray` (or `mapfile`) efficiently loads lines from a file into an array.
