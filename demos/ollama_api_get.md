# ollama_api_get
ERROR: Ollama Not Installed
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

## Setup

OLLAMA_HOST:

OLLAMA_LIB_API: http://localhost:11434


## Demo


```
ollama_api_get

[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 20:11:32:885682910: ollama_api_get: []
[DEBUG] 20:11:32:890985054: _call_curl: [GET] [] []
[DEBUG] 20:11:32:896676799: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[DEBUG] 20:11:32:928847795: ollama_api_get: [/api/version]
[DEBUG] 20:11:32:934148417: _call_curl: [GET] [/api/version] []
[DEBUG] 20:11:32:939457977: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```
