# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.43

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

[DEBUG] 00:18:19:587119300: ollama_api_get: []
[DEBUG] 00:18:19:605332100: _call_curl: [GET] [] []
[DEBUG] 00:18:19:623929300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:18:19:642008700: _call_curl: Turbo Mode
[DEBUG] 00:18:19:903204600: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 00:18:19:963112700: ollama_api_get: [/api/version]
[DEBUG] 00:18:19:987716100: _call_curl: [GET] [/api/version] []
[DEBUG] 00:18:20:004300300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:18:20:022101700: _call_curl: Turbo Mode
[DEBUG] 00:18:20:378177000: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
