# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
<thinking>
The user asks: "list 10 things about bash, 1 per line". So we need to respond with 10 items, each on its own line. Probably characteristics/features of Bash. Provide list. No disallowed content. So simple.1. Bash is the GNU Bourne‑Again SHell, a widely used Unix command‑line interpreter.  2. It supports both interactive use and scripting, allowing automation of tasks.  3. Bash includes powerful command‑line editing features (readline) with Emacs and vi modes.  4. It provides built‑in utilities like `echo`, `printf`, `read`, and arithmetic evaluation `$((…))`.  5. Bash supports job control, enabling background processes and job suspension/resumption.  6. It offers extensive globbing and pathname expansion for matching file patterns.  7. Bash includes conditional constructs (`if`, `case`, `[[ … ]]`) and loops (`for`, `while`, `until`).  8. It allows function definitions for reusable code blocks within scripts.  9. Bash can perform command substitution using backticks `` `command` `` or `$(command)`.  10. It includes programmable completion and customizable prompt via variables like `PS1`.

</thinking>
