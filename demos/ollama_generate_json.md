# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.41

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
  "created_at": "2025-08-09T21:12:01.617391192Z",
  "response": "Fluffy, timid, hopping.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is a simple request, not disallowed. Provide three words describing a rabbit. Could be \"fluffy, timid, hopping\". That is fine.",
  "done": true,
  "total_duration": 544756317,
  "prompt_eval_count": 81,
  "eval_count": 61
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:12:02:060351500: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:12:02:077537200: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:12:02:108593800: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:12:02:128085100: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:12:02:145739000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:12:02:162949800: _call_curl: Turbo Mode
[DEBUG] 23:12:02:180711700: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:12:03:462513000: ollama_api_post: success: return 0
[DEBUG] 23:12:03:515305400: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-09T21:12:03.048031374Z",
  "response": "Fluffy, swift, gentle.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is a straightforward request. The response should be three words describing a rabbit. It's safe. Provide e.g., \"fluffy, quick, timid\". That's fine.\n\nWe just need to respond with three words. No policy concerns. Provide answer.",
  "done": true,
  "total_duration": 759971039,
  "prompt_eval_count": 81,
  "eval_count": 80
}

```
