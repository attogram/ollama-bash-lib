# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.6

## Demo
```bash
ollama_model_random
local model="$(ollama_model_random)"; echo "$model"
```
```
llava:7b
gemma3n:e4b
```

## Demo Debug
```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
local model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
llava-phi3:3.8b
[DEBUG] ollama_model_random
[DEBUG] ollama_list_array
deepseek-r1:1.5b
```
