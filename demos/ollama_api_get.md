# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

## Demo
```

ollama_api_get "/api/version"

{"version":"0.10.1"}
ollama_api_get "/error/path/not/found"

404 page not found
ollama_api_get " bad string!"

[ERROR] ollama_api_get: error_curl: 3
```

## Demo Debug
```

OLLAMA_LIB_DEBUG=1

ollama_api_get "/api/version"
[DEBUG] ollama_api_get: [/api/version]
{"version":"0.10.1"}[DEBUG] ollama_api_get: return: 0
ollama_api_get returned: 0

ollama_api_get "/error/path/not/found"
[DEBUG] ollama_api_get: [/error/path/not/found]
404 page not found[DEBUG] ollama_api_get: return: 0
ollama_api_get returned: 0

ollama_api_get " bad string!"
[DEBUG] ollama_api_get: [ bad sting! ]
[ERROR] ollama_api_get: error_curl: 3
ollama_api_get returned: 1
```
