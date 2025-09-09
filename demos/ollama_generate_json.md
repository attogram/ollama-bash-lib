# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

## Setup

OLLAMA_HOST: https://ollama.com
OBL_API: https://ollama.com


## Demo

```bash
ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-09-09T21:51:11.077965361Z",
  "response": "Soft, playful, nimble.",
  "thinking": "We have a user: \"Describe a rabbit in 3 words\". The user wants a description. We should answer with 3 words that describe a rabbit. Could be \"fluffy\", \"gentle\", \"agile\" or \"small\", etc. It's a straightforward answer. Possibly we should respond with something like \"soft\", \"playful\", \"nimble\". Could choose a set. No constraints. Just do it.",
  "done": true,
  "total_duration": 502221716,
  "prompt_eval_count": 81,
  "eval_count": 104
}

```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:51:12:318348847: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:51:12:325665712: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:51:12:330768465: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:51:12:333208152: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:51:12:339107639: _call_curl: OBL_API: https://ollama.com
[DEBUG] 23:51:12:341586680: _call_curl: Turbo Mode
[DEBUG] 23:51:12:344771192: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:51:12:347690671: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:51:13:369948161: ollama_api_post: success
[DEBUG] 23:51:13:373327053: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-09-09T21:51:12.130788847Z",
  "response": "fluffy nimble cute",
  "thinking": "Need to describe a rabbit in 3 words. Just 3 words. Probably \"fluffy\", \"nimble\", \"cute\". That is exactly three words. That suffices. Use capital or lower? likely lower case. Should be just three words. So answer: \"fluffy nimble cute\".",
  "done": true,
  "total_duration": 501412829,
  "prompt_eval_count": 81,
  "eval_count": 77
}

```
