# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.2

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
  "created_at": "2025-08-10T20:16:06.184680433Z",
  "response": "Fluffy, swift, gentle.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is simple. No policy issues. Provide three words describing a rabbit. Provide maybe \"fluffy, swift, gentle\". That's three words. OK.",
  "done": true,
  "total_duration": 397465886,
  "prompt_eval_count": 81,
  "eval_count": 61
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:16:06:918522200: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:16:06:940034500: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:16:06:973908100: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:06:996090700: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:07:020306900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:16:07:043114500: _call_curl: Turbo Mode
[DEBUG] 22:16:07:064590400: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:16:08:046855800: ollama_api_post: success: return 0
[DEBUG] 22:16:08:068328500: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-10T20:16:07.267872031Z",
  "response": "Fluffy, swift, curious.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". That's fine. Provide three words. No policy issue. Answer succinctly.",
  "done": true,
  "total_duration": 323415919,
  "prompt_eval_count": 81,
  "eval_count": 44
}

```
