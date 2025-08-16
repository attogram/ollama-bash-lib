# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3

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
  "created_at": "2025-08-16T21:50:37.886171529Z",
  "response": "Fluffy, timid, quick.",
  "thinking": "The user wants \"Describe a rabbit in 3 words\". That's straightforward, no policy issues. Provide three words: \"fluffy, timid, quick\". Possibly more descriptive. So answer.",
  "done": true,
  "total_duration": 475953818,
  "prompt_eval_count": 81,
  "eval_count": 55
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:50:38:724980900: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:50:38:753122700: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:50:38:781952700: ollama_generate_json: stream: false
[DEBUG] 23:50:38:804346000: ollama_generate_json: thinking: false
[DEBUG] 23:50:38:840590600: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:50:38:862901600: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:50:38:886305600: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:50:38:936463600: _is_valid_json: success
[DEBUG] 23:50:38:967714600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:50:38:998838200: _call_curl: Turbo Mode
[DEBUG] 23:50:39:024715800: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:50:39:059554200: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:50:40:058965700: ollama_api_post: success
[DEBUG] 23:50:40:090243200: ollama_generate_json: success
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-16T21:50:39.244410011Z",
  "response": "Fluffy, swift, gentle.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". It's a simple request. Provide three words describing a rabbit. Could be \"fluffy, swift, gentle\". That's fine. No disallowed content. No issues. Provide answer.",
  "done": true,
  "total_duration": 476522605,
  "prompt_eval_count": 81,
  "eval_count": 66
}

```
