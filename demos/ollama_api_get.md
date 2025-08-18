# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

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

[DEBUG] 23:08:47:824206700: ollama_api_get: []
[DEBUG] 23:08:47:847112500: _call_curl: [GET] [] 
[DEBUG] 23:08:47:869120500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:08:47:894303500: _call_curl: Turbo Mode
[DEBUG] 23:08:47:914616100: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com
[DEBUG] 23:08:48:232587000: ollama_api_get: success
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 23:08:48:305090600: ollama_api_get: [/api/version]
[DEBUG] 23:08:48:326300000: _call_curl: [GET] [/api/version] 
[DEBUG] 23:08:48:350351400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:08:48:373124600: _call_curl: Turbo Mode
[DEBUG] 23:08:48:394813800: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X GET https://ollama.com/api/version
[DEBUG] 23:08:48:676098100: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.0.0"}
```
