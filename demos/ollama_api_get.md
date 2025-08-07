# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.23

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

[DEBUG] 00:54:59:777333500: ollama_api_get: []
[DEBUG] 00:54:59:786972800: _call_curl: [GET] [] []
[DEBUG] 00:54:59:797859600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:54:59:808837900: _call_curl: Turbo Mode
[DEBUG] 00:55:00:052342700: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:55:00:090757900: ollama_api_get: [/api/version]
[DEBUG] 00:55:00:102207300: _call_curl: [GET] [/api/version] []
[DEBUG] 00:55:00:112761800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:00:124123700: _call_curl: Turbo Mode
[DEBUG] 00:55:00:371923500: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
