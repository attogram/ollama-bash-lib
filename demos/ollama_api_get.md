# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.30

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

[DEBUG] 23:07:16:168442200: ollama_api_get: []
[DEBUG] 23:07:16:178607200: _call_curl: [GET] [] []
[DEBUG] 23:07:16:189089300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:07:16:200215700: _call_curl: Turbo Mode
[DEBUG] 23:07:16:586760600: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 23:07:16:632218100: ollama_api_get: [/api/version]
[DEBUG] 23:07:16:643421100: _call_curl: [GET] [/api/version] []
[DEBUG] 23:07:16:654000900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:07:16:664427700: _call_curl: Turbo Mode
[DEBUG] 23:07:16:881260900: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
