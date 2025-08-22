# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1

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
  "created_at": "2025-08-21T20:43:31.989041564Z",
  "response": "Fluffy, timid, agile.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's straightforward. No policy issue. Just give three adjectives or descriptors. Provide maybe \"fluffy, timid, agile\". It's okay.",
  "done": true,
  "total_duration": 1165549144,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_json -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:43:32:530284900: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:43:32:570508800: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:43:32:610061400: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:43:32:631252100: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:43:32:697766900: _call_curl: OBL_API: https://ollama.com
[DEBUG] 22:43:32:729528600: _call_curl: Turbo Mode
[DEBUG] 22:43:32:750582200: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:43:32:774332600: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:43:34:139970300: ollama_api_post: success
[DEBUG] 22:43:34:160442500: ollama_generate_json: success
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-21T20:43:33.621987494Z",
  "response": "Soft, alert, whiskered.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". Simple. Provide three adjectives or descriptors. No policy issues. Provide answer.",
  "done": true,
  "total_duration": 781863342,
  "prompt_eval_count": 81,
  "eval_count": 45
}

```
