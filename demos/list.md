# ollama_list, ollama_list_json
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.9

```
ollama_list
```
```
NAME            ID              SIZE     MODIFIED     
gpt-oss:120b    d98fe6ba01e6    65 GB    21 hours ago    
gpt-oss:20b     05afbac4bad6    13 GB    21 hours ago    
```

```
ollama_list_array
```
```
gpt-oss:120b gpt-oss:20b
```

```
ollama_list_json | jq '.'
```
```json
```
