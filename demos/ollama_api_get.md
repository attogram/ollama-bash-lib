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

[DEBUG] 23:37:47:028345000: ollama_api_get: []
[DEBUG] 23:37:47:037608000: _call_curl: [GET] [] []
[DEBUG] 23:37:47:045675000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:37:47:052631000: _call_curl: Turbo Mode
[DEBUG] 23:37:47:296067000: ollama_api_get: success: return 0
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 23:37:47:317273000: ollama_api_get: [/api/version]
[DEBUG] 23:37:47:324669000: _call_curl: [GET] [/api/version] []
[DEBUG] 23:37:47:331587000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:37:47:338003000: _call_curl: Turbo Mode
[DEBUG] 23:37:47:562726000: ollama_api_get: success: return 0
result: lines:        1
result: output: {"version":"0.0.0"}
```
