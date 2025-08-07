# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.20

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
[DEBUG] 00:09:41:490530500: ollama_model_random
[DEBUG] 00:09:41:507821200: ollama_list_array
[DEBUG] 00:09:41:866601600: ollama_list_array: 2 models found: return 0
[DEBUG] 00:09:41:879385800: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 00:09:41:917212400: ollama_model_random
[DEBUG] 00:09:41:933881000: ollama_list_array
[DEBUG] 00:09:42:311776000: ollama_list_array: 2 models found: return 0
[DEBUG] 00:09:42:323523500: ollama_model_random: 2 models found
gpt-oss:120b
```
