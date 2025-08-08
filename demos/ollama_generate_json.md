# ollama_generate_json
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.26

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-08T20:26:22.701356378Z",
  "response": "Fluffy, timid, swift.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is harmless. We just need to respond with three words describing a rabbit. Could be \"fluffy, timid, swift\". So answer straightforward.",
  "done": true,
  "total_duration": 503996760,
  "prompt_eval_count": 81,
  "eval_count": 60
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:26:23:735826900: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:26:23:746273900: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:26:23:768162300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:26:23:780039500: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:26:23:791402800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:26:23:803534800: _call_curl: Turbo Mode
[DEBUG] 22:26:23:814865800: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:26:24:808017600: ollama_api_post: success: return 0
[DEBUG] 22:26:24:821581400: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-08T20:26:23.788110535Z",
  "response": "soft, hoppy, whiskered",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". No policy issues. Provide three words. Could be \"soft, hoppy, whiskered\". Probably fine.",
  "done": true,
  "total_duration": 490439057,
  "prompt_eval_count": 81,
  "eval_count": 51
}

```
