# ollama_generate_json
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

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
  "created_at": "2025-08-16T21:35:11.78251989Z",
  "response": "Fluffy, timid, quick.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's straightforward: we can respond with three adjectives, e.g., \"fluffy, timid, quick\". It's permissible. No policy conflict. Provide a brief answer.\n\n",
  "done": true,
  "total_duration": 729969491,
  "prompt_eval_count": 81,
  "eval_count": 63
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:35:12:649716800: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:35:12:679425100: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:35:12:701849600: ollama_generate_json: stream: false
[DEBUG] 23:35:12:724034700: ollama_generate_json: thinking: false
[DEBUG] 23:35:12:765073100: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:35:12:785922900: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:35:12:808737200: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:35:12:857034600: _is_valid_json: success
[DEBUG] 23:35:12:878587300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:35:12:899634500: _call_curl: Turbo Mode
[DEBUG] 23:35:12:921649000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:35:12:947544300: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:35:14:180014700: ollama_api_post: success
[DEBUG] 23:35:14:201632900: ollama_generate_json: success
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-16T21:35:13.347392115Z",
  "response": "Fluffy, timid, hopper.",
  "thinking": "The user request is simple: \"Describe a rabbit in 3 words\". This is safe. Provide three words description. Could be \"fluffy, timid, hopper\". That's fine.",
  "done": true,
  "total_duration": 677877275,
  "prompt_eval_count": 81,
  "eval_count": 54
}

```
