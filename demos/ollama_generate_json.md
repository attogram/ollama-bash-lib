# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.19

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
  "created_at": "2025-08-07T20:06:03.049570683Z",
  "response": "Soft, fluffy, timid.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is a straightforward request. There's no policy violation. Provide three words describing a rabbit, e.g., \"soft, fluffy, timid\". Should be fine.",
  "done": true,
  "total_duration": 544848429,
  "prompt_eval_count": 81,
  "eval_count": 61
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:06:03:557934000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:06:03:569382200: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:06:03:593937500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:06:03:604683900: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:06:03:615248000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:06:03:626109200: _call_curl: Turbo Mode
[DEBUG] 22:06:03:637505500: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:06:04:824460100: ollama_api_post: success: return 0
[DEBUG] 22:06:04:836793500: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-07T20:06:04.387766587Z",
  "response": "Fluffy, swift, gentle.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". Simple request, not disallowed. Provide three words: \"Fluffy, swift, gentle\". That's fine.",
  "done": true,
  "total_duration": 566184919,
  "prompt_eval_count": 81,
  "eval_count": 52
}

```
