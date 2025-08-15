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

[DEBUG] 00:54:21:567626000: ollama_api_get: []
[DEBUG] 00:54:21:575618000: _call_curl: [GET] [] []
[DEBUG] 00:54:21:582925000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:54:21:589965000: _call_curl: Turbo Mode
[DEBUG] 00:54:21:855138000: ollama_api_get: success: return 0
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:54:21:875563000: ollama_api_get: [/api/version]
[DEBUG] 00:54:21:883327000: _call_curl: [GET] [/api/version] []
[DEBUG] 00:54:21:890421000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:54:21:897354000: _call_curl: Turbo Mode
[DEBUG] 00:54:22:115358000: ollama_api_get: success: return 0
result: lines:        1
result: output: {"version":"0.0.0"}
```
