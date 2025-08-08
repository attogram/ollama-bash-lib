# ollama_api_get
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.26

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

[DEBUG] 22:26:13:474894300: ollama_api_get: []
[DEBUG] 22:26:13:485685900: _call_curl: [GET] [] []
[DEBUG] 22:26:13:496839800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:26:13:507250200: _call_curl: Turbo Mode
[DEBUG] 22:26:13:765433100: ollama_api_get: success: return 0
result: lines: 392
result: output: 






<!doctype html>
<html class="h-full
```

```
ollama_api_get "/api/version"

[DEBUG] 22:26:13:810876200: ollama_api_get: [/api/version]
[DEBUG] 22:26:13:822884100: _call_curl: [GET] [/api/version] []
[DEBUG] 22:26:13:836108600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:26:13:847668600: _call_curl: Turbo Mode
[DEBUG] 22:26:14:055494900: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.0.0"}
```
