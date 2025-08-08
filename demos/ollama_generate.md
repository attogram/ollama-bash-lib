# ollama_generate
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.27

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
Fluffy, gentle, playful.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:40:29:790906900: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:40:29:807340300: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:40:29:819052500: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:40:29:841763000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:40:29:852361300: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:40:29:863748900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:40:29:875511600: _call_curl: Turbo Mode
[DEBUG] 22:40:29:886291300: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:40:30:881179400: ollama_api_post: success: return 0
[DEBUG] 22:40:30:892423500: ollama_generate_json: success: return: 0
[DEBUG] 22:40:30:928649600: ollama_generate: result: 611 bytes
soft, hopping, curious
[DEBUG] 22:40:30:959428300: ollama_generate: return: 0
```
