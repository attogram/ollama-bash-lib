# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.44

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
  "created_at": "2025-08-09T22:55:59.78730327Z",
  "response": "Fluffy, swift, alert",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". That's straightforward. No policy violation. Should respond with three words describing a rabbit, e.g., \"soft, hoppy, whiskered\". Provide three adjectives.\n\nThus answer with exactly three words. Probably the user wants a description. I'll give three nouns? Likely adjectives. Provide three words: \"Fluffy, swift, alert\". That's okay.",
  "done": true,
  "total_duration": 1007551870,
  "prompt_eval_count": 81,
  "eval_count": 99
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:56:00:318976100: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:56:00:340699400: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:56:00:369019000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:56:00:386878600: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:56:00:405052000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:56:00:422713300: _call_curl: Turbo Mode
[DEBUG] 00:56:00:440963500: _call_curl: json_body: [{"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:56:01:847696800: ollama_api_post: success: return 0
[DEBUG] 00:56:01:865217800: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:120b",
  "created_at": "2025-08-09T22:56:01.309593324Z",
  "response": "Fluffy, swift, curious.",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". It's a simple request. Provide three adjectives or descriptive words. No policy violation. Provide a short answer.",
  "done": true,
  "total_duration": 803139006,
  "prompt_eval_count": 81,
  "eval_count": 51
}

```
