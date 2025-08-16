# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3

## Setup

OLLAMA_HOST: https://ollama.com

OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_api_get

[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
result: lines: 1
result: output: 
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 23:50:04:944699600: ollama_api_get: []
[DEBUG] 23:50:04:966144100: _call_curl: [GET] [] 
[DEBUG] 23:50:05:014177100: _is_valid_json: NO OUTPUT jq: result empty: return 4
[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[DEBUG] 23:50:05:082949600: ollama_api_get: [/api/version]
[DEBUG] 23:50:05:105437400: _call_curl: [GET] [/api/version] 
[DEBUG] 23:50:05:151031900: _is_valid_json: NO OUTPUT jq: result empty: return 4
[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
result: lines: 1
result: output: 
```
