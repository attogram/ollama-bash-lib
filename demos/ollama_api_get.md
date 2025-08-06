# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

## Setup

OLLAMA_HOST: 

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
result: output: {"version":"0.11.3"}
```

## Demo Debug

`export OLLAMA_LIB_DEBUG=1`


```
ollama_api_get

[DEBUG] 22:34:05:980600800: ollama_api_get: []
[DEBUG] 22:34:05:991540300: _call_curl: [GET] [] []
[DEBUG] 22:34:06:001765900: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:34:06:259091800: ollama_api_get: success: return 0
result: lines: 1
result: output: Ollama is running
```

```
ollama_api_get "/api/version"

[DEBUG] 22:34:06:293950300: ollama_api_get: [/api/version]
[DEBUG] 22:34:06:305053700: _call_curl: [GET] [/api/version] []
[DEBUG] 22:34:06:315348600: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:34:06:573578100: ollama_api_get: success: return 0
result: lines: 1
result: output: {"version":"0.11.3"}
```
