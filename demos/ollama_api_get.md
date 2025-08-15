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

[DEBUG] 01:51:19:002875000: ollama_api_get: []
[DEBUG] 01:51:19:012405000: _call_curl: [GET] [] []
[DEBUG] 01:51:19:020814000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:51:19:029459000: _call_curl: Turbo Mode
[DEBUG] 01:51:19:287187000: ollama_api_get: success: return 0
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 01:51:19:309964000: ollama_api_get: [/api/version]
[DEBUG] 01:51:19:321344000: _call_curl: [GET] [/api/version] []
[DEBUG] 01:51:19:331082000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:51:19:340690000: _call_curl: Turbo Mode
[DEBUG] 01:51:19:562180000: ollama_api_get: success: return 0
result: lines:        1
result: output: {"version":"0.0.0"}
```
