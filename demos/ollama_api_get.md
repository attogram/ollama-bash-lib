# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.1

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

[DEBUG] 21:40:02:617852900: ollama_api_get: []
[DEBUG] 21:40:02:638838400: _call_curl: [GET] [] []
[DEBUG] 21:40:02:660068000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:40:02:680874500: _call_curl: Turbo Mode
[DEBUG] 21:40:02:922706800: ollama_api_get: success: return 0
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 21:40:02:973556700: ollama_api_get: [/api/version]
[DEBUG] 21:40:02:996471300: _call_curl: [GET] [/api/version] []
[DEBUG] 21:40:03:029073400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:40:03:051840400: _call_curl: Turbo Mode
[DEBUG] 21:40:03:268357700: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
