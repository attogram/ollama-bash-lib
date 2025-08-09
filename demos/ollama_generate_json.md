# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.35

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
  "created_at": "2025-08-09T11:10:45.61653913Z",
  "response": "Soft, speedy, whiskered",
  "thinking": "We need to provide a short answer: three words describing a rabbit. No policy issues. Provide maybe \"soft, speedy, whiskered\". That's three words. Probably fine.",
  "done": true,
  "total_duration": 479596221,
  "prompt_eval_count": 81,
  "eval_count": 51
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 13:10:46:095404600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:10:46:105940000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 13:10:46:127184000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 13:10:46:137626400: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 13:10:46:147145200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:10:46:157635300: _call_curl: Turbo Mode
[DEBUG] 13:10:46:167500900: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 13:10:47:145958900: ollama_api_post: success: return 0
[DEBUG] 13:10:47:156041800: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-09T11:10:46.660452864Z",
  "response": "Fluffy, timid, swift.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is straightforward, not disallowed. We can give three adjectives: \"fluffy, timid, swift\" etc. Provide answer.",
  "done": true,
  "total_duration": 496035876,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```
