# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.23

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
[DEBUG] 00:55:18:673659200: ollama_model_random
[DEBUG] 00:55:18:690850800: ollama_list_array
[DEBUG] 00:55:19:052434600: ollama_list_array: 2 models found: return 0
[DEBUG] 00:55:19:066666100: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 00:55:19:106011800: ollama_model_random
[DEBUG] 00:55:19:121921900: ollama_list_array
[DEBUG] 00:55:19:476504600: ollama_list_array: 2 models found: return 0
[DEBUG] 00:55:19:488382400: ollama_model_random: 2 models found
gpt-oss:120b
```
