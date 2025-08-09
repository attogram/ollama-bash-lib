# ollama_model_random

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.44

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
[DEBUG] 00:56:09:217133800: ollama_model_random
[DEBUG] 00:56:09:251995300: ollama_list_array
[DEBUG] 00:56:09:636147000: ollama_list_array: 2 models found: return 0
[DEBUG] 00:56:09:653683700: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 00:56:09:677096900: ollama_model_random
[DEBUG] 00:56:09:701109100: ollama_list_array
[DEBUG] 00:56:10:114726800: ollama_list_array: 2 models found: return 0
[DEBUG] 00:56:10:132989900: ollama_model_random: 2 models found
gpt-oss:20b
```
