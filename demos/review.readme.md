# Review of project [README.md](../README.md)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.13


```bash
task="Act as a Marketing Expert.
Do a critical Review of this github project README.md file.
Output your review in Markdown format."
file="../README.md"
ollama_generate "deepseek-r1:8b" "$task\n\n$(cat "$file")"
```
null
