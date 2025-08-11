# ollama_list, ollama_list_json
ERROR: Ollama Not Installed
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

```
ollama_list
```
```
./../ollama_bash_lib.sh: line 570: ollama: command not found
[ERROR] ollama_list: list=|ollama list failed
```

```
ollama_list_array
```
```
./../ollama_bash_lib.sh: line 607: ollama: command not found

```

```
ollama_list_json | jq '.'
```
```json
[ERROR] ollama_api_get: curl error: 7
[ERROR] ollama_list_json: ollama_api_get failed
```
