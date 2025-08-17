# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5

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
  "created_at": "2025-08-17T11:29:20.837379192Z",
  "response": "Fluffy, gentle, quick.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's a straightforward request, not disallowed. I can respond with three adjectives, e.g., \"fluffy, gentle, quick\". Must be short. Probably just list three words. No policy violation.",
  "done": true,
  "total_duration": 517300409,
  "prompt_eval_count": 81,
  "eval_count": 71
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 13:29:21:427564200: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:29:21:456868800: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 13:29:21:515384600: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:29:21:548819500: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:29:21:571312900: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:29:21:610379000: _is_valid_json: success
[DEBUG] 13:29:21:632094600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:29:21:659205000: _call_curl: Turbo Mode
[DEBUG] 13:29:21:689944200: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:29:21:721125300: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 13:29:22:919945800: ollama_api_post: success
[DEBUG] 13:29:22:942833500: ollama_generate_json: success
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-17T11:29:22.269439932Z",
  "response": "Fluffy, timid, hopping.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". It's a simple request. There's no disallowed content. Should comply. Provide three words describing a rabbit. Could be \"fluffy, timid, hopping\". Or \"soft, swift, curious\". Just three words.\n\nNo policy issues. Output in final.",
  "done": true,
  "total_duration": 502136257,
  "prompt_eval_count": 81,
  "eval_count": 81
}

```
