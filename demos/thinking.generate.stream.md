# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# We need to list 10 things about bash, each on a line. Likely short items. They want simple: e.g., "Bash stands for Bourne Again Shell". Provide 10 facts. Probably want bullet or just line separated. They didn't specify format other than 1 per line. Just plain lines. Provide concise facts. Might be something like: 1. It is default shell in many Linux distros, etc. Provide 10 lines. No header? They said list 10 things, 1 per line. Could number them? Might not do numbers. I'll put them as numbered? But they said one per line. Could just provide lines. Might be simpler: one fact per line, no numbering. Let's produce 10 lines.Let's choose: - Bash is the GNU Bourne Again SHell. - It was released in 1989. - The name stands for "Bourne-Again Shell". - It is the default login shell on most Linux distributions. - Bash supports command completion and history. - It interprets POSIX shell syntax and many extensions. - Bash can be used as a scripting language. - It provides array, arithmetic, string manipulation. - Bash maintains a history file (~/.bash_history). - Bash can be configured via ~/.bashrc and ~/.bash_profile. That is 10. We'll output.Bash is the GNU Bourne‑Again SHell.  It was released in 1989 as a replacement for the original Bourne shell.  The name “Bash” stands for “Bourne‑Again SHell.”  It is the default login shell on most Linux distributions.  Bash provides command completion and keeps a command history.  It can interpret both POSIX shell syntax and many GNU extensions.  Bash can be used as a scripting language for automating tasks.  It offers arrays, arithmetic evaluation, and advanced string manipulation.  Bash stores command history in the file `~/.bash_history`.  Its behavior can be customized with settings in `~/.bashrc` and `~/.bash_profile`.

# </thinking>
