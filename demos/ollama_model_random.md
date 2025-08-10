# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.1

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gpt-oss:120b
gpt-oss:120b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 21:40:40:091285700: ollama_model_random
[DEBUG] 21:40:40:126520500: ollama_list_array
[DEBUG] 21:40:40:523886700: ollama_list_array: 2 models found: return 0
[DEBUG] 21:40:40:569392500: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 21:40:40:606869800: ollama_model_random
[DEBUG] 21:40:40:633775500: ollama_list_array
[DEBUG] 21:40:41:035290200: ollama_list_array: 2 models found: return 0
[DEBUG] 21:40:41:063443200: ollama_model_random: 2 models found
gpt-oss:120b
```
