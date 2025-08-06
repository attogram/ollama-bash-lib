# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
qwen3:8b
cogito:3b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 14:11:37:044406000: ollama_model_random
[DEBUG] 14:11:37:050256000: ollama_list_array
[DEBUG] 14:11:37:083446000: ollama_list_array: 16 models found: return 0
[DEBUG] 14:11:37:090101000: ollama_model_random: 16 models found
qwen2.5vl:7b
[DEBUG] 14:11:37:100507000: ollama_model_random
[DEBUG] 14:11:37:105925000: ollama_list_array
[DEBUG] 14:11:37:140373000: ollama_list_array: 16 models found: return 0
[DEBUG] 14:11:37:147669000: ollama_model_random: 16 models found
granite3.3:8b
```
