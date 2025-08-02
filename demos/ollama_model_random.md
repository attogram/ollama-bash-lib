# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.20

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gemma3n:e4b
dolphin3:8b
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
[DEBUG] ollama_list_array: 6 models found: return 0
[DEBUG] ollama_model_random: 6 models found
qwen2.5vl:7b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 6 models found: return 0
[DEBUG] ollama_model_random: 6 models found
mistral:7b
```
