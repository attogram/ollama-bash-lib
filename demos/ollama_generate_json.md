# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.23

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
  "created_at": "2025-08-07T22:55:10.433549738Z",
  "response": "Fluffy, twitchy, swift.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's straightforward, no policy issues. Provide three descriptive words. Could be \"fluffy, timid, hopper\". Just any three words.",
  "done": true,
  "total_duration": 573905378,
  "prompt_eval_count": 81,
  "eval_count": 58
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:55:11:021995500: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:11:033110200: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:55:11:055945300: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:11:067253700: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:11:078472200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:11:088952200: _call_curl: Turbo Mode
[DEBUG] 00:55:11:100367500: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:55:11:111046800: _call_curl: curl_args: -s -N -H Content-Type: application/json -H Authorization: Bearer 06ab07b80cdb4f2db7fe63336646c86f.O8ntAssNC-QUWdXK3urz4UDZ -X POST https://ollama.com/api/generate -d @-
[DEBUG] 00:55:12:210637900: ollama_api_post: success: return 0
[DEBUG] 00:55:12:222037600: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-07T22:55:11.635969282Z",
  "response": "Fluffy, timid, hopping.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's straightforward. No policy violation. Provide three words. I can answer: \"fluffy, timid, hopping\". Maybe just three words. Should be fine.",
  "done": true,
  "total_duration": 559054709,
  "prompt_eval_count": 81,
  "eval_count": 62
}

```
