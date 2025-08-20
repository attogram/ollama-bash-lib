# Security Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7


```bash
task="Act as an Expert Security Professional.
Do a Security Review of this bash script.
Require that script works in Bash v3.2 or higher.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_thinking hide
ollama_generate "qwen3:8b" "$task\n\n$(cat "$file")"
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
