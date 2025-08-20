# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7


```bash
task="Act as an Expert Software Engineer.
Do a Code Review of this script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS" "$task\n\n$(cat "$file")"
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
