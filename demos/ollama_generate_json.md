# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.6

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-11T20:55:13.486771596Z",
  "response": "Soft, agile, whimsical.",
  "thinking": "User wants 3 words describing a rabbit. Provide answer.",
  "done": true,
  "total_duration": 386744049,
  "prompt_eval_count": 81,
  "eval_count": 28
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:55:13:786180000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:55:13:798307000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:55:13:817370000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:55:13:828650000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:55:13:837532000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:55:13:848043000: _call_curl: Turbo Mode
[DEBUG] 22:55:13:856316000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:55:15:193027000: ollama_api_post: success: return 0
[DEBUG] 22:55:15:206007000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-11T20:55:14.873983361Z",
  "response": "Soft, swift, playful",
  "thinking": "User says: \"Describe a rabbit in 3 words\". Just give three words. Shouldn't add extra instructions. So answer: \"Soft, swift, playful\".",
  "done": true,
  "total_duration": 388954912,
  "prompt_eval_count": 81,
  "eval_count": 48
}

```
