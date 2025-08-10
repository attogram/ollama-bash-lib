# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.2

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

[DEBUG] 22:15:31:195063200: ollama_api_get: []
[DEBUG] 22:15:31:216908600: _call_curl: [GET] [] []
[DEBUG] 22:15:31:250522900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:15:31:280792400: _call_curl: Turbo Mode
[DEBUG] 22:15:31:564412800: ollama_api_get: success: return 0
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 22:15:31:640981900: ollama_api_get: [/api/version]
[DEBUG] 22:15:31:664792300: _call_curl: [GET] [/api/version] []
[DEBUG] 22:15:31:690259400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:15:31:735731400: _call_curl: Turbo Mode
[DEBUG] 22:15:32:032345900: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
