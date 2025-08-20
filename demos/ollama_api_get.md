# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Setup

OLLAMA_HOST: http://localhost:11434

OLLAMA_LIB_API: http://localhost:11434


## Demo


```
ollama_api_get

result: lines: 1
result: output: Ollama is running
```

```
ollama_api_get "/api/version"

result: lines: 1
result: output: Ollama is running
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 22:06:55:914940309: ollama_api_get: []
[DEBUG] 22:06:55:919134205: _call_curl: [GET] []
[DEBUG] 22:06:55:923511634: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:06:55:927764906: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[DEBUG] 22:06:55:949280426: ollama_api_get: success
result: lines: 1
result: output: Ollama is running
```

```
ollama_api_get "/api/version"

[DEBUG] 22:06:55:961476187: ollama_api_get: []
[DEBUG] 22:06:55:965553613: _call_curl: [GET] []
[DEBUG] 22:06:55:969778855: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:06:55:973875014: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[DEBUG] 22:06:55:996307542: ollama_api_get: success
result: lines: 1
result: output: Ollama is running
```
