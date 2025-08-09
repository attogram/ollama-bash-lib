# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.44

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

[DEBUG] 00:55:30:948630000: ollama_api_get: []
[DEBUG] 00:55:30:965767300: _call_curl: [GET] [] []
[DEBUG] 00:55:30:981951000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:30:998422200: _call_curl: Turbo Mode
[DEBUG] 00:55:31:242842100: ollama_api_get: success: return 0
result: lines: 394
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:55:31:286858500: ollama_api_get: [/api/version]
[DEBUG] 00:55:31:304818800: _call_curl: [GET] [/api/version] []
[DEBUG] 00:55:31:321896000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:31:346346100: _call_curl: Turbo Mode
[DEBUG] 00:55:31:601116200: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
