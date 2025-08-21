# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.8

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-21T09:36:28.21258154Z",
  "response": "Soft, swift, curious",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". Likely they want a short description: \"soft, swift, curious\" or \"fluffy, quick, gentle\" etc. They want 3 words. Provide. Also maybe follow the instruction style? The conversation: They asked to describe a rabbit in 3 words. There's no constraints but we can produce 3 words. Use 3 words descriptive. Use uppercase? No. Let's answer with e.g. \"Soft, swift, curious\".\n\nWe must respond with only 3 words separated by commas. Or \"fluffy, quick, graceful\". Probably we should respond with exactly 3 words.\n\nThus answer: \"Soft, swift, curious\". Alternatively \"fluffy, agile, gentle\". Choose one. Let's respond: \"Soft, swift, curious\".",
  "done": true,
  "total_duration": 676121104,
  "prompt_eval_count": 81,
  "eval_count": 181
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 11:36:28:556072000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 11:36:28:573997000: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:36:28:593733000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:36:28:603315000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:36:28:619718000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:36:28:627486000: _call_curl: Turbo Mode
[DEBUG] 11:36:28:634878000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:36:28:641630000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:36:29:553999000: ollama_api_post: success
[DEBUG] 11:36:29:565805000: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-21T09:36:29.228909999Z",
  "response": "fluffy, nimble, curious",
  "thinking": "User says: \"Describe a rabbit in 3 words\". They want a 3-word description of a rabbit. Probably something like \"soft, hopping, curious\". Or \"fluffy, quick, timid\". That likely. It's open ended. There's no conflict with policy. It's just a short description. So respond with 3 words. Probably just deliver 3 words.",
  "done": true,
  "total_duration": 404953647,
  "prompt_eval_count": 81,
  "eval_count": 92
}

```
