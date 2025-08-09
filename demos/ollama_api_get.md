# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.40

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

[DEBUG] 23:01:37:654423800: ollama_api_get: []
[DEBUG] 23:01:37:670627800: _call_curl: [GET] [] []
[DEBUG] 23:01:37:681682600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:01:37:692273300: _call_curl: Turbo Mode
[DEBUG] 23:01:37:931195400: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 23:01:37:981314900: ollama_api_get: [/api/version]
[DEBUG] 23:01:37:991875800: _call_curl: [GET] [/api/version] []
[DEBUG] 23:01:38:002092400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:01:38:012670300: _call_curl: Turbo Mode
[DEBUG] 23:01:38:250213500: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
