# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

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
[DEBUG] 23:09:44:723614500: ollama_app_installed
gpt-oss:120b
[DEBUG] 23:09:45:128360300: ollama_app_installed
gpt-oss:120b
```
