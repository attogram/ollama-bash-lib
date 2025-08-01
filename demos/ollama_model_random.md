# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.25

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
mistral:7b
deepseek-r1:14b
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
[DEBUG] ollama_list_array: 7 models found
[DEBUG] ollama_model_random: 7 models found
gemma3n:e4b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 7 models found
[DEBUG] ollama_model_random: 7 models found
qwen3:8b
```
