# ollama_api_get
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

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

[DEBUG] 23:34:35:862833200: ollama_api_get: []
[DEBUG] 23:34:35:884101300: _call_curl: [GET] [] 
[DEBUG] 23:34:35:922164400: _is_valid_json: NO OUTPUT jq: result empty: return 4
[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
result: lines: 1
result: output: 
```

```
ollama_api_get "/api/version"

[DEBUG] 23:34:35:993435000: ollama_api_get: [/api/version]
[DEBUG] 23:34:36:027300600: _call_curl: [GET] [/api/version] 
[DEBUG] 23:34:36:072699500: _is_valid_json: NO OUTPUT jq: result empty: return 4
[ERROR] _call_curl: JSON body is invalid: []
[ERROR] ollama_api_get: curl error: 1
result: lines: 1
result: output: 
```
