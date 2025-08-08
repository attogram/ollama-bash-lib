# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.29

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
Fluffy, timid, hopping.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:52:54:761539800: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:52:54:779042000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:52:54:791073400: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:52:54:813589700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:52:54:824315700: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:52:54:834786400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:52:54:845600200: _call_curl: Turbo Mode
[DEBUG] 22:52:54:856971800: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:52:55:779009100: ollama_api_post: success: return 0
[DEBUG] 22:52:55:792489000: ollama_generate_json: success: return: 0
[DEBUG] 22:52:55:829606900: ollama_generate: result: 350 bytes
Fluffy, swift, curious.
[DEBUG] 22:52:55:872081200: ollama_generate: return: 0
```
