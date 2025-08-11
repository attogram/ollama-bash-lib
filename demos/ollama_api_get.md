# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.6

## Setup

OLLAMA_HOST: https://ollama.com

OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_api_get

result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

result: lines:        1
result: output: {"version":"0.0.0"}
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 22:54:35:423133000: ollama_api_get: []
[DEBUG] 22:54:35:431949000: _call_curl: [GET] [] []
[DEBUG] 22:54:35:439601000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:54:35:446706000: _call_curl: Turbo Mode
[DEBUG] 22:54:35:708761000: ollama_api_get: success: return 0
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 22:54:35:728767000: ollama_api_get: [/api/version]
[DEBUG] 22:54:35:736913000: _call_curl: [GET] [/api/version] []
[DEBUG] 22:54:35:744406000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:54:35:751313000: _call_curl: Turbo Mode
[DEBUG] 22:54:35:962298000: ollama_api_get: success: return 0
result: lines:        1
result: output: {"version":"0.0.0"}
```
