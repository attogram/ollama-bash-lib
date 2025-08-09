# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.35

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gpt-oss:20b
gpt-oss:20b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 13:10:53:328350500: ollama_model_random
[DEBUG] 13:10:53:344402000: ollama_list_array
[DEBUG] 13:10:53:716901100: ollama_list_array: 2 models found: return 0
[DEBUG] 13:10:53:728316000: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 13:10:53:742622400: ollama_model_random
[DEBUG] 13:10:53:757254200: ollama_list_array
[DEBUG] 13:10:54:103863200: ollama_list_array: 2 models found: return 0
[DEBUG] 13:10:54:118102400: ollama_model_random: 2 models found
gpt-oss:120b
```
