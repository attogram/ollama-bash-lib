# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.14

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
  "created_at": "2025-08-06T22:47:17.238324804Z",
  "response": "Fluffy, swift, timid.",
  "thinking": "User asks \"Describe a rabbit in 3 words\". It's a simple request, no policy issues. Just give three words like \"fluffy, quick, timid\" maybe. Provide answer.",
  "done": true,
  "total_duration": 407169845,
  "prompt_eval_count": 81,
  "eval_count": 55
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:47:17:781515500: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:47:17:793756600: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:47:17:818780900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:47:17:830166200: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:47:17:841132800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:47:17:852555600: _call_curl: Turbo Mode
[DEBUG] 00:47:17:863377700: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:47:18:873555900: ollama_api_post: success: return 0
[DEBUG] 00:47:18:884624200: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-06T22:47:18.324574026Z",
  "response": "Soft, swift, curious.",
  "thinking": "User wants to describe a rabbit in three words. That's straightforward, no policy violations. Provide three descriptive words.",
  "done": true,
  "total_duration": 441155113,
  "prompt_eval_count": 81,
  "eval_count": 38
}

```
