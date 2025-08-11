# Review of project [README.md](../README.md)
ERROR: Ollama Not Installed
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4
./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found


```bash
task="Act as a Technical Marketing Expert.
Do a Marketing Review of this github project README.md file.
Output your review in Markdown format."
file="../README.md"
ollama_generate "" "$task\n\n$(cat "$file")"
```
[ERROR] _call_curl: curl error: 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed
[ERROR] ollama_generate: error_ollama_generate_json: 1
