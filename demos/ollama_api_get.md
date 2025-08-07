# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

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

[DEBUG] 21:46:23:959873300: ollama_api_get: []
[DEBUG] 21:46:23:969766400: _call_curl: [GET] [] []
[DEBUG] 21:46:23:980116100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:23:991166200: _call_curl: Turbo Mode
[DEBUG] 21:46:24:264740400: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 21:46:24:311259600: ollama_api_get: [/api/version]
[DEBUG] 21:46:24:322052600: _call_curl: [GET] [/api/version] []
[DEBUG] 21:46:24:332827300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:24:343600600: _call_curl: Turbo Mode
[DEBUG] 21:46:24:572957500: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
