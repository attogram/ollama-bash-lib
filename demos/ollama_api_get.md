# ollama_api_get
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

## Setup

OLLAMA_HOST:

OBL_API: http://localhost:11434


## Demo


```
ollama_api_get

[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```

```
ollama_api_get -P "/api/version"

[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```

## Demo Debug

`export OBL_DEBUG=1`


```
ollama_api_get

[DEBUG] 08:56:32:132169642: ollama_api_get: []
[DEBUG] 08:56:32:136351987: _call_curl: [GET] []
[DEBUG] 08:56:32:140557638: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 08:56:32:145635787: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```

```
ollama_api_get -P "/api/version"

[DEBUG] 08:56:32:170477904: ollama_api_get: [/api/version]
[DEBUG] 08:56:32:174525069: _call_curl: [GET] [/api/version]
[DEBUG] 08:56:32:178898298: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 08:56:32:183166557: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434/api/version
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
result: lines: 1
result: output:
```
