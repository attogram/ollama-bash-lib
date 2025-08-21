# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

```
ollama_thinking on
ollama_thinking
ollama_generate -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on
#### <thinking>
#### We need to output list of 10 things about Bash, each on a single line. The user wants 10 items, each on one line. We should just comply: we can list 10 facts or features. No more, no less. Probably we should not add any introductory text. Just list lines. Provide 10 lines, each describing a thing about bash. Ok.
#### </thinking>

1. Bash is the default shell on many Linux distributions and macOS.  
2. It supports command history navigation with the up/down arrow keys.  
3. Bash uses globbing patterns (e.g., `*.txt`, `a?c`) for file matching.  
4. It can perform arithmetic expansion with `$((expression))`.  
5. Bash supports arrays (e.g., `arr=(a b c)` and `${arr[1]}`).  
6. Functions in Bash are defined with `function name { ... }` or `name()`.  
7. Bash includes process substitution like `<(command)` and `>(command)`.  
8. It provides brace expansion for generating a sequence of strings (`file{1..3}.txt`).  
9. Bash can execute commands inside scripts with the `#!/usr/bin/env bash` shebang.  
10. It supports job control, allowing background (`&`) and foreground (`fg`) processes.
