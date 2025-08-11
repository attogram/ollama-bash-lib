# ollama_model_random
ERROR: Ollama Not Installed
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

## Demo

```bash
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found
./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_model_random
model="$(ollama_model_random)"; echo "$model"
```
```
[DEBUG] 20:11:33:844968050: ollama_model_random
[DEBUG] 20:11:33:850506009: ollama_list_array
./../ollama_bash_lib.sh: line 607: ollama: command not found
[DEBUG] 20:11:33:861273680: ollama_list_array: 0 models found: return 0
[DEBUG] 20:11:33:867146314: ollama_model_random: 0 models found
[ERROR] ollama_model_random: No Models Found
[DEBUG] 20:11:33:873828838: ollama_model_random
[DEBUG] 20:11:33:879574643: ollama_list_array
./../ollama_bash_lib.sh: line 607: ollama: command not found
[DEBUG] 20:11:33:890356395: ollama_list_array: 0 models found: return 0
[DEBUG] 20:11:33:902377358: ollama_model_random: 0 models found
[ERROR] ollama_model_random: No Models Found

```
