# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.19

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

[DEBUG] 22:05:50:676974600: ollama_api_get: []
[DEBUG] 22:05:50:687965300: _call_curl: [GET] [] []
[DEBUG] 22:05:50:698031600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:05:50:708805300: _call_curl: Turbo Mode
[DEBUG] 22:05:51:109349200: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 22:05:51:158322600: ollama_api_get: [/api/version]
[DEBUG] 22:05:51:169513300: _call_curl: [GET] [/api/version] []
[DEBUG] 22:05:51:179914600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:05:51:192398600: _call_curl: Turbo Mode
[DEBUG] 22:05:51:980037300: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
