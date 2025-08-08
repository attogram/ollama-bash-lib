# ollama_generate
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.26

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Soft, quick, curious
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:26:21:061421800: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:26:21:076873600: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:26:21:086715000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:26:21:110255100: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:26:21:120437700: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:26:21:131526300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:26:21:142623700: _call_curl: Turbo Mode
[DEBUG] 22:26:21:153947900: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:26:22:177771900: ollama_api_post: success: return 0
[DEBUG] 22:26:22:189324200: ollama_generate_json: success: return: 0
[DEBUG] 22:26:22:239558600: ollama_generate: result: 485 bytes
Fluffy, quick, gentle.
[DEBUG] 22:26:22:269016600: ollama_generate: return: 0
```
