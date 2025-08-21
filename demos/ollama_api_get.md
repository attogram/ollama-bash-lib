# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1

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
ollama_api_get -P "/api/version"

result: lines: 1
result: output: {"version":"0.0.0"}
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 22:43:20:561326400: ollama_api_get: []
[DEBUG] 22:43:20:581277200: _call_curl: [GET] [] 
[DEBUG] 22:43:20:604304900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:43:20:627951500: _call_curl: Turbo Mode
[DEBUG] 22:43:20:648778300: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 22:43:20:956338500: ollama_api_get: success
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

[DEBUG] 22:43:21:021767700: ollama_api_get: [/api/version]
[DEBUG] 22:43:21:046162800: _call_curl: [GET] [/api/version] 
[DEBUG] 22:43:21:079845700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:43:21:101498400: _call_curl: Turbo Mode
[DEBUG] 22:43:21:138557400: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 22:43:21:417890400: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.0.0"}
```
