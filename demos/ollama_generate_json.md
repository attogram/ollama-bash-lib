# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

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
  "created_at": "2025-08-23T11:02:18.616457382Z",
  "response": "Gentle, fluffy, curious.",
  "thinking": "We need to describe a rabbit in 3 words. Needs to be concise, likely three descriptive words. Could be something like \"gentle, fluffy, curious\". We'll answer.",
  "done": true,
  "total_duration": 356694653,
  "prompt_eval_count": 81,
  "eval_count": 53
}

```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 13:02:19:154189600: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 13:02:19:194504300: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:02:19:236383000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:02:19:261377600: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:02:19:302268300: _call_curl: OBL_API: https://ollama.com
[DEBUG] 13:02:19:323129000: _call_curl: Turbo Mode
[DEBUG] 13:02:19:346837300: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:02:19:370213400: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 13:02:20:741818400: ollama_api_post: success
[DEBUG] 13:02:20:762951900: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-23T11:02:20.203227852Z",
  "response": "Soft, swift, curious",
  "thinking": "We need to respond in 3 words describing rabbit. Just 3 words. Eg \"Soft, fluffy, curious\". But perhaps the user expects exactly three words. Must comply: \"Describe a rabbit in 3 words\". So answer with exactly 3 words. Could be \"Bouncy, white, cuddly\". We should do exactly 3 words, no punctuation? Punctuation not forbidden. Provide just 3 words. Let's answer \"Soft, swift, curious\". That's 3 words? Soft, swift, curious. That's 3 words separated by commas. Good. Ensure no additional context. Use exactly 3 words. Provide the answer.",
  "done": true,
  "total_duration": 620838373,
  "prompt_eval_count": 81,
  "eval_count": 146
}

```
