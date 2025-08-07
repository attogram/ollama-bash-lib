# Code Review of [ollama_bash_lib.sh](../ollama_bash_lib.sh)

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.20


```bash
task="Act as an Expert Software Engineer.
Do a Code Review of this script.
Output your review in Markdown format."
file="../ollama_bash_lib.sh"
ollama_generate "gpt-oss:120b" "$task\n\n$(cat "$file")"
```
./../ollama_bash_lib.sh: line 126: /cygdrive/c/Windows/system32/curl: Argument list too long
[ERROR] ollama_api_post: curl error: 126
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate: error_ollama_generate_json: 1
