# ollama_model_random
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.27

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
gpt-oss:20b
gpt-oss:20b
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 22:40:40:334547500: ollama_model_random
[DEBUG] 22:40:40:350991100: ollama_list_array
[DEBUG] 22:40:40:719570800: ollama_list_array: 2 models found: return 0
[DEBUG] 22:40:40:730737400: ollama_model_random: 2 models found
gpt-oss:120b
[DEBUG] 22:40:40:747559500: ollama_model_random
[DEBUG] 22:40:40:763895900: ollama_list_array
[DEBUG] 22:40:41:136986000: ollama_list_array: 2 models found: return 0
[DEBUG] 22:40:41:149794900: ollama_model_random: 2 models found
gpt-oss:20b
```
