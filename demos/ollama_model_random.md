# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
tinyllama:latest
tinyllama:latest
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 22:08:39:150730107: ollama_app_installed
tinyllama:latest
[DEBUG] 22:08:39:193870127: ollama_app_installed
tinyllama:latest
```
