# ollama_api_get
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

## Setup

OLLAMA_HOST:

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

[DEBUG] 00:19:32:222279026: ollama_api_get: []
[DEBUG] 00:19:32:227192697: _call_curl: [GET] []
[DEBUG] 00:19:32:232290020: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 00:19:32:238209177: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[DEBUG] 00:19:32:267904675: ollama_api_get: [/api/version]
[DEBUG] 00:19:32:272762798: _call_curl: [GET] [/api/version]
[DEBUG] 00:19:32:277579185: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 00:19:32:282325438: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434/api/version
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```
