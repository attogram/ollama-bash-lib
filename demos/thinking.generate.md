# ollama_thinking, ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

```
ollama_thinking on
ollama_thinking
ollama_generate -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on
#### <thinking>
#### User asks: "list 10 things about bash, 1 per line". So we just list bullet points? They said 1 per line, so possibly each item on a separate line without bullet. Probably a numbered list? They said "1 per line" maybe just items each on a separate line. So provide 10 items about bash. Should be concise. I'll produce:

1. Bash is the Bourne Again SHell, a command interpreter.
2. …
Make 10 lines. No numbering maybe. But safe to number? Might break "1 per line" requirement? "1 per line" ambiguous. Probably each line a single thing. I'll just list each thing on a separate line, without numbering. 10 lines. Let's give a brief description. Let's do numbered? The instruction didn't require numbering; they said "1 per line". So we can do one per line, maybe not numbered. Good. I'll produce 10 separate lines.
#### </thinking>

Bash is the default shell on most Linux distributions.  
It supports command substitution with ``$(...)`` and backticks.  
Variables can be referenced with the `$` prefix, e.g. `$HOME`.  
Arrays are declared with `declare -a array=(a b c)` and accessed via `${array[0]}`.  
Brace expansion lets you generate sequences, `${x{1..5}}` → `x1 x2 x3 x4 x5`.  
Conditional tests are performed with `[ ... ]` or `[[ ... ]]`.  
Shell globbing patterns (`*`, `?`, `[]`) match filenames.  
Redirection operators `>`, `<`, `>>`, `2>&1` control input/output streams.  
Process substitution (`<(command)` and `>(command)`) enables passing command output as a file.  
Bash can be extended with `source` (`.`) to load scripts, and functions for reusable code.
