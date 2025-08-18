# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# We need to output a list 10 things about bash, each on separate line. Likely short bullet points. No disallowed content. Straight.1. Bash (Bourne‑Again SHell) is the default command‑line interpreter on most Linux distributions.  2. It supports both interactive use and scripting for automating tasks.  3. Bash includes powerful command‑line editing with GNU Readline, enabling Emacs‑ or Vi‑style shortcuts.  4. It offers job control, allowing users to run processes in the background, foreground, or suspend them.  5. Bash provides built‑in arithmetic expansion and integer math using `$(( expression ))`.  6. It features associative arrays (hash tables) introduced in Bash 4, enabling key‑value storage.  7. Bash can perform command substitution with `` `cmd` `` or `$(cmd)` to capture output into variables.  8. It supports extensive globbing and pattern matching, including `**` for recursive directory searches (when `shopt -s globstar` is set).  9. Bash includes many built‑in commands such as `printf`, `read`, `test`, and `declare` for handling data without external programs.  10. The shell’s environment can be customized via startup files like `~/.bashrc`, `~/.bash_profile`, and `/etc/bash.bashrc`.
# </thinking>
