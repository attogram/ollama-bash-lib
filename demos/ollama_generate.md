# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.34

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Fluffy, Quick, Curious
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:51:00:409831000: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:51:00:425904800: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:51:00:437852000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:51:00:460975700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:51:00:470732900: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:51:00:482715700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:51:00:494784300: _call_curl: Turbo Mode
[DEBUG] 00:51:00:505984900: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:51:01:572600900: ollama_api_post: success: return 0
[DEBUG] 00:51:01:584072100: ollama_generate_json: success: return: 0
[DEBUG] 00:51:01:621944600: ollama_generate: result: 783 bytes
Fluffy, graceful, curious
[DEBUG] 00:51:01:650590900: ollama_generate: return: 0
```
