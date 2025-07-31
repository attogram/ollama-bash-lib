# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Demo
```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
deepseek-r1:1.5b
minicpm-v:8b
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
[DEBUG] ollama_list_array: 18 models found
[DEBUG] ollama_model_random: 18 models found
dolphin3:8b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 18 models found
[DEBUG] ollama_model_random: 18 models found
gemma3n:e2b
```
