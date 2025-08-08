# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.29

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

[DEBUG] 22:52:46:574113900: ollama_api_get: []
[DEBUG] 22:52:46:584816100: _call_curl: [GET] [] []
[DEBUG] 22:52:46:595184800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:52:46:605616900: _call_curl: Turbo Mode
[DEBUG] 22:52:46:860414000: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 22:52:46:911632800: ollama_api_get: [/api/version]
[DEBUG] 22:52:46:925117900: _call_curl: [GET] [/api/version] []
[DEBUG] 22:52:46:937087200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:52:46:952830500: _call_curl: Turbo Mode
[DEBUG] 22:52:47:190927200: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
