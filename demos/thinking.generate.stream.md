# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.1

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# User wants "list 10 things about bash, 1 per line". We can provide a short list of 10 facts or features, each on its own line.Should we explain each thing? Possibly short bullet. But "1 per line" likely means each item on a new line.Just ensure 10 lines. Let's produce: "Bash stands for Bourne Again SHell", "It is default shell on most Linux distros", etc. Provide 10 distinct interesting facts. No extra commentary. Just lines. Maybe enumerated? But enumeration might still be one per line. Let's just output 10 lines in plain text.Bash stands for “Bourne Again Shell,” a POSIX‑compliant, free software replacement for the original Bourne shell.  It replaces the default shell on nearly all Linux distributions and macOS (until recently).  Bash supports command line editing with emacs and vi key bindings, making it highly customizable.  It implements command substitution using `$( … )` or `` `…` ``, allowing the output of one command to be used as input to another.  Its scripting language includes variables, control structures (if/then/else, loops, case), and functions.  Bash can perform pattern matching and globbing, with powerful wildcards like `*`, `?`, and extended globbing (`@(pattern)` for alternation).  The shell keeps a command history accessible via the up/down arrow keys, and it can be queried or edited with the `history` command.  Bash uses job control, allowing users to suspend (`Ctrl-Z`) and resume (`fg`, `bg`) background processes.  It supports associative arrays (bash v4 or later), enabling dictionary‑style key/value storage in scripts.  Bash provides programmable completion, letting you configure how command and option suggestions are generated for the `Tab` key.
# </thinking>
