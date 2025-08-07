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

[DEBUG] 21:46:09:899776900: ollama_api_get: []
[DEBUG] 21:46:09:909633700: _call_curl: [GET] [] []
[DEBUG] 21:46:09:919462900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:09:930363100: _call_curl: Turbo Mode
[DEBUG] 21:46:10:200084000: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 21:46:10:249917200: ollama_api_get: [/api/version]
[DEBUG] 21:46:10:260462700: _call_curl: [GET] [/api/version] []
[DEBUG] 21:46:10:270195000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:10:281683700: _call_curl: Turbo Mode
[DEBUG] 21:46:10:500928400: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
