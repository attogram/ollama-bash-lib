# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo
```

ollama_api_get "/api/version"

{"version":"0.11.0"}
ollama_api_get "/error/path/not/found"

404 page not found
ollama_api_get " bad string!"

[ERROR] ollama_api_get: error_curl: 3
```

## Demo Debug
```

OLLAMA_LIB_DEBUG=1

ollama_api_get "/api/version"
[DEBUG] 21:00:29:830892600: ollama_api_get: [/api/version]
{"version":"0.11.0"}[DEBUG] 21:00:30:096890200: ollama_api_get: return: 0
ollama_api_get returned: 0

ollama_api_get "/error/path/not/found"
[DEBUG] 21:00:30:108065600: ollama_api_get: [/error/path/not/found]
404 page not found[DEBUG] 21:00:30:361037400: ollama_api_get: return: 0
ollama_api_get returned: 0

ollama_api_get " bad string!"
[DEBUG] 21:00:30:372103200: ollama_api_get: [ bad sting! ]
[ERROR] ollama_api_get: error_curl: 3
ollama_api_get returned: 3
```
