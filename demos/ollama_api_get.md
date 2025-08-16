# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

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

[DEBUG] 00:17:28:626287500: ollama_api_get: []
[DEBUG] 00:17:28:648023800: _call_curl: [GET] [] 
[DEBUG] 00:17:28:676052200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:17:28:697160800: _call_curl: Turbo Mode
[DEBUG] 00:17:28:722448900: _call_curl: args: -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 00:17:28:976663400: ollama_api_get: success
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:17:29:025037000: ollama_api_get: [/api/version]
[DEBUG] 00:17:29:046701800: _call_curl: [GET] [/api/version] 
[DEBUG] 00:17:29:068865300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:17:29:095751600: _call_curl: Turbo Mode
[DEBUG] 00:17:29:118822300: _call_curl: args: -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 00:17:29:344500500: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.0.0"}
```
