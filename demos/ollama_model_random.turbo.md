# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.14

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
[DEBUG] 00:49:01:534795200: ollama_model_random
[DEBUG] 00:49:01:551203700: ollama_list_array
[DEBUG] 00:49:01:907613600: ollama_list_array: 2 models found: return 0
[DEBUG] 00:49:01:918075400: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 00:49:01:953769700: ollama_model_random
[DEBUG] 00:49:01:969927100: ollama_list_array
[DEBUG] 00:49:02:344609000: ollama_list_array: 2 models found: return 0
[DEBUG] 00:49:02:355970600: ollama_model_random: 2 models found
gpt-oss:120b
```
