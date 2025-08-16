# ollama_thinking, ollama_generate_stream
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# The user: "list 10 things about bash, 1 per line". So a simple list: 10 items about bash. The user hasn't asked for anything else, so respond with a list of 10 items, each on its own line. Probably short bullet points. Ensure it's just 10. Probably "Basic information about Bash". We'll do: 1. Bash stands for Bourne Again SHell. 2. It's default shell on many Linux distributions. 3. Supports scripting with variables, loops, conditionals. 4. Provides command history navigation. 5. Includes tab-completion. 6. Handles piped input/output. 7. Can execute both built-in and external commands. 8. Supports globbing using wildcards. 9. Supports environment variables. 10. Has a configuration file ~/.bashrc. Let's deliver.Bash stands for “Bourne Again SHell.”  Default shell on most Linux distributions.  Supports scripting with variables, loops, and conditionals.  Offers command‑history navigation (↑/↓).  Provides tab‑completion for commands and files.  Handles input/output redirection and piping.  Includes built‑in commands (cd, echo, etc.).  Uses globbing with wildcards like * and ?.  Manages environment variables for process control.  Runs initialization scripts from ~/.bashrc.

# </thinking>
