# ollama_model_random
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[ERROR] ollama_model_random: ollama is not installed
ollama-not-installed[ERROR] ollama_model_random: ollama is not installed
ollama-not-installed
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 00:19:33:765907022: ollama_model_random
[DEBUG] 00:19:33:770642499: ollama_app_installed
[ERROR] ollama_model_random: ollama is not installed
ollama-not-installed[DEBUG] 00:19:33:777571799: ollama_model_random
[DEBUG] 00:19:33:782639378: ollama_app_installed
[ERROR] ollama_model_random: ollama is not installed
ollama-not-installed
```
