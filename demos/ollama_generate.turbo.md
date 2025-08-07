# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
fluffy, curious, hopping
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 21:35:44:287262700: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:35:44:304934500: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 21:35:44:315913400: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 21:35:44:337278800: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:35:44:348799400: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:35:44:360547100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:35:44:371518100: _call_curl: Turbo Mode
[DEBUG] 21:35:44:382135200: _call_curl: adding json body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:35:45:255890000: ollama_api_post: success: return 0
[DEBUG] 21:35:45:267596200: ollama_generate_json: success: return: 0
[DEBUG] 21:35:45:315032500: ollama_generate: result: 359 bytes
[DEBUG] 21:35:45:332103300: _escape_control_characters: Safe Mode OFF
Soft. Agile. Curious.
[DEBUG] 21:35:45:343402100: ollama_generate: return: 0
```
