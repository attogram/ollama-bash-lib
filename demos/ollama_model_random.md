# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.34

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
[DEBUG] 00:51:10:683277400: ollama_model_random
[DEBUG] 00:51:10:701222100: ollama_list_array
[DEBUG] 00:51:11:070493500: ollama_list_array: 2 models found: return 0
[DEBUG] 00:51:11:084181300: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 00:51:11:101337100: ollama_model_random
[DEBUG] 00:51:11:119566400: ollama_list_array
[DEBUG] 00:51:11:493850300: ollama_list_array: 2 models found: return 0
[DEBUG] 00:51:11:505718800: ollama_model_random: 2 models found
gpt-oss:120b
```
