# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.24

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

[DEBUG] 00:59:10:259618900: ollama_api_get: []
[DEBUG] 00:59:10:269648300: _call_curl: [GET] [] []
[DEBUG] 00:59:10:279349100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:59:10:289790500: _call_curl: Turbo Mode
[DEBUG] 00:59:10:541271400: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:59:10:597110900: ollama_api_get: [/api/version]
[DEBUG] 00:59:10:607371900: _call_curl: [GET] [/api/version] []
[DEBUG] 00:59:10:618242000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:59:10:635069800: _call_curl: Turbo Mode
[DEBUG] 00:59:10:868331400: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
