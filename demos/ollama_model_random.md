# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.41

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
[DEBUG] 23:12:10:383274800: ollama_model_random
[DEBUG] 23:12:10:404742100: ollama_list_array
[DEBUG] 23:12:10:826985200: ollama_list_array: 2 models found: return 0
[DEBUG] 23:12:10:843775300: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 23:12:10:866242200: ollama_model_random
[DEBUG] 23:12:10:890076600: ollama_list_array
[DEBUG] 23:12:11:246891800: ollama_list_array: 2 models found: return 0
[DEBUG] 23:12:11:264473700: ollama_model_random: 2 models found
gpt-oss:20b
```
