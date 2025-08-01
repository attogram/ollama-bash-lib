# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24

## Demo
```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
mistral:7b
qwen3:8b
```

## Demo Debug
```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 7 models found
[DEBUG] ollama_model_random: 7 models found
./../ollama_bash_lib.sh: line 479: 065648200: value too great for base (error token is "065648200")
mistral:7b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
[DEBUG] ollama_list_array: 7 models found
[DEBUG] ollama_model_random: 7 models found
dolphin3:8b
```
