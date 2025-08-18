# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# User wants "list 10 things about bash, 1 per line". Likely a list of 10 facts or features about bash. Should be concise, each on separate line. We'll provide 10 bullet-like items or just numbered lines. Probably numbered. I'll answer.1. Bash is the GNU Bourne-Again SHell, a command processor that reads interactive shells or scripts.  2. It supports command substitution (`$(command)` or backticks), allowing the output of one command to be inserted into another.  3. Bash offers brace expansion (`{a,b,c}`) for generating multiple strings from a single pattern, useful in file expansions.  4. It includes arrays with zero-based indexing, enabling storage and manipulation of multiple values in a single variable.  5. Bash supports job control (`&`, `fg`, `bg`, `jobs`) to run and manage background and suspended processes.  6. Patterns such as globbing (`*.txt`, `a??`) are used for file name expansion, matching file names against wildcards.  7. Bash has a built-in arithmetic expansion (`$((expression))`) that evaluates arithmetic expressions without calling external programs.  8. It can read and write environment variables, automatically exporting them to subshells when specified with `export`.  9. Bash includes special variables like `$?` (exit status), `$#` (argument count), and `$@`/`$*` (argument list).  10. It supports scripting features such as `if`, `for`, `while`, functions, and associative arrays, allowing the creation of complex automation scripts.

# </thinking>
