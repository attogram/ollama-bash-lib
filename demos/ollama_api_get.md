# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

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

[DEBUG] 19:56:03:708919800: ollama_api_get: []
[DEBUG] 19:56:03:745496300: _call_curl: [GET] [] 
[DEBUG] 19:56:03:778170400: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 19:56:03:797803100: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X GET http://localhost:11434
[DEBUG] 19:56:04:092320200: ollama_api_get: success
result: lines: 1
result: output: Ollama is running
```

```
ollama_api_get -P "/api/version"

[DEBUG] 19:56:04:158451900: ollama_api_get: [/api/version]
[DEBUG] 19:56:04:179528200: _call_curl: [GET] [/api/version] 
[DEBUG] 19:56:04:201419000: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 19:56:04:221040400: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X GET http://localhost:11434/api/version
[DEBUG] 19:56:04:492848700: ollama_api_get: success
result: lines: 1
result: output: {"version":"0.11.6"}
```
