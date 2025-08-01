# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.13

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
deepseek-r1:8b
deepseek-r1:8b
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
[DEBUG] ollama_list_array: 1 models found: return 0
[DEBUG] ollama_model_random: 1 models found
deepseek-r1:8b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 1 models found: return 0
[DEBUG] ollama_model_random: 1 models found
deepseek-r1:8b
```
