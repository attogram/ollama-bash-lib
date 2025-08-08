# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.25

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

[DEBUG] 20:20:20:204287300: ollama_api_get: []
[DEBUG] 20:20:20:219994800: _call_curl: [GET] [] []
[DEBUG] 20:20:20:230932200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:20:20:241243400: _call_curl: Turbo Mode
[DEBUG] 20:20:20:571397700: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 20:20:20:607505600: ollama_api_get: [/api/version]
[DEBUG] 20:20:20:617997700: _call_curl: [GET] [/api/version] []
[DEBUG] 20:20:20:629251200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:20:20:640413300: _call_curl: Turbo Mode
[DEBUG] 20:20:20:880345800: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
