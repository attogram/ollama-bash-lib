# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.32

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
[DEBUG] 23:34:14:446268100: ollama_model_random
[DEBUG] 23:34:14:463030200: ollama_list_array
[DEBUG] 23:34:14:830985700: ollama_list_array: 2 models found: return 0
[DEBUG] 23:34:14:842445000: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 23:34:14:859471000: ollama_model_random
[DEBUG] 23:34:14:875549200: ollama_list_array
[DEBUG] 23:34:15:293564900: ollama_list_array: 2 models found: return 0
[DEBUG] 23:34:15:307818100: ollama_model_random: 2 models found
gpt-oss:20b
```
