# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.0

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gpt-oss:20b
gpt-oss:120b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 19:44:37:127671200: ollama_model_random
[DEBUG] 19:44:37:162641200: ollama_list_array
[DEBUG] 19:44:37:628451500: ollama_list_array: 2 models found: return 0
[DEBUG] 19:44:37:654178900: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 19:44:37:682798300: ollama_model_random
[DEBUG] 19:44:37:712566000: ollama_list_array
[DEBUG] 19:44:38:090733900: ollama_list_array: 2 models found: return 0
[DEBUG] 19:44:38:113999000: ollama_model_random: 2 models found
gpt-oss:20b
```
