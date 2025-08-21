# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11

## Setup

OLLAMA_HOST: https://ollama.com

OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_api_get

result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

result: lines:        1
result: output: {"version":"0.0.0"}
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 15:51:56:452977000: ollama_api_get: []
[DEBUG] 15:51:56:461207000: _call_curl: [GET] [] 
[DEBUG] 15:51:56:468995000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:51:56:475943000: _call_curl: Turbo Mode
[DEBUG] 15:51:56:482237000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 15:51:56:701218000: ollama_api_get: success
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

[DEBUG] 15:51:56:724720000: ollama_api_get: [/api/version]
[DEBUG] 15:51:56:732012000: _call_curl: [GET] [/api/version] 
[DEBUG] 15:51:56:739123000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:51:56:745903000: _call_curl: Turbo Mode
[DEBUG] 15:51:56:752275000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 15:51:56:951016000: ollama_api_get: success
result: lines:        1
result: output: {"version":"0.0.0"}
```
