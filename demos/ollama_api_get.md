# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.20

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

[DEBUG] 00:09:14:089596700: ollama_api_get: []
[DEBUG] 00:09:14:099922400: _call_curl: [GET] [] []
[DEBUG] 00:09:14:110589400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:09:14:121076700: _call_curl: Turbo Mode
[DEBUG] 00:09:14:382935100: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:09:14:428986500: ollama_api_get: [/api/version]
[DEBUG] 00:09:14:439662700: _call_curl: [GET] [/api/version] []
[DEBUG] 00:09:14:450862400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:09:14:462697300: _call_curl: Turbo Mode
[DEBUG] 00:09:14:702127300: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
