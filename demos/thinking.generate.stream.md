# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
<thinking>
User: "list 10 things about bash, 1 per line". They likely want a plain list of 10 items. Provide 10 distinct points, each on a separate line. Avoid explanations? They didn't state to be short or verbose, but just list 10 things, one per line. That's straightforward. I'll produce 10 bullet-less lines, but ensuring each is on separate line. E.g., "Bash is a Unix shell and command language." etc. Let's do that.Bash is a Unix shell and command language.  It stands for "Bourne Again Shell".  It is the default login shell on most Linux distributions.  Bash supports scripting with if-then-else, loops, and functions.  It includes command history and history expansion (`!`).  Auto-completion can be configured with the `compgen` command.  Brace expansion allows generating multiple strings from one pattern.  Bash uses array variables, accessed with `${array[0]}` syntax.  It provides process substitution with `<(cmd)` and `>(cmd)`.  The `source` command (`.`) lets you execute a file in the current shell.

</thinking>
