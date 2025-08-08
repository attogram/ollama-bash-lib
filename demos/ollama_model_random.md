# ollama_model_random
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.26

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
[DEBUG] 22:26:30:992618700: ollama_model_random
[DEBUG] 22:26:31:007637800: ollama_list_array
[DEBUG] 22:26:31:379393300: ollama_list_array: 2 models found: return 0
[DEBUG] 22:26:31:393804200: ollama_model_random: 2 models found
gpt-oss:20b
[DEBUG] 22:26:31:409674500: ollama_model_random
[DEBUG] 22:26:31:425753500: ollama_list_array
[DEBUG] 22:26:31:796163300: ollama_list_array: 2 models found: return 0
[DEBUG] 22:26:31:809407200: ollama_model_random: 2 models found
gpt-oss:20b
```
