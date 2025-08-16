# ollama_generate_json
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1

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
  "created_at": "2025-08-16T20:33:58.55924625Z",
  "response": "Fluffy, timid, hopping",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's a simple request. Must comply. We can respond with three adjectives like \"fluffy, timid, hopping\". That is fine. Provide three words. Could also be \"soft, twitchy, ears\". Any three words. No issues. Provide answer.",
  "done": true,
  "total_duration": 838860726,
  "prompt_eval_count": 81,
  "eval_count": 81
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:33:59:375275100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:33:59:402216500: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 22:33:59:430029700: ollama_generate_json: stream: false
[DEBUG] 22:33:59:451883400: ollama_generate_json: thinking: false
[DEBUG] 22:33:59:485718000: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:33:59:506840200: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:33:59:527472300: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:33:59:586232700: _is_valid_json: VALID: return 0
[DEBUG] 22:33:59:607787200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:33:59:628464900: _call_curl: Turbo Mode
[DEBUG] 22:33:59:648448400: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:33:59:684712900: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:34:00:910061400: ollama_api_post: success
[DEBUG] 22:34:00:930646900: ollama_generate_json: success
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-16T20:34:00.071500774Z",
  "response": "Fluffy, swift, timid.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". That's a normal request, no policy issues. We can simply give three adjectives like \"fluffy, swift, timid\". That fulfills.",
  "done": true,
  "total_duration": 512850023,
  "prompt_eval_count": 81,
  "eval_count": 56
}

```
