# ollama_api_get
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1

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

[DEBUG] 22:33:24:616408200: ollama_api_get: []
[DEBUG] 22:33:24:638379500: _call_curl: [GET] [] 
[DEBUG] 22:33:24:689377500: _is_valid_json: NO OUTPUT jq: result empty: return 4
[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[DEBUG] 22:33:24:767945200: ollama_api_get: [/api/version]
[DEBUG] 22:33:24:789225500: _call_curl: [GET] [/api/version] 
[DEBUG] 22:33:24:830215200: _is_valid_json: NO OUTPUT jq: result empty: return 4
[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
result: lines: 1
result: output: 
```
