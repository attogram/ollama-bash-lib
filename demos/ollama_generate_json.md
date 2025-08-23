# ollama_generate_json
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

## Setup

OLLAMA_HOST:
OBL_API: http://localhost:11434

[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_generate_json -m "" -p "Describe a rabbit in 3 words"
```
```json
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_generate_json -m <model> [-p <prompt>] [-h] [-v]

```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_json -m "" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 09:20:00:219094469: _is_valid_model: Model name empty: getting random model
[ERROR] ollama_model_random: ollama is not installed
[DEBUG] 09:20:00:232228468: _is_valid_model: Model Not Found: ollama_model_random failed
Error: -m <model> is required

Usage: ollama_generate_json -m <model> [-p <prompt>] [-h] [-v]

```
