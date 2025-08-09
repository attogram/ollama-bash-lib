# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.38

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, agile, curious.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 20:22:31:002641100: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 20:22:31:019269300: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 20:22:31:030613500: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 20:22:31:053188800: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:22:31:063682100: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:22:31:073512600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:22:31:084623100: _call_curl: Turbo Mode
[DEBUG] 20:22:31:095257000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:22:32:481775900: ollama_api_post: success: return 0
[DEBUG] 20:22:32:492230900: ollama_generate_json: success: return: 0
[DEBUG] 20:22:32:527662700: ollama_generate: result: 558 bytes
fluffy, swift, curious
[DEBUG] 20:22:32:564453800: ollama_generate: success: return: 0
```
