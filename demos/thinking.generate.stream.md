# ollama_thinking, ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.2

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
# <thinking>
# The user says: "list 10 things about bash, 1 per line". So we should produce 10 items, each on a separate line.The user didn't ask for more formatting. Just list 10 things. The "things about bash" could be features, characteristics? We should produce a list, each line a separate bullet maybe. Not needed. Might just be each line separate. Keep it concise? They didn't say "bullet points" but probably just list.We can include e.g.- Bash stands for "Bourne-Again SHell".- Interprets commands from shell scripts etc.- Uses globbing patterns.- Supports associative arrays.- Built-in command substitution $()- ... etc.We just need 10 distinct facts.We'll output plain text lines, no formatting, each line separate. Ensure each line is distinct.We'll not use bullet "*", but each line can start with e.g. "Bash is...".We'll produce 10 lines. Also we might start each line with a bullet or just separate lines. The instruction: "list 10 things about bash, 1 per line". They didn't say bullet or dash. So just separate lines.Let's produce:Bash is an enhanced version of the original SHell (Bourne Shell).It interprets user commands and scripts written in Bash syntax.It supports command history and auto-completion features.Built-in command substitution using $(...) to embed command output.Associative arrays allow key/value storage introduced in Bash 4.0.It offers pattern matching and filename globbing with *, ?, and [].Conditional statements like if, case, and loops (for, while, until) are native.Command-line job control allows foreground/background execution with & and jobs.Environment variables can be exported and inherited by child processes.Its programmable completion lets users customize tab completions.Bash is an enhanced version of the original SHell (Bourne Shell).  It interprets user commands and scripts written in Bash syntax.  It supports command history and auto‑completion features.  Built‑in command substitution using $(…) lets you embed command output in strings.  Associative arrays provide key/value storage, introduced in Bash 4.0.  Pattern matching and filename globbing with *, ?, and [] are native features.  Conditional statements (if, case) and loops (for, while, until) are built into the shell.  Job control allows running processes in the foreground or background with & and jobs.  Environment variables can be exported and inherited by child processes.  Programmable completion lets users customize tab completions for commands.

# </thinking>
