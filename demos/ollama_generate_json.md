# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.20

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
  "created_at": "2025-08-07T22:09:25.933211048Z",
  "response": "Fluffy, timid, adorable",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is straightforward and safe. We can comply: \"Fluffy, timid, adorable\". That's three words. Ensure no policy violation. It's fine.\n\nReturn three words.",
  "done": true,
  "total_duration": 528117143,
  "prompt_eval_count": 81,
  "eval_count": 63
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:09:26:445037800: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:09:26:457807100: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:09:26:481696700: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:09:26:493241300: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:09:26:505704100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:09:26:516982000: _call_curl: Turbo Mode
[DEBUG] 00:09:26:528782000: _call_curl: adding json body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:09:27:807066800: ollama_api_post: success: return 0
[DEBUG] 00:09:27:818677300: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-07T22:09:27.265164208Z",
  "response": "Fluffy, timid, agile.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is a straightforward request. There's no policy violation. Provide three descriptive words, e.g., \"fluffy, timid, agile\". Should be fine.",
  "done": true,
  "total_duration": 672806848,
  "prompt_eval_count": 81,
  "eval_count": 61
}

```
