# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.2

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
[DEBUG] 22:16:14:760205800: ollama_model_random
[DEBUG] 22:16:14:793887400: ollama_list_array
[DEBUG] 22:16:15:191395100: ollama_list_array: 2 models found: return 0
[DEBUG] 22:16:15:212325000: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 22:16:15:239572300: ollama_model_random
[DEBUG] 22:16:15:267130300: ollama_list_array
[DEBUG] 22:16:15:685417400: ollama_list_array: 2 models found: return 0
[DEBUG] 22:16:15:709636500: ollama_model_random: 2 models found
gpt-oss:120b
```
