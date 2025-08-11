# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.5

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
  "created_at": "2025-08-11T20:38:21.586546681Z",
  "response": "Soft, fluffy, curious.",
  "thinking": "We need to comply. It's a simple request: \"Describe a rabbit in 3 words\". No policy violation. Just answer with three words.",
  "done": true,
  "total_duration": 415662867,
  "prompt_eval_count": 81,
  "eval_count": 45
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:38:21:961802000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:38:21:973502000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:38:21:995124000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:38:22:005210000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:38:22:014934000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:38:22:024278000: _call_curl: Turbo Mode
[DEBUG] 22:38:22:032933000: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:38:23:021240000: ollama_api_post: success: return 0
[DEBUG] 22:38:23:034553000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-11T20:38:22.706063053Z",
  "response": "Fluffy, timid, playful.",
  "thinking": "The user asks \"Describe a rabbit in 3 words\". It's straightforward. Not disallowed. Provide three adjectives: \"fluffy, timid, playful\". Could be any. No issues.",
  "done": true,
  "total_duration": 431961562,
  "prompt_eval_count": 81,
  "eval_count": 55
}

```
