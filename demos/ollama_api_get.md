# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.39

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

[DEBUG] 22:15:41:212843000: ollama_api_get: []
[DEBUG] 22:15:41:228408800: _call_curl: [GET] [] []
[DEBUG] 22:15:41:239519300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:15:41:249485600: _call_curl: Turbo Mode
[DEBUG] 22:15:41:487633000: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 22:15:41:525774500: ollama_api_get: [/api/version]
[DEBUG] 22:15:41:536127800: _call_curl: [GET] [/api/version] []
[DEBUG] 22:15:41:546190300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:15:41:558403000: _call_curl: Turbo Mode
[DEBUG] 22:15:41:897227300: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
