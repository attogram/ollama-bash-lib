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

[DEBUG] 22:21:27:278104300: ollama_api_get: []
[DEBUG] 22:21:27:306103200: _call_curl: [GET] [] 
[DEBUG] 22:21:27:328663800: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:21:27:350677100: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[DEBUG] 22:21:27:710818300: ollama_api_get: success
result: lines: 1
result: output: Ollama is running
```

```
ollama_api_get "/api/version"

[DEBUG] 22:21:27:781003700: ollama_api_get: []
[DEBUG] 22:21:27:803875500: _call_curl: [GET] [] 
[DEBUG] 22:21:27:825930500: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:21:27:867215900: _call_curl: args: -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X GET http://localhost:11434
[DEBUG] 22:21:28:190240400: ollama_api_get: success
result: lines: 1
result: output: Ollama is running
```
