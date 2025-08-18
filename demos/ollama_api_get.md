# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3

## Setup

OLLAMA_HOST: https://ollama.com

OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_api_get

result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

result: lines: 1
result: output: {"version":"0.0.0"}
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 22:55:45:164316000: ollama_api_get: []
[DEBUG] 22:55:45:195509400: _call_curl: [GET] [] 
[DEBUG] 22:55:45:229228200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:55:45:251170600: _call_curl: Turbo Mode
[DEBUG] 22:55:45:275213100: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 22:55:45:605732800: ollama_api_get: success
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 22:55:45:683892600: ollama_api_get: [/api/version]
[DEBUG] 22:55:45:707385600: _call_curl: [GET] [/api/version] 
[DEBUG] 22:55:45:730168600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:55:45:754885200: _call_curl: Turbo Mode
[DEBUG] 22:55:45:785791400: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 22:55:46:090944500: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.0.0"}
```
