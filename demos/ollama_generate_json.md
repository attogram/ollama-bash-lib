# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.9

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
  "created_at": "2025-08-21T09:55:09.490441721Z",
  "response": "Soft, curious, swift",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". So we answer with a succinct description: e.g., \"Graceful, fluffy, gentle\". That's 3 words. Provide exactly 3 words. Ensure we meet the request. We'll output \"Graceful, fluffy, gentle\" or \"Soft, swift, curious\" etc. Let's choose something evocative: \"Playful, elegant, timid\" maybe. But rabbit can be described as \"fluffy, quiet, curious\". I'll choose \"Soft, curious, swift\". That's 3 words separated by commas. The answer: \"Soft, curious, swift\". It's 3 words. Ensure no extraneous.",
  "done": true,
  "total_duration": 656874543,
  "prompt_eval_count": 81,
  "eval_count": 151
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 11:55:09:812017000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 11:55:09:828254000: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:55:09:842145000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:55:09:846779000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:55:09:859519000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:55:09:864065000: _call_curl: Turbo Mode
[DEBUG] 11:55:09:871367000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:55:09:875989000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:55:10:779507000: ollama_api_post: success
[DEBUG] 11:55:10:790980000: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-21T09:55:10.447239873Z",
  "response": "Fluffy, quick, curious",
  "thinking": "We need to respond with 3 words describing a rabbit. Probably something like \"fluffy, swift, curious\". Provide 3 words. Ensure only 3 words, no punctuation? They didn't specify punctuation but likely okay. Use 3 words. Let's do \"Fluffy, quick, curious\". It's 3 words. That is fine.",
  "done": true,
  "total_duration": 409748019,
  "prompt_eval_count": 81,
  "eval_count": 85
}

```
