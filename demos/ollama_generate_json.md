# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.24

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
  "created_at": "2025-08-07T22:59:22.055032311Z",
  "response": "Fluffy, timid, hopping.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". That's safe. Provide three words: e.g., \"fluffy, timid, hopping\". Should be fine.",
  "done": true,
  "total_duration": 420192789,
  "prompt_eval_count": 81,
  "eval_count": 51
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:59:22:589251900: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:59:22:599634000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:59:22:623953700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:59:22:635061000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:59:22:646979800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:59:22:657730400: _call_curl: Turbo Mode
[DEBUG] 00:59:22:669164600: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:59:23:720290800: ollama_api_post: success: return 0
[DEBUG] 00:59:23:732023200: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-07T22:59:23.160492969Z",
  "response": "Soft, hop‑filled, whiskered.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is safe. We just need to give three words describing a rabbit. No policy issues. Let's answer.",
  "done": true,
  "total_duration": 525444889,
  "prompt_eval_count": 81,
  "eval_count": 54
}

```
