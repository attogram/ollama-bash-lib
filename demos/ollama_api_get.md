# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.8

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

[DEBUG] 23:22:44:386336000: ollama_api_get: []
[DEBUG] 23:22:44:394586000: _call_curl: [GET] [] []
[DEBUG] 23:22:44:401649000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:22:44:409199000: _call_curl: Turbo Mode
[DEBUG] 23:22:44:642232000: ollama_api_get: success: return 0
result: lines:      394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 23:22:44:663378000: ollama_api_get: [/api/version]
[DEBUG] 23:22:44:671715000: _call_curl: [GET] [/api/version] []
[DEBUG] 23:22:44:678868000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:22:44:685621000: _call_curl: Turbo Mode
[DEBUG] 23:22:44:952163000: ollama_api_get: success: return 0
result: lines:        1
result: output: {"version":"0.0.0"}
```
