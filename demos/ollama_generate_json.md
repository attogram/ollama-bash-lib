# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Setup

OLLAMA_HOST: http://localhost:11434
OLLAMA_LIB_API: http://localhost:11434


## Demo

```bash
ollama_generate_json "mistral:7b" "Describe a rabbit in 3 words"
```
```json
[ERROR] ollama_generate_json: Not Found: prompt.
Usage: ollama_generate_json -m <model> [-p <prompt>] [-h] [-v]

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "mistral:7b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:21:32:747175500: _is_valid_model: Model name empty: getting random model
[DEBUG] 22:21:32:808056300: ollama_app_installed
[ERROR] ollama_generate_json: Not Found: prompt.
Usage: ollama_generate_json -m <model> [-p <prompt>] [-h] [-v]

```
