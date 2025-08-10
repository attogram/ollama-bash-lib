# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.46

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

[DEBUG] 16:24:19:132633900: ollama_api_get: []
[DEBUG] 16:24:19:159329700: _call_curl: [GET] [] []
[DEBUG] 16:24:19:182142100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 16:24:19:220617000: _call_curl: Turbo Mode
[DEBUG] 16:24:19:616663400: ollama_api_get: success: return 0
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 16:24:19:677629500: ollama_api_get: [/api/version]
[DEBUG] 16:24:19:703897300: _call_curl: [GET] [/api/version] []
[DEBUG] 16:24:19:725758900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 16:24:19:749791000: _call_curl: Turbo Mode
[DEBUG] 16:24:20:223464700: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
