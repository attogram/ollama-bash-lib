# ollama_thinking, ollama_generate_stream
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

```
ollama_thinking on
ollama_thinking
ollama_generate_stream $(ollama_model_random) "list 10 things about bash, 1 per line"
```

thinking is on
[ERROR] ollama_model_random: ollama is not installed
# <thinking>
# [ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_generate_json: ollama_api_post failed

# </thinking>

[ERROR] ollama_generate_stream: ollama_generate_json failed with code 1
