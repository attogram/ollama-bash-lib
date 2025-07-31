# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.8

## Demo
```bash
ollama_model_random
local model="$(ollama_model_random)"; echo "$model"
```
```
gemma3n:e4b
deepseek-r1:1.5b
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
[DEBUG] ollama_list_array: 19 models found
[DEBUG] ollama_model_random: 19 models found
deepseek-r1:1.5b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 19 models found
[DEBUG] ollama_model_random: 19 models found
granite3.3:2b
```
