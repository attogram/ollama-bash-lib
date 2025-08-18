# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

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
  "created_at": "2025-08-18T21:09:26.650110918Z",
  "response": "Soft, swift, curious.",
  "thinking": "We just need a concise description of a rabbit in 3 words. Should be a short answer. Probably \"Fluffy, quick, timid\" or \"Soft, quick, curious\". The instruction is simple. So answer: \"Soft, swift, curious.\"",
  "done": true,
  "total_duration": 547614373,
  "prompt_eval_count": 81,
  "eval_count": 68
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:09:28:637055000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:09:28:665106200: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:09:28:705927200: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:09:28:729496600: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:09:28:752335400: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:09:28:800424600: _is_valid_json: success
[DEBUG] 23:09:28:822226700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:09:28:845313200: _call_curl: Turbo Mode
[DEBUG] 23:09:28:874170900: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:09:28:896428200: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:09:30:301978100: ollama_api_post: success
[DEBUG] 23:09:30:333160100: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-18T21:09:28.312427507Z",
  "response": "Soft, playful, curious",
  "thinking": "We need to produce a description of a rabbit in 3 words. Simple. Probably \"fluffy, ears, hopper\" but must be exactly three words. We can choose any. Something like \"soft, timid, hopper\" or \"cute, swift, clever.\" We should follow constraints: just 3 words. Nothing else. Provide only three words. So answer: \"Soft, playful, timid\" or \"Furry, quick, curious\". Let's pick \"Soft, playful, curious\". That is three words. Ensure spacing. Provide maybe in quotes? The instruction didn't say, but just three words. We'll output exactly that.",
  "done": true,
  "total_duration": 798215976,
  "prompt_eval_count": 81,
  "eval_count": 143
}

```
