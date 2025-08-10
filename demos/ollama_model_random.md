# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

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
[DEBUG] 00:37:57:050331600: ollama_model_random
[DEBUG] 00:37:57:083378600: ollama_list_array
[DEBUG] 00:37:57:481889500: ollama_list_array: 2 models found: return 0
[DEBUG] 00:37:57:505316500: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 00:37:57:533311200: ollama_model_random
[DEBUG] 00:37:57:562382900: ollama_list_array
[DEBUG] 00:37:57:933320900: ollama_list_array: 2 models found: return 0
[DEBUG] 00:37:57:957476000: ollama_model_random: 2 models found
gpt-oss:120b
```
