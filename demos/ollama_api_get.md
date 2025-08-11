# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.7

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

[DEBUG] 23:21:04:135696000: ollama_api_get: []
[DEBUG] 23:21:04:144411000: _call_curl: [GET] [] []
[DEBUG] 23:21:04:151967000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:21:04:159174000: _call_curl: Turbo Mode
[DEBUG] 23:21:04:437100000: ollama_api_get: success: return 0
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 23:21:04:456239000: ollama_api_get: [/api/version]
[DEBUG] 23:21:04:463514000: _call_curl: [GET] [/api/version] []
[DEBUG] 23:21:04:470371000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:21:04:477122000: _call_curl: Turbo Mode
[DEBUG] 23:21:04:727017000: ollama_api_get: success: return 0
result: lines:        1
result: output: {"version":"0.0.0"}
```
