# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gpt-oss:20b
gpt-oss:120b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 21:46:49:952968100: ollama_model_random
[DEBUG] 21:46:49:977640300: ollama_list_array
[DEBUG] 21:46:50:410154000: ollama_list_array: 2 models found: return 0
[DEBUG] 21:46:50:424938400: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 21:46:50:470158600: ollama_model_random
[DEBUG] 21:46:50:488784400: ollama_list_array
[DEBUG] 21:46:50:901159700: ollama_list_array: 2 models found: return 0
[DEBUG] 21:46:50:915409800: ollama_model_random: 2 models found
gpt-oss:120b
```
