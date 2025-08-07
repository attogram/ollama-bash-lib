# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.24

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gpt-oss:20b
gpt-oss:120b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 00:59:30:816258900: ollama_model_random
[DEBUG] 00:59:30:834062700: ollama_list_array
[DEBUG] 00:59:31:217146200: ollama_list_array: 2 models found: return 0
[DEBUG] 00:59:31:230836300: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 00:59:31:272884700: ollama_model_random
[DEBUG] 00:59:31:292418400: ollama_list_array
[DEBUG] 00:59:31:665334900: ollama_list_array: 2 models found: return 0
[DEBUG] 00:59:31:679326500: ollama_model_random: 2 models found
gpt-oss:120b
```
