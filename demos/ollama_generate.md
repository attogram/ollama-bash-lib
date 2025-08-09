# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.35

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Soft, twitchy, hoppy.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 13:10:43:387042200: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:10:43:402355100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:10:43:413666700: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 13:10:43:439475300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 13:10:43:451944100: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 13:10:43:465853700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:10:43:479561000: _call_curl: Turbo Mode
[DEBUG] 13:10:43:494042300: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 13:10:44:568950600: ollama_api_post: success: return 0
[DEBUG] 13:10:44:579162900: ollama_generate_json: success: return: 0
[DEBUG] 13:10:44:614644400: ollama_generate: result: 402 bytes
Fluffy, swift, gentle.
[DEBUG] 13:10:44:666825100: ollama_generate: success: return: 0
```
