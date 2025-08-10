# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.0

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

[DEBUG] 19:44:02:504525400: ollama_api_get: []
[DEBUG] 19:44:02:525167900: _call_curl: [GET] [] []
[DEBUG] 19:44:02:545681200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 19:44:02:565491400: _call_curl: Turbo Mode
[DEBUG] 19:44:02:846967800: ollama_api_get: success: return 0
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 19:44:02:905540200: ollama_api_get: [/api/version]
[DEBUG] 19:44:02:928240400: _call_curl: [GET] [/api/version] []
[DEBUG] 19:44:02:956655900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 19:44:02:983233600: _call_curl: Turbo Mode
[DEBUG] 19:44:03:213045300: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
