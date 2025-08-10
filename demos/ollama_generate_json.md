# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.0

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
  "created_at": "2025-08-10T17:44:28.673088684Z",
  "response": "Fluffy, timid, hopping.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is a straightforward request. No policy issues. Provide three words describing a rabbit. Could be \"fluffy, timid, hopped\". Actually \"fluffy, timid, hopping\". Just three words. Provide answer.",
  "done": true,
  "total_duration": 702238557,
  "prompt_eval_count": 81,
  "eval_count": 73
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 19:44:29:253613100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 19:44:29:277337400: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 19:44:29:316029900: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 19:44:29:352939200: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 19:44:29:385384700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 19:44:29:411764400: _call_curl: Turbo Mode
[DEBUG] 19:44:29:445695600: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 19:44:30:625209300: ollama_api_post: success: return 0
[DEBUG] 19:44:30:649383000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-10T17:44:30.084978241Z",
  "response": "Fluffy, timid, agile.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's straightforward. We can respond with three adjectives: \"fluffy, timid, hopper\" or \"soft, agile, cute\". Provide three words. It's acceptable. No disallowed content. So just answer.",
  "done": true,
  "total_duration": 675748773,
  "prompt_eval_count": 81,
  "eval_count": 72
}

```
