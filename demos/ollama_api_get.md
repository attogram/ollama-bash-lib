# ollama_api_get
[ERROR] ollama_api_ping: unknown result: []
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo
```

ollama_api_get "/api/version"


ollama_api_get "/error/path/not/found"


ollama_api_get " bad string!"

[ERROR] ollama_api_get: error_curl: 3
```

## Demo Debug
```

OLLAMA_LIB_DEBUG=1

ollama_api_get "/api/version"
[DEBUG] 23:18:38:359293000: ollama_api_get: [/api/version]
[DEBUG] 23:18:38:451872900: ollama_api_get: return: 0
ollama_api_get returned: 0

ollama_api_get "/error/path/not/found"
[DEBUG] 23:18:38:463145100: ollama_api_get: [/error/path/not/found]
[DEBUG] 23:18:38:757464400: ollama_api_get: return: 0
ollama_api_get returned: 0

ollama_api_get " bad string!"
[DEBUG] 23:18:38:767410700: ollama_api_get: [ bad sting! ]
[ERROR] ollama_api_get: error_curl: 3
ollama_api_get returned: 3
```
