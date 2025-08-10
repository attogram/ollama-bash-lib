# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

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

[DEBUG] 00:37:18:486097600: ollama_api_get: []
[DEBUG] 00:37:18:508414400: _call_curl: [GET] [] []
[DEBUG] 00:37:18:538254300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:37:18:570525900: _call_curl: Turbo Mode
[DEBUG] 00:37:18:823299800: ollama_api_get: success: return 0
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:37:18:886762600: ollama_api_get: [/api/version]
[DEBUG] 00:37:18:914062700: _call_curl: [GET] [/api/version] []
[DEBUG] 00:37:18:938349000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:37:18:963013700: _call_curl: Turbo Mode
[DEBUG] 00:37:19:206180900: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
