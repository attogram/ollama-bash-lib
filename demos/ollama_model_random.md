# ollama_model_random
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[ERROR] ollama_model_random: ollama is not installed
[ERROR] ollama_model_random: ollama is not installed

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 19:49:36:031651517: ollama_app_installed
[ERROR] ollama_model_random: ollama is not installed
[DEBUG] 19:49:36:045296939: ollama_app_installed
[ERROR] ollama_model_random: ollama is not installed

```
