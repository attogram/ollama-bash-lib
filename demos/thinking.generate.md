# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

```
ollama_thinking on
ollama_thinking
ollama_generate -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on
#### <thinking>
#### User: "list 10 things about bash, 1 per line." They want 10 items about bash. Likely simple list, each on its own line. No extra formatting or numbered maybe? They said "1 per line". So we need 10 distinct items, each on a line. Probably no numbering. Just each line: e.g.

- bash is a Unix shell
- It interprets command lines
- etc

We should create 10 unique points. Let's produce succinct statements. No numbering. Just each as separate line. Ensure there are 10 lines. Let's draft.

1. bash stands for "Bourne Again SHell" and is a descendant of the original Bourne shell.
2. It runs on almost every UNIX-like system and many more.
3. It supports interactive features such as command history and job control.
4. Bash includes programming constructs: loops, conditionals, functions.
5. It auto-completes filenames and commands with TAB by default.
6. It can read its configuration from .bashrc and .bash_profile.
7. Scripts written for bash are typically marked with #!/usr/bin/env bash.
8. It provides built-in commands like cd, echo, read, etc.
9. Bash can execute commands in parallel using & and pipelines.
10. It supports advanced features like process substitution and here-documents.

Make sure each on separate line. Probably no bullet points. Just the text. However bullet points might count as "1 per line" but the bullet may interfere. Safer to simply not bullet but write each sentence.

Let's produce final.
#### </thinking>

bash is a descendant of the original Bourne shell and is often called “Bourne‑Again SHell.”  
It comes preinstalled on almost every Unix-like system, making it the de facto shell.  
The shell supports interactive features such as command history, command line editing, and job control.  
Bash scripts can use standard programming constructs like loops, conditionals, and functions.  
It has an auto‑completion system that expands file names and commands when you press TAB.  
User configuration for interactive sessions is usually read from files such as ~/.bashrc or ~/.bash_profile.  
Scripts intended to be run by bash often start with the shebang `#!/usr/bin/env bash`.  
Many common shell operations are built into bash itself, including `cd`, `echo`, `read`, and `export`.  
You can run commands in the background or in parallel using `&`, and pipe output between commands with `|`.  
Advanced features such as process substitution, here‑documents, and string manipulation make bash a powerful scripting language.
