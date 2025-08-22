# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

## Setup

OLLAMA_HOST: http://localhost:11434

OBL_API: http://localhost:11434


## Demo


```
ollama_api_get

result: lines: 1
result: output: Ollama is running
```

```
ollama_api_get -P "/api/version"

result: lines: 1
result: output: {"version":"0.11.6"}
```

## Demo Debug

`export OBL_DEBUG=1`


```
ollama_api_get

[DEBUG] 22:04:21:653436100: ollama_api_get: []
[DEBUG] 22:04:21:673975400: _call_curl: [GET] [] 
[DEBUG] 22:04:21:694702000: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 22:04:21:724999500: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[DEBUG] 22:04:22:065480800: ollama_api_get: success
result: lines: 1
result: output: Ollama is running
```

```
ollama_api_get -P "/api/version"

[DEBUG] 22:04:22:147835900: ollama_api_get: [/api/version]
[DEBUG] 22:04:22:172888200: _call_curl: [GET] [/api/version] 
[DEBUG] 22:04:22:193744100: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 22:04:22:215228200: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434/api/version
[DEBUG] 22:04:22:577547600: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.11.6"}
```
