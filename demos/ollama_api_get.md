# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5

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

[DEBUG] 13:28:44:892913800: ollama_api_get: []
[DEBUG] 13:28:44:916063400: _call_curl: [GET] [] 
[DEBUG] 13:28:44:945880700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:28:44:968101900: _call_curl: Turbo Mode
[DEBUG] 13:28:44:990358000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 13:28:45:332292600: ollama_api_get: success
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 13:28:45:397643600: ollama_api_get: [/api/version]
[DEBUG] 13:28:45:419529600: _call_curl: [GET] [/api/version] 
[DEBUG] 13:28:45:454939400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:28:45:477035200: _call_curl: Turbo Mode
[DEBUG] 13:28:45:498477200: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 13:28:45:777251100: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.0.0"}
```
