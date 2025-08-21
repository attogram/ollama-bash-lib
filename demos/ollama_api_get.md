# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.8

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

[DEBUG] 11:36:21:146034000: ollama_api_get: []
[DEBUG] 11:36:21:153820000: _call_curl: [GET] [] 
[DEBUG] 11:36:21:161509000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:36:21:168242000: _call_curl: Turbo Mode
[DEBUG] 11:36:21:174913000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 11:36:21:385896000: ollama_api_get: success
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

[DEBUG] 11:36:21:407847000: ollama_api_get: [/api/version]
[DEBUG] 11:36:21:414728000: _call_curl: [GET] [/api/version] 
[DEBUG] 11:36:21:421749000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:36:21:428110000: _call_curl: Turbo Mode
[DEBUG] 11:36:21:434236000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 11:36:21:629869000: ollama_api_get: success
result: lines:        1
result: output: {"version":"0.0.0"}
```
