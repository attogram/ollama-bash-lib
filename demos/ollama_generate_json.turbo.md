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
  "created_at": "2025-08-07T19:35:46.675611357Z",
  "response": "Fluffy, timid, swift.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is straightforward, no policy violation. Provide three adjectives, e.g., \"fluffy, timid, swift\". Should be fine.",
  "done": true,
  "total_duration": 505773734,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 21:35:47:273410500: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 21:35:47:285613800: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 21:35:47:312754400: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:35:47:326272900: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:35:47:337835900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:35:47:348402300: _call_curl: Turbo Mode
[DEBUG] 21:35:47:359951500: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:35:48:487226400: ollama_api_post: success: return 0
[DEBUG] 21:35:48:497623800: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-07T19:35:48.070327037Z",
  "response": "Fluffy, swift, curious.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". This is straightforward, non-problematic. Provide three adjectives or descriptors. Probably \"soft, swift, curious\". Or \"fluffy, timid, playful\". It's fine. No policy issue. Provide response.",
  "done": true,
  "total_duration": 533025085,
  "prompt_eval_count": 81,
  "eval_count": 71
}

```
