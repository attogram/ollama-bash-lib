# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

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

[DEBUG] 01:23:31:433536000: ollama_api_get: []
[DEBUG] 01:23:31:443160000: _call_curl: [GET] [] []
[DEBUG] 01:23:31:450584000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:23:31:458809000: _call_curl: Turbo Mode
[DEBUG] 01:23:31:751738000: ollama_api_get: success: return 0
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 01:23:31:772848000: ollama_api_get: [/api/version]
[DEBUG] 01:23:31:780937000: _call_curl: [GET] [/api/version] []
[DEBUG] 01:23:31:788044000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:23:31:795138000: _call_curl: Turbo Mode
[DEBUG] 01:23:32:016243000: ollama_api_get: success: return 0
result: lines:        1
result: output: {"version":"0.0.0"}
```
