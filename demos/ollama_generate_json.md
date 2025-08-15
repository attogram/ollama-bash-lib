# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

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
  "created_at": "2025-08-15T22:55:02.607869217Z",
  "response": "Soft, timid, fluffy.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That is straightforward: \"soft, timid, fluffy\" etc. No policy issues. Provide 3 words.",
  "done": true,
  "total_duration": 470441444,
  "prompt_eval_count": 81,
  "eval_count": 51
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:55:03:027224000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:55:03:040749000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:55:03:062024000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 00:55:03:071498000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 00:55:03:080040000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:03:087804000: _call_curl: Turbo Mode
[DEBUG] 00:55:03:094917000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 00:55:04:260953000: ollama_api_post: success: return 0
[DEBUG] 00:55:04:273734000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-15T22:55:03.863228137Z",
  "response": "Fluffy, swift, curious.",
  "thinking": "The user asks \"Describe a rabbit in 3 words\". That's straightforward. We can provide three adjectives or descriptive words. No policy issues. Provide answer.",
  "done": true,
  "total_duration": 544141869,
  "prompt_eval_count": 81,
  "eval_count": 48
}

```
