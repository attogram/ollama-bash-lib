# ollama_model_random
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.9

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
[DEBUG] 23:27:24:425330300: ollama_model_random
[DEBUG] 23:27:24:441462100: ollama_list_array
[DEBUG] 23:27:24:873891300: ollama_list_array: 2 models found: return 0
[DEBUG] 23:27:24:887894400: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 23:27:24:925202500: ollama_model_random
[DEBUG] 23:27:24:942521000: ollama_list_array
[DEBUG] 23:27:25:351731900: ollama_list_array: 2 models found: return 0
[DEBUG] 23:27:25:364097200: ollama_model_random: 2 models found
gpt-oss:20b
```
