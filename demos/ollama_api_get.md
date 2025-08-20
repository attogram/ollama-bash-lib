# ollama_api_get
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Setup

OLLAMA_HOST: http://localhost:11434

OLLAMA_LIB_API: http://localhost:11434


## Demo


```
ollama_api_get

[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 19:49:35:330564797: ollama_api_get: []
[DEBUG] 19:49:35:335540741: _call_curl: [GET] []
[DEBUG] 19:49:35:340229273: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 19:49:35:344842739: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[DEBUG] 19:49:35:371153050: ollama_api_get: []
[DEBUG] 19:49:35:375685971: _call_curl: [GET] []
[DEBUG] 19:49:35:380208822: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 19:49:35:384742334: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```
