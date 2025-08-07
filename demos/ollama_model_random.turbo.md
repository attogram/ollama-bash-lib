# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

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
[DEBUG] 21:36:01:064235200: ollama_model_random
[DEBUG] 21:36:01:081906800: ollama_list_array
[DEBUG] 21:36:01:461295800: ollama_list_array: 2 models found: return 0
[DEBUG] 21:36:01:474503300: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 21:36:01:523958500: ollama_model_random
[DEBUG] 21:36:01:541519600: ollama_list_array
[DEBUG] 21:36:01:949255500: ollama_list_array: 2 models found: return 0
[DEBUG] 21:36:01:961978200: ollama_model_random: 2 models found
gpt-oss:120b
```
