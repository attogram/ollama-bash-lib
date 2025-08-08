# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.30

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
  "created_at": "2025-08-08T21:07:27.028280333Z",
  "response": "Soft, fluffy, curious.",
  "thinking": "User asks: \"Describe a rabbit in 3 words\". This is benign. Provide three adjectives or such. Should comply.",
  "done": true,
  "total_duration": 366084144,
  "prompt_eval_count": 81,
  "eval_count": 41
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:07:28:187317400: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:07:28:196762000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:07:28:218725200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:07:28:229532500: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:07:28:240804500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:07:28:250911100: _call_curl: Turbo Mode
[DEBUG] 23:07:28:260795800: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:07:29:883045200: ollama_api_post: success: return 0
[DEBUG] 23:07:29:893587900: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-08T21:07:28.250532301Z",
  "response": "Fluffy, agile, gentle.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is a simple request. The assistant should comply. Provide 3 words describing a rabbit: \"fluffy, agile, gentle\". Should ensure no policy violation. It's fine.\n\n",
  "done": true,
  "total_duration": 438132820,
  "prompt_eval_count": 81,
  "eval_count": 66
}

```
