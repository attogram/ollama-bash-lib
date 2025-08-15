# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-15T23:24:05.932904125Z",
  "response": "Gentle, swift, fluffy.",
  "thinking": "We need to provide a description of a rabbit in 3 words. Likely something like \"cute, fluffy, fast\" or \"gentle, quick, hopping\" etc. We just give 3 words. It must be a direct answer. Probably \"Gentle, swift, soft.\" But need 3 words exactly. No punctuation? They didn't specify. Just 3 words. I'll pick \"Cute, quick, fuzzy.\" That's 3 words. Or \"Gentle, swift, fluffy\". We'll do that.",
  "done": true,
  "total_duration": 538391792,
  "prompt_eval_count": 81,
  "eval_count": 122
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 01:24:06:429665000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 01:24:06:440937000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 01:24:06:459398000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:24:06:468537000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:24:06:477623000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:24:06:486308000: _call_curl: Turbo Mode
[DEBUG] 01:24:06:494023000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:24:07:344224000: ollama_api_post: success: return 0
[DEBUG] 01:24:07:359268000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-15T23:24:07.020274182Z",
  "response": "fluffy, swift, curious.",
  "thinking": "Simple.",
  "done": true,
  "total_duration": 309581350,
  "prompt_eval_count": 81,
  "eval_count": 19
}

```
