# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.46

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
[DEBUG] 16:24:55:534321000: ollama_model_random
[DEBUG] 16:24:55:568205300: ollama_list_array
[DEBUG] 16:24:55:970662100: ollama_list_array: 2 models found: return 0
[DEBUG] 16:24:55:994015900: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 16:24:56:025027700: ollama_model_random
[DEBUG] 16:24:56:056869400: ollama_list_array
[DEBUG] 16:24:56:456456100: ollama_list_array: 2 models found: return 0
[DEBUG] 16:24:56:477420000: ollama_model_random: 2 models found
gpt-oss:120b
```
