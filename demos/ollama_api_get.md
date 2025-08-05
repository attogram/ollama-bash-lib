# ollama_api_get

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

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
[DEBUG] 13:21:36:097215000: ollama_api_get: [/api/version]
{"version":"0.10.1"}[DEBUG] 13:21:36:109917000: ollama_api_get: return: 0
ollama_api_get returned: 0

ollama_api_get "/error/path/not/found"
[DEBUG] 13:21:36:113278000: ollama_api_get: [/error/path/not/found]
404 page not found[DEBUG] 13:21:36:125381000: ollama_api_get: return: 0
ollama_api_get returned: 0

ollama_api_get " bad string!"
[DEBUG] 13:21:36:128566000: ollama_api_get: [ bad sting! ]
[ERROR] ollama_api_get: error_curl: 3
ollama_api_get returned: 1
```
