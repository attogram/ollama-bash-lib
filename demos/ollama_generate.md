# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.25

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, Swift, Curious
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 20:20:29:593052100: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 20:20:29:608599900: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 20:20:29:618530400: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 20:20:29:641126600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:20:29:651707200: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:20:29:661592200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:20:29:671732600: _call_curl: Turbo Mode
[DEBUG] 20:20:29:681614600: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:20:30:516618000: ollama_api_post: success: return 0
[DEBUG] 20:20:30:527444700: ollama_generate_json: success: return: 0
[DEBUG] 20:20:30:565620200: ollama_generate: result: 319 bytes
Soft, playful, curious
[DEBUG] 20:20:30:609783900: ollama_generate: return: 0
```
