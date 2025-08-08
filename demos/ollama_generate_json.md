# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.29

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
  "created_at": "2025-08-08T20:52:56.457248296Z",
  "response": "Fluffy, timid, swift.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". No disallowed content. Just respond with three words describing a rabbit. Eg: \"fluffy, timid, swift\". Provide three words.",
  "done": true,
  "total_duration": 408690257,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:52:57:617026200: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:52:57:629890200: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:52:57:657044500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:52:57:668032700: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:52:57:679436200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:52:57:692419000: _call_curl: Turbo Mode
[DEBUG] 22:52:57:703916400: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:52:58:645476400: ollama_api_post: success: return 0
[DEBUG] 22:52:58:657283600: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-08T20:52:57.559063434Z",
  "response": "Soft, nimble, curious.",
  "thinking": "We need to comply: user asks \"Describe a rabbit in 3 words\". That's simple, no policy issues. Provide three adjectives: \"soft, nimble, curious\". That's fine.",
  "done": true,
  "total_duration": 389553767,
  "prompt_eval_count": 81,
  "eval_count": 55
}

```
