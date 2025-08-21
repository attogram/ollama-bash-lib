# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.9

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

[DEBUG] 11:55:01:409480000: ollama_api_get: []
[DEBUG] 11:55:01:414775000: _call_curl: [GET] [] 
[DEBUG] 11:55:01:419964000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:55:01:424745000: _call_curl: Turbo Mode
[DEBUG] 11:55:01:429227000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 11:55:01:627673000: ollama_api_get: success
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

[DEBUG] 11:55:01:645622000: ollama_api_get: [/api/version]
[DEBUG] 11:55:01:652041000: _call_curl: [GET] [/api/version] 
[DEBUG] 11:55:01:657541000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:55:01:662766000: _call_curl: Turbo Mode
[DEBUG] 11:55:01:668977000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 11:55:01:841990000: ollama_api_get: success
result: lines:        1
result: output: {"version":"0.0.0"}
```
