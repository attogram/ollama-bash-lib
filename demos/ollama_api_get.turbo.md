# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

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

[DEBUG] 21:35:35:867639100: ollama_api_get: []
[DEBUG] 21:35:35:879316800: _call_curl: [GET] [] []
[DEBUG] 21:35:35:889693600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:35:35:901427600: _call_curl: Turbo Mode
[DEBUG] 21:35:36:136350300: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 21:35:36:175970000: ollama_api_get: [/api/version]
[DEBUG] 21:35:36:186062600: _call_curl: [GET] [/api/version] []
[DEBUG] 21:35:36:198294700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:35:36:209952000: _call_curl: Turbo Mode
[DEBUG] 21:35:36:433881400: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
