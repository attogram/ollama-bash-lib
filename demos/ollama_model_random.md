# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
granite3.3:8b
smollm2:1.7b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 21:05:32:638143500: ollama_model_random
[DEBUG] 21:05:32:655053400: ollama_list_array
[DEBUG] 21:05:32:776462000: ollama_list_array: 13 models found: return 0
[DEBUG] 21:05:32:788950900: ollama_model_random: 13 models found
dolphin3:8b
[DEBUG] 21:05:32:828365700: ollama_model_random
[DEBUG] 21:05:32:845672700: ollama_list_array
[DEBUG] 21:05:32:961580400: ollama_list_array: 13 models found: return 0
[DEBUG] 21:05:32:973844700: ollama_model_random: 13 models found
mistral:7b
```
