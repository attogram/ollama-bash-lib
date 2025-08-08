# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.34

## Setup

OLLAMA_HOST: https://ollama.com

OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_api_get

result: lines: 392
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

[DEBUG] 00:50:52:578406400: ollama_api_get: []
[DEBUG] 00:50:52:589762000: _call_curl: [GET] [] []
[DEBUG] 00:50:52:602000400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:50:52:613359500: _call_curl: Turbo Mode
[DEBUG] 00:50:52:993527200: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:50:53:047016700: ollama_api_get: [/api/version]
[DEBUG] 00:50:53:060629800: _call_curl: [GET] [/api/version] []
[DEBUG] 00:50:53:073739800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:50:53:084731300: _call_curl: Turbo Mode
[DEBUG] 00:50:53:311486000: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
