# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

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
  "created_at": "2025-08-15T21:38:18.623604568Z",
  "response": "Fluffy, inquisitive, swift.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's straightforward. It's non-problematic. Provide answer.",
  "done": true,
  "total_duration": 569608763,
  "prompt_eval_count": 81,
  "eval_count": 43
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:38:18:894004000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:38:18:907683000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:38:18:929232000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:38:18:937665000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:38:18:945483000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:38:18:952698000: _call_curl: Turbo Mode
[DEBUG] 23:38:18:959607000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:38:20:104760000: ollama_api_post: success: return 0
[DEBUG] 23:38:20:121234000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-15T21:38:19.838546932Z",
  "response": "Soft, twitchy, curious",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". This is a simple request. No policy issues. Provide three words like \"soft, twitchy, curious\". Should be exactly three words or describing? Probably respond with three words separated by commas.\n\nI'll answer.",
  "done": true,
  "total_duration": 621987630,
  "prompt_eval_count": 81,
  "eval_count": 70
}

```
