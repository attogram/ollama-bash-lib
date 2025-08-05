# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
qwen3:1.7b
qwen3:1.7b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 13:23:33:218031000: ollama_model_random
[DEBUG] 13:23:33:222200000: ollama_list_array
[DEBUG] 13:23:33:252814000: ollama_list_array: 16 models found: return 0
[DEBUG] 13:23:33:257712000: ollama_model_random: 16 models found
mistral:7b
[DEBUG] 13:23:33:265607000: ollama_model_random
[DEBUG] 13:23:33:270001000: ollama_list_array
[DEBUG] 13:23:33:294559000: ollama_list_array: 16 models found: return 0
[DEBUG] 13:23:33:299555000: ollama_model_random: 16 models found
granite3.3:8b
```
