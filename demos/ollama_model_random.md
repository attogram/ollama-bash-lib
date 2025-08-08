# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.30

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
[DEBUG] 23:07:36:103526700: ollama_model_random
[DEBUG] 23:07:36:120005000: ollama_list_array
[DEBUG] 23:07:36:473413400: ollama_list_array: 2 models found: return 0
[DEBUG] 23:07:36:484556200: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 23:07:36:499727100: ollama_model_random
[DEBUG] 23:07:36:516324900: ollama_list_array
[DEBUG] 23:07:36:887585400: ollama_list_array: 2 models found: return 0
[DEBUG] 23:07:36:901723200: ollama_model_random: 2 models found
gpt-oss:120b
```
