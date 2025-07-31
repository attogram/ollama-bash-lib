# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.8

## Demo
```bash
ollama_model_random
local model="$(ollama_model_random)"; echo "$model"
```
```
granite3.3:2b
qwen2.5-coder:7b
```

## Demo Debug
```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
local model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 25 models found
[DEBUG] ollama_model_random: 25 models found
gemma:2b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 25 models found
[DEBUG] ollama_model_random: 25 models found
mistral:7b
```
