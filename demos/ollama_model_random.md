# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.25

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
[DEBUG] 20:20:41:175720500: ollama_model_random
[DEBUG] 20:20:41:190145500: ollama_list_array
[DEBUG] 20:20:41:574475100: ollama_list_array: 2 models found: return 0
[DEBUG] 20:20:41:585868400: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 20:20:41:622231400: ollama_model_random
[DEBUG] 20:20:41:638965300: ollama_list_array
[DEBUG] 20:20:42:001566300: ollama_list_array: 2 models found: return 0
[DEBUG] 20:20:42:012584800: ollama_model_random: 2 models found
gpt-oss:20b
```
