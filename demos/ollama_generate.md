# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.30

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Fluffy, gentle, hopping
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:07:25:029310200: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:07:25:046841300: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:07:25:058422600: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:07:25:081785200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:07:25:093921000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:07:25:106294400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:07:25:118347300: _call_curl: Turbo Mode
[DEBUG] 23:07:25:128676600: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:07:26:414442900: ollama_api_post: success: return 0
[DEBUG] 23:07:26:426040600: ollama_generate_json: success: return: 0
[DEBUG] 23:07:26:477184700: ollama_generate: result: 579 bytes
soft, swift, curious
[DEBUG] 23:07:26:507503000: ollama_generate: return: 0
```
