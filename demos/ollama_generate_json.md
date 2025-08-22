# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2

## Setup

OLLAMA_HOST: https://ollama.com
OBL_API: https://ollama.com


## Demo

```bash
ollama_generate_json -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-22T09:30:16.237650431Z",
  "response": "Fluffy, timid, hopping.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". That's straightforward. No policy issues. Respond with three words. Let's do \"fluffy, timid, hopping\". Or \"soft, curious, swift\". Provide three words.",
  "done": true,
  "total_duration": 963598251,
  "prompt_eval_count": 81,
  "eval_count": 63
}

```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_json -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 11:30:16:577882000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 11:30:16:594265000: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:30:16:607010000: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:30:16:613248000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:30:16:626631000: _call_curl: OBL_API: https://ollama.com
[DEBUG] 11:30:16:633008000: _call_curl: Turbo Mode
[DEBUG] 11:30:16:639182000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:30:16:645055000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:30:17:763621000: ollama_api_post: success
[DEBUG] 11:30:17:772207000: ollama_generate_json: success
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-22T09:30:17.456238342Z",
  "response": "Soft, twitchy, hoppy.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". No disallowed content. Just straightforward. Provide three words.",
  "done": true,
  "total_duration": 630620745,
  "prompt_eval_count": 81,
  "eval_count": 42
}

```
