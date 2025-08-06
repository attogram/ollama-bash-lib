# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.15

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, quick, cute.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:53:32:230764900: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:53:32:248008400: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:53:32:259370000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:53:32:282924100: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:53:32:294163800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:53:32:304472200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:53:32:315803700: _call_curl: Turbo Mode
[DEBUG] 00:53:32:327020100: _call_curl: adding json body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:53:33:443503400: ollama_api_post: success: return 0
[DEBUG] 00:53:33:455227400: ollama_generate_json: success: return: 0
[DEBUG] 00:53:33:493509100: ollama_generate: result: 380 bytes
Soft, fluffy, playful.
[DEBUG] 00:53:36:296027300: ollama_generate: return: 0
```
