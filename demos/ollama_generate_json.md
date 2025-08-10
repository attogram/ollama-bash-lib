# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4

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
  "created_at": "2025-08-10T22:37:49.089266364Z",
  "response": "Soft, agile, curious.",
  "thinking": "User: \"Describe a rabbit in 3 words.\" They want a 3-word description of a rabbit. Provide exactly 3 words. Likely \"soft, graceful, curious\" or \"quick, fluffy, gentle\". Should be exactly three words. They didn't specify format. I'll give a simple sentence: \"Fluffy, clever, swift\". Could be \"soft, agile, curious\" etc.\n\nI'll comply.",
  "done": true,
  "total_duration": 499092650,
  "prompt_eval_count": 81,
  "eval_count": 100
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:37:49:879572000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:37:49:903036900: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:37:49:946983600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:37:49:969859000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:37:49:996931900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:37:50:019676700: _call_curl: Turbo Mode
[DEBUG] 00:37:50:047944800: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:37:51:019996200: ollama_api_post: success: return 0
[DEBUG] 00:37:51:041779700: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-10T22:37:50.213340943Z",
  "response": "fluffy, graceful, alert",
  "thinking": "We need to describe a rabbit in 3 words. Should be descriptive. Keep exactly 3 words. Could be \"soft, swift, curious\" but must be three words separated by commas or just spaces? Likely just 3 words: e.g., \"soft, swift, curious\" or \"fluffy, graceful, alert\". Ensure exactly three words. Provide answer.",
  "done": true,
  "total_duration": 465817766,
  "prompt_eval_count": 81,
  "eval_count": 92
}

```
