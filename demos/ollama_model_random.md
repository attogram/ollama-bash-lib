# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.21

## Demo
```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
hermes3:8b
gemma3n:e4b
```

## Demo Debug
```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 16 models found
[DEBUG] ollama_model_random: 16 models found
minicpm-v:8b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 16 models found
[DEBUG] ollama_model_random: 16 models found
granite3.3:2b
```
