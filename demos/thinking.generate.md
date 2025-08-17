# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5

```
ollama_thinking on
ollama_thinking
ollama_generate $(ollama_model_random) "list 10 things about bash, 1 per line" 
```

thinking is on
# <thinking>
# The user asks: "list 10 things about bash, 1 per line". Simple request. Provide a list of ten items related to Bash, each on its own line. We can comply, no disallowed content. No policy issues.

We should answer with ten bullet points or just lines. Provide variety: features, history, usage, variables, etc.

Let's produce answer.
# </thinking>

- Bash is the Bourne‑Again SHell, a POSIX‑compatible command‑line interpreter.  
- It is the default login shell on most Linux distributions and macOS (until macOS 12).  
- Bash supports command history, tab‑completion, and line editing via GNU Readline.  
- It provides powerful scripting capabilities, including functions, arrays, and arithmetic expansion.  
- Bash can execute shell scripts with the `.sh` extension, making automation easy.  
- It includes built‑in commands like `cd`, `echo`, `read`, and `source` for interactive use.  
- Bash allows redirection of input/output using `>`, `>>`, `<`, `|`, and `&>` operators.  
- It supports job control, enabling background execution with `&` and `Ctrl‑Z`/`fg`/`bg`.  
- Bash can customize its environment via the `~/.bashrc`, `~/.bash_profile`, and `~/.profile` files.  
- It is extensible with programmable completion and can run external commands and utilities seamlessly.
