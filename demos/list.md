# ollama_list, ollama_list_json
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

```
ollama_list
```
```
NAME            ID              SIZE     MODIFIED    
gpt-oss:120b    d98fe6ba01e6    65 GB    11 days ago    
gpt-oss:20b     05afbac4bad6    13 GB    11 days ago    
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
[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
[ERROR] ollama_list_json: ollama_api_get failed
```
