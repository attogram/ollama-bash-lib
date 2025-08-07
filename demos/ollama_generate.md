# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.19

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, hoppy.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:06:00:081354800: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:06:00:100238300: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:06:00:112787600: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:06:00:136952700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:06:00:148157800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:06:00:158977100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:06:00:170114200: _call_curl: Turbo Mode
[DEBUG] 22:06:00:181851200: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:06:01:343478300: ollama_api_post: success: return 0
[DEBUG] 22:06:01:355425700: ollama_generate_json: success: return: 0
[DEBUG] 22:06:01:414584000: ollama_generate: result: 375 bytes
Fluffy, swift, curious.
[DEBUG] 22:06:01:444620300: ollama_generate: return: 0
```
