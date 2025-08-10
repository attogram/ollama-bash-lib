# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.1

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
  "created_at": "2025-08-10T19:40:31.859067143Z",
  "response": "Fluffy, timid, hopping.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is straightforward. Provide three adjectives like \"fluffy, timid, hopping\". No policy issues. Just respond.",
  "done": true,
  "total_duration": 450608527,
  "prompt_eval_count": 81,
  "eval_count": 53
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 21:40:32:536486600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 21:40:32:557426200: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 21:40:32:589528600: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:40:32:611477300: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:40:32:632352900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 21:40:32:653851400: _call_curl: Turbo Mode
[DEBUG] 21:40:32:676139500: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 21:40:33:801572500: ollama_api_post: success: return 0
[DEBUG] 21:40:33:823220500: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-10T19:40:33.173018597Z",
  "response": "Fluffy, timid, swift.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is a straightforward request, not disallowed. Provide three adjectives or words like \"fluffy, timid, swift\". Should comply.",
  "done": true,
  "total_duration": 641774235,
  "prompt_eval_count": 81,
  "eval_count": 57
}

```
