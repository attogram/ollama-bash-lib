# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.38

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

[DEBUG] 20:22:15:923515300: ollama_api_get: []
[DEBUG] 20:22:15:933957600: _call_curl: [GET] [] []
[DEBUG] 20:22:15:944912000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:22:15:955572400: _call_curl: Turbo Mode
[DEBUG] 20:22:16:240876600: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 20:22:16:280408700: ollama_api_get: [/api/version]
[DEBUG] 20:22:16:300673500: _call_curl: [GET] [/api/version] []
[DEBUG] 20:22:16:310593200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:22:16:321596000: _call_curl: Turbo Mode
[DEBUG] 20:22:16:529226300: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
