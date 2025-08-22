# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
granite3.3:2b
gemma3n:e2b
```

## Demo Debug

```bash
OBL_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
qwen3:8b
smollm2:1.7b
```
