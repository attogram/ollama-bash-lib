# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Setup

OLLAMA_HOST: 

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

[DEBUG] 15:32:00:608428500: ollama_api_get: []
[DEBUG] 15:32:00:631006800: _call_curl: [GET] [] 
[DEBUG] 15:32:00:652850600: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 15:32:00:674555600: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X GET http://localhost:11434
[DEBUG] 15:32:00:958313500: ollama_api_get: success
result: lines: 1
result: output: Ollama is running
```

```
ollama_api_get -P "/api/version"

[DEBUG] 15:32:01:044775400: ollama_api_get: [/api/version]
[DEBUG] 15:32:01:066980800: _call_curl: [GET] [/api/version] 
[DEBUG] 15:32:01:101754900: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 15:32:01:123782300: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X GET http://localhost:11434/api/version
[DEBUG] 15:32:01:424351200: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.11.6"}
```
