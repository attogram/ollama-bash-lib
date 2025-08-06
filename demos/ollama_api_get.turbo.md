# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.15

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

[DEBUG] 00:52:35:249926300: ollama_api_get: []
[DEBUG] 00:52:35:262084600: _call_curl: [GET] [] []
[DEBUG] 00:52:35:273002900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:52:35:285124400: _call_curl: Turbo Mode
[DEBUG] 00:52:35:532635700: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:52:35:576835000: ollama_api_get: [/api/version]
[DEBUG] 00:52:35:588521400: _call_curl: [GET] [/api/version] []
[DEBUG] 00:52:35:600046700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:52:35:610658600: _call_curl: Turbo Mode
[DEBUG] 00:52:35:812610300: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
