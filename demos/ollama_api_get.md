# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.5

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

[DEBUG] 22:37:46:714606000: ollama_api_get: []
[DEBUG] 22:37:46:722997000: _call_curl: [GET] [] []
[DEBUG] 22:37:46:730023000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:37:46:737445000: _call_curl: Turbo Mode
[DEBUG] 22:37:46:991983000: ollama_api_get: success: return 0
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 22:37:47:013429000: ollama_api_get: [/api/version]
[DEBUG] 22:37:47:021818000: _call_curl: [GET] [/api/version] []
[DEBUG] 22:37:47:029220000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:37:47:036469000: _call_curl: Turbo Mode
[DEBUG] 22:37:47:281685000: ollama_api_get: success: return 0
result: lines:        1
result: output: {"version":"0.0.0"}
```
