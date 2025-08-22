# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2

```
ollama_thinking on
ollama_thinking
ollama_generate_stream -m "$(ollama_model_random)" -p "list 10 things about bash, 1 per line"
```

thinking is on

#### We need to output a list of 10 things about bash, one per line. Likely short statements or bullet lines. Should be clear. Just satisfy the user request: \"list 10 things about bash, 1 per line\". So output 10 lines. Use simple statements.

No extra formatting? The user said '1 per line', likely want each on new line, maybe prefixed with a bullet? But safer just plain lines. Let's produce 10 distinct facts.

1. Bash is the GNU Project’s shell, the default on most Linux distributions.  
2. It supports command substitution, enabling the output of one command to be used by another.  
3. Bash can perform arithmetic operations directly with the `$((…))` syntax.  
4. It includes array support, allowing indexed and associative arrays.  
5. Bash scripts can use pattern matching with globbing, like `*.txt`.  
6. It offers conditional expressions (`[[ … ]]`) for advanced testing.  
7. Bash can read and write to files with redirection operators `>`, `>>`, `<`, and `<<`.  
8. Job control (`&`, `jobs`, `fg`, `bg`, `kill`) lets you manage background and foreground processes.  
9. Bash supports interactive features such as history recall (`!`) and tab completion.  
10. It can be embedded in other programs as a command interpreter for scripting and automation.
