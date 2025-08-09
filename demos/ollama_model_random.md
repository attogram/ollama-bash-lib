# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.43

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
[DEBUG] 00:19:00:098795100: ollama_model_random
[DEBUG] 00:19:00:120714100: ollama_list_array
[DEBUG] 00:19:00:519537000: ollama_list_array: 2 models found: return 0
[DEBUG] 00:19:00:538171200: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 00:19:00:562350300: ollama_model_random
[DEBUG] 00:19:00:585259200: ollama_list_array
[DEBUG] 00:19:00:954133300: ollama_list_array: 2 models found: return 0
[DEBUG] 00:19:00:972894500: ollama_model_random: 2 models found
gpt-oss:20b
```
