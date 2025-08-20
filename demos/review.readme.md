# Review of project [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7


```bash
task="Act as a Technical Marketing Expert.
Do a Marketing Review of this github project README.md file.
Output your review in Markdown format."
file="../README.md"
ollama_thinking hide
ollama_generate "qwen3:8b" "$task\n\n$(cat "$file")"
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
