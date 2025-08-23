# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

## Setup

OLLAMA_HOST: https://ollama.com

OBL_API: https://ollama.com


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

`export OBL_DEBUG=1`


```
ollama_api_get

[DEBUG] 13:02:05:042897900: ollama_api_get: []
[DEBUG] 13:02:05:066719300: _call_curl: [GET] [] 
[DEBUG] 13:02:05:087857200: _call_curl: OBL_API: https://ollama.com
[DEBUG] 13:02:05:109109200: _call_curl: Turbo Mode
[DEBUG] 13:02:05:130558600: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 13:02:05:452490700: ollama_api_get: success
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

[DEBUG] 13:02:05:524705600: ollama_api_get: [/api/version]
[DEBUG] 13:02:05:561562700: _call_curl: [GET] [/api/version] 
[DEBUG] 13:02:05:593291400: _call_curl: OBL_API: https://ollama.com
[DEBUG] 13:02:05:614194700: _call_curl: Turbo Mode
[DEBUG] 13:02:05:634419700: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 13:02:05:912195000: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.0.0"}
```
