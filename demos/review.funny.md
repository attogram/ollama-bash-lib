# Taglines for Ollama Bash Lib
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3
[ERROR] ollama_model_random: ollama is not installed


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
ollama_generate -m "" -p "$task\n\n$(cat "$file")"
```
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
