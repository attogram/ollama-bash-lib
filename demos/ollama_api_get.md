# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2

## Setup

OLLAMA_HOST: https://ollama.com

OBL_API: https://ollama.com


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

`export OBL_DEBUG=1`


```
ollama_api_get

[DEBUG] 11:30:08:990676000: ollama_api_get: []
[DEBUG] 11:30:08:998837000: _call_curl: [GET] [] 
[DEBUG] 11:30:09:007027000: _call_curl: OBL_API: https://ollama.com
[DEBUG] 11:30:09:013816000: _call_curl: Turbo Mode
[DEBUG] 11:30:09:020283000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 11:30:09:258026000: ollama_api_get: success
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get -P "/api/version"

[DEBUG] 11:30:09:283755000: ollama_api_get: [/api/version]
[DEBUG] 11:30:09:291710000: _call_curl: [GET] [/api/version] 
[DEBUG] 11:30:09:298474000: _call_curl: OBL_API: https://ollama.com
[DEBUG] 11:30:09:304760000: _call_curl: Turbo Mode
[DEBUG] 11:30:09:310500000: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 11:30:09:531598000: ollama_api_get: success
result: lines:        1
result: output: {"version":"0.0.0"}
```
