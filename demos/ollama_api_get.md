# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

## Setup

OLLAMA_HOST: https://ollama.com

OBL_API: https://ollama.com


## Demo


```
ollama_api_get

result: lines: 398
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

[DEBUG] 23:51:02:267242550: ollama_api_get: []
[DEBUG] 23:51:02:269809986: _call_curl: [GET] [] 
[DEBUG] 23:51:02:272952736: _call_curl: OBL_API: https://ollama.com
[DEBUG] 23:51:02:275832988: _call_curl: Turbo Mode
[DEBUG] 23:51:02:279132849: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 23:51:02:589451747: ollama_api_get: success
result: lines: 398
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

[DEBUG] 23:51:02:597760723: ollama_api_get: [/api/version]
[DEBUG] 23:51:02:600725985: _call_curl: [GET] [/api/version] 
[DEBUG] 23:51:02:603659755: _call_curl: OBL_API: https://ollama.com
[DEBUG] 23:51:02:606817504: _call_curl: Turbo Mode
[DEBUG] 23:51:02:609498610: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 23:51:02:862486754: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.0.0"}
```
