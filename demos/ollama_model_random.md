# ollama_model_random
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

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
[DEBUG] 23:18:49:321942900: ollama_model_random
[DEBUG] 23:18:49:339088600: ollama_list_array
[DEBUG] 23:18:50:246316300: ollama_list_array: 2 models found: return 0
[DEBUG] 23:18:50:276961200: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 23:18:50:329152800: ollama_model_random
[DEBUG] 23:18:50:346464600: ollama_list_array
[DEBUG] 23:18:51:147557900: ollama_list_array: 2 models found: return 0
[DEBUG] 23:18:51:163654900: ollama_model_random: 2 models found
gpt-oss:20b
```
