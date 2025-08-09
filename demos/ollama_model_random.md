# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.38

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
[DEBUG] 20:22:43:052353100: ollama_model_random
[DEBUG] 20:22:43:069973900: ollama_list_array
[DEBUG] 20:22:43:437190700: ollama_list_array: 2 models found: return 0
[DEBUG] 20:22:43:449200800: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 20:22:43:464140800: ollama_model_random
[DEBUG] 20:22:43:480920500: ollama_list_array
[DEBUG] 20:22:43:869365200: ollama_list_array: 2 models found: return 0
[DEBUG] 20:22:43:880711200: ollama_model_random: 2 models found
gpt-oss:120b
```
