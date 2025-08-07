# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.19

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
[DEBUG] 22:06:14:865483300: ollama_model_random
[DEBUG] 22:06:14:882000900: ollama_list_array
[DEBUG] 22:06:15:324585800: ollama_list_array: 2 models found: return 0
[DEBUG] 22:06:15:336226600: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 22:06:15:379653400: ollama_model_random
[DEBUG] 22:06:15:396946400: ollama_list_array
[DEBUG] 22:06:15:793514900: ollama_list_array: 2 models found: return 0
[DEBUG] 22:06:15:804513800: ollama_model_random: 2 models found
gpt-oss:20b
```
