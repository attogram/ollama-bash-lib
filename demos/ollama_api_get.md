# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.35

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

[DEBUG] 13:10:30:960994400: ollama_api_get: []
[DEBUG] 13:10:30:972203500: _call_curl: [GET] [] []
[DEBUG] 13:10:30:982361600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:10:30:992526300: _call_curl: Turbo Mode
[DEBUG] 13:10:31:241667500: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 13:10:31:284492800: ollama_api_get: [/api/version]
[DEBUG] 13:10:31:295438400: _call_curl: [GET] [/api/version] []
[DEBUG] 13:10:31:305009200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:10:31:316302900: _call_curl: Turbo Mode
[DEBUG] 13:10:31:548862400: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
