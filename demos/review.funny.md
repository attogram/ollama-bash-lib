# Taglines for Ollama Bash Lib

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7


```bash
task="Generate a list of Descriptions of Ollama Bash Lib.
Descriptions must be 250 words or less.
Review the README.md file below for context.
Generate 2 serious descriptions,
and 5 generally funny,
and 5 funny for programmers,
and 5 funny for sysadmins,
and 5 funny for devops,
and 5 just crazy.
Output in Markdown format.
"
file="../README.md"
ollama_thinking hide
ollama_generate "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS" "$task\n\n$(cat "$file")"
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
