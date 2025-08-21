# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

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
  "created_at": "2025-08-21T13:42:26.40011498Z",
  "response": "soft, swift, playful",
  "thinking": "We have a user request: \"Describe a rabbit in 3 words\". So we need to provide a short description. They didn't mention anything else. The request: \"Describe a rabbit in 3 words\". We should provide exactly 3 words. Likely something like \"soft, fluffy, hoppy\". Or \"cute, quick, gentle.\" Many possibilities. The user likely expects three words. We must ensure we respond with exactly three words. Provide the answer. Probably something like \"soft, swift, mischievous.\" That describes a rabbit. Let's go with \"soft, swift, playful\". That is nice. So output is \"soft, swift, playful\". Ensure it's exactly three words and no punctuation? They didn't specify punctuation. I'll give them as \"Soft, quick, gentle.\" Actually if we do \"soft swift playful\" that's three words. But \"soft, swift, playful\" also counts as three words separated by commas. I think it's safe: \"soft, swift, playful\". I'll write that.",
  "done": true,
  "total_duration": 1385261936,
  "prompt_eval_count": 81,
  "eval_count": 221
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 15:42:26:768019000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 15:42:26:790511000: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:42:26:807711000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:42:26:816421000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:42:26:832277000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:42:26:839267000: _call_curl: Turbo Mode
[DEBUG] 15:42:26:846255000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:42:26:853000000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 15:42:27:970958000: ollama_api_post: success
[DEBUG] 15:42:27:984827000: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-21T13:42:27.636967894Z",
  "response": "Soft, swift, curious.",
  "thinking": "We need to respond: \"Describe a rabbit in 3 words\". Provide 3 words. The user wants a description. Could be \"Plush, fluffy, hopping\". Or \"Soft, ear-fluttering, burrowing\". But keep to 3 words. Let's choose \"Soft, swift, curious\". 3 words. Let's respond with that.",
  "done": true,
  "total_duration": 596041328,
  "prompt_eval_count": 81,
  "eval_count": 87
}

```
