# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.32

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

[DEBUG] 23:33:51:037132100: ollama_api_get: []
[DEBUG] 23:33:51:051032000: _call_curl: [GET] [] []
[DEBUG] 23:33:51:064073900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:33:51:076900000: _call_curl: Turbo Mode
[DEBUG] 23:33:51:314275000: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 23:33:51:358504600: ollama_api_get: [/api/version]
[DEBUG] 23:33:51:369746900: _call_curl: [GET] [/api/version] []
[DEBUG] 23:33:51:380759600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:33:51:392513200: _call_curl: Turbo Mode
[DEBUG] 23:33:51:629334500: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
