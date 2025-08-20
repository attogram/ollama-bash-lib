# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
dolphin3:8b
granite3.3:2b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 22:21:36:081185800: ollama_app_installed
granite3.3:2b
[DEBUG] 22:21:36:270125600: ollama_app_installed
smollm2:1.7b
```
