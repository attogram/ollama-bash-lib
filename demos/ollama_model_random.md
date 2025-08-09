# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gpt-oss:120b
gpt-oss:20b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 22:16:18:260531000: ollama_model_random
[DEBUG] 22:16:18:276266200: ollama_list_array
[DEBUG] 22:16:18:644097400: ollama_list_array: 2 models found: return 0
[DEBUG] 22:16:18:656288500: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 22:16:18:673242900: ollama_model_random
[DEBUG] 22:16:18:689807700: ollama_list_array
[DEBUG] 22:16:19:092945700: ollama_list_array: 2 models found: return 0
[DEBUG] 22:16:19:105235000: ollama_model_random: 2 models found
gpt-oss:20b
```
