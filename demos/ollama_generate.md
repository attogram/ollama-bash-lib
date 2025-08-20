# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Setup

OLLAMA_HOST: http://localhost:11434
OLLAMA_LIB_API: http://localhost:11434


## Demo

```bash
ollama_generate "gemma3n:e2b" "Describe a rabbit in 3 words"
```
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gemma3n:e2b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:21:31:599152200: _is_valid_model: Model name empty: getting random model
[DEBUG] 22:21:31:680802000: ollama_app_installed
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```
