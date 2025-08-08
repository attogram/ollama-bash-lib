# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.29

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
[DEBUG] 22:53:04:902111600: ollama_model_random
[DEBUG] 22:53:04:921601300: ollama_list_array
[DEBUG] 22:53:05:299168600: ollama_list_array: 2 models found: return 0
[DEBUG] 22:53:05:311536700: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 22:53:05:328701100: ollama_model_random
[DEBUG] 22:53:05:345500500: ollama_list_array
[DEBUG] 22:53:05:746839900: ollama_list_array: 2 models found: return 0
[DEBUG] 22:53:05:759030700: ollama_model_random: 2 models found
gpt-oss:20b
```
