# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3

```
ollama_thinking on
ollama_thinking
ollama_generate $(ollama_model_random) "list 10 things about bash, 1 per line" 
```

thinking is on
# <thinking>
# We just need to output a list of 10 things about bash, one per line. Likely each line is an item. Should we number them? Not specified. Just list. We'll list " Bash is ..." etc. We'll provide simple items.
# </thinking>

Bash is an acronym for the *Bourne Again SHell*, a command interpreter for Unix-like systems.  
It supports job control, allowing you to run, stop, or resume processes in the background.  
Bash includes line editing features such as backward/forward search and keyboard shortcuts (e.g., Ctrl‑R, Ctrl‑A).  
It offers command history that can be configured to be saved across sessions.  
Bash allows you to write functions and scripts with conditional statements (`if`, `case`) and loops (`for`, `while`, `until`).  
It supports command and variable expansion, which lets you create dynamic strings and file paths.  
Bash can perform pathname expansion (globbing) using wildcards like `*` and `?`.  
It features associative arrays (dictionary-like structures) introduced in Bash 4.0.  
Bash has built-in redirection operators (`>`, `>>`, `<`, `<<`, `|`) for manipulating input/output streams.  
You can define custom prompt strings (`PS1`, `PS2`, etc.) to display information like the current directory or user.
