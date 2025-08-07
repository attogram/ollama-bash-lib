# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.18

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
  "created_at": "2025-08-07T19:46:34.460969044Z",
  "response": "Fluffy, gentle, swift.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". Straightforward, no policy issues. Provide three words describing a rabbit. Could be \"fluffy, gentle, swift\". That's fine.",
  "done": true,
  "total_duration": 422578912,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 21:46:34:848454400: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 21:46:34:861173600: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 21:46:34:885241600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:46:34:898005500: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:46:34:908661800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:46:34:920104000: _call_curl: Turbo Mode
[DEBUG] 21:46:34:950392700: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:46:35:943574200: ollama_api_post: success: return 0
[DEBUG] 21:46:35:955411000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-07T19:46:35.572888593Z",
  "response": "soft, fluffy, swift",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's fine. Should respond with three words describing a rabbit, e.g., \"soft, fluffy, swift\". No policy violation. Just answer.",
  "done": true,
  "total_duration": 489370906,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```
