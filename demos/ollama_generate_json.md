# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.25

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
  "created_at": "2025-08-08T18:20:31.475249606Z",
  "response": "soft, fluffy, hoppy",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is straightforward, no policy issues. Provide three adjectives like \"soft, fluffy, hoppy\". Should be three words. Provide them.",
  "done": true,
  "total_duration": 627179256,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 20:20:32:443568200: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 20:20:32:454088700: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 20:20:32:476397700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:20:32:487032600: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:20:32:497108500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 20:20:32:506485700: _call_curl: Turbo Mode
[DEBUG] 20:20:32:518268400: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 20:20:33:776640400: ollama_api_post: success: return 0
[DEBUG] 20:20:33:791092600: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-08T18:20:32.804278519Z",
  "response": "Fluffy, swift, curious.",
  "thinking": "We need to comply. The user asks: \"Describe a rabbit in 3 words\". That's straightforward, no policy violation. We can simply answer with three adjectives. Provide maybe \"fluffy, swift, curious\". Just three words.",
  "done": true,
  "total_duration": 659551269,
  "prompt_eval_count": 81,
  "eval_count": 64
}

```
