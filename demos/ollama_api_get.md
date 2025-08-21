# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

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

[DEBUG] 15:42:18:678496000: ollama_api_get: []
[DEBUG] 15:42:18:686076000: _call_curl: [GET] [] 
[DEBUG] 15:42:18:693193000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:42:18:699871000: _call_curl: Turbo Mode
[DEBUG] 15:42:18:706233000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 15:42:18:915624000: ollama_api_get: success
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

[DEBUG] 15:42:18:938927000: ollama_api_get: [/api/version]
[DEBUG] 15:42:18:945998000: _call_curl: [GET] [/api/version] 
[DEBUG] 15:42:18:952887000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:42:18:959185000: _call_curl: Turbo Mode
[DEBUG] 15:42:18:965375000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 15:42:19:160717000: ollama_api_get: success
result: lines:        1
result: output: {"version":"0.0.0"}
```
