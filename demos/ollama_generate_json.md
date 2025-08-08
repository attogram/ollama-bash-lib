# ollama_generate_json
./../ollama_bash_lib.sh: line 700: return: : numeric argument required
ERROR: Ollama Not Installed

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.27

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
  "created_at": "2025-08-08T20:40:31.264925117Z",
  "response": "Fluffy, alert, hoppy.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's straightforward. No policy violation. Provide three adjectives describing a rabbit. Should be fine.",
  "done": true,
  "total_duration": 363565228,
  "prompt_eval_count": 81,
  "eval_count": 49
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:40:32:310218000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:40:32:320844700: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 22:40:32:341874500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:40:32:352711900: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:40:32:363994500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:40:32:374158200: _call_curl: Turbo Mode
[DEBUG] 22:40:32:385298200: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 22:40:33:339837600: ollama_api_post: success: return 0
[DEBUG] 22:40:33:350185700: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-08T20:40:32.273778662Z",
  "response": "Fluffy, timid, hopping.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". This is straightforward. Provide three words that describe a rabbit, e.g., \"fluffy, timid, hopping\". No policy violation. Return three words.",
  "done": true,
  "total_duration": 430847511,
  "prompt_eval_count": 81,
  "eval_count": 61
}

```
