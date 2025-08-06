# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

## Demo
```

ollama_api_get "/api/version"

{"version":"0.11.3"}
ollama_api_get "/error/path/not/found"

404 page not found
ollama_api_get " bad string!"

Ollama is running[ERROR] ollama_api_get: curl error: 3
```

## Demo Debug
```

OLLAMA_LIB_DEBUG=1

ollama_api_get "/api/version"
[DEBUG] 14:10:25:714093000: ollama_api_get: [/api/version]
[DEBUG] 14:10:25:717888000: _call_curl: [GET] [/api/version] []
[DEBUG] 14:10:25:721307000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
{"version":"0.11.3"}[DEBUG] 14:10:25:734369000: ollama_api_get: success: return 0
ollama_api_get returned: 0

ollama_api_get "/error/path/not/found"
[DEBUG] 14:10:25:737912000: ollama_api_get: [/error/path/not/found]
[DEBUG] 14:10:25:741377000: _call_curl: [GET] [/error/path/not/found] []
[DEBUG] 14:10:25:744962000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
404 page not found[DEBUG] 14:10:25:756973000: ollama_api_get: success: return 0
ollama_api_get returned: 0

ollama_api_get " bad string!"
[DEBUG] 14:10:25:760415000: ollama_api_get: [ bad sting! ]
[DEBUG] 14:10:25:763740000: _call_curl: [GET] [ bad sting! ] []
[DEBUG] 14:10:25:767123000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
Ollama is running[ERROR] ollama_api_get: curl error: 3
ollama_api_get returned: 3
```
