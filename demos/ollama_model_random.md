# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.40

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
[DEBUG] 23:02:21:361121400: ollama_model_random
[DEBUG] 23:02:21:377288800: ollama_list_array
[DEBUG] 23:02:21:745920700: ollama_list_array: 2 models found: return 0
[DEBUG] 23:02:21:756860400: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 23:02:21:774460600: ollama_model_random
[DEBUG] 23:02:21:789795900: ollama_list_array
[DEBUG] 23:02:22:179066700: ollama_list_array: 2 models found: return 0
[DEBUG] 23:02:22:192719900: ollama_model_random: 2 models found
gpt-oss:20b
```
