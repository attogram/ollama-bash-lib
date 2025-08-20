# ollama_generate
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Setup

OLLAMA_HOST: http://localhost:11434
OLLAMA_LIB_API: http://localhost:11434

[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_generate "" "Describe a rabbit in 3 words"
```
```
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "" "Describe a rabbit in 3 words"
```
```
[DEBUG] 19:49:35:635835784: _is_valid_model: Model name empty: getting random model
[DEBUG] 19:49:35:648582199: ollama_app_installed
[ERROR] ollama_model_random: ollama is not installed
[DEBUG] 19:49:35:654645283: _is_valid_model: Model Not Found: ollama_model_random failed
Error: -m <model> is required

Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```
