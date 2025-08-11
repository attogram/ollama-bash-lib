# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.7

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
  "created_at": "2025-08-11T21:21:42.788799953Z",
  "response": "Fluffy, swift, curious.",
  "thinking": "User requests: \"Describe a rabbit in 3 words\". That's straightforward, no policy issue. Provide three words describing a rabbit. Should be concise. Use maybe \"fluffy, swift, curious\". Provide answer.",
  "done": true,
  "total_duration": 905031156,
  "prompt_eval_count": 81,
  "eval_count": 60
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:21:43:090572000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:21:43:098627000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:21:43:114959000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:21:43:121997000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:21:43:128933000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:21:43:138325000: _call_curl: Turbo Mode
[DEBUG] 23:21:43:146753000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:21:44:458696000: ollama_api_post: success: return 0
[DEBUG] 23:21:44:470105000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-11T21:21:44.143286721Z",
  "response": "Fluffy, timid, hoppy.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's harmless. Provide three adjectives, e.g., \"fluffy, timid, hoppy\". Nothing disallowed. So answer succinctly.",
  "done": true,
  "total_duration": 762210085,
  "prompt_eval_count": 81,
  "eval_count": 59
}

```
