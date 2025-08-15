# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.8

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-15T21:23:26.605502152Z",
  "response": "fluffy, sprightly, innocent",
  "thinking": "We need three words describing a rabbit. Could be \"fluffy, hopping, curious\" or \"gentle, swift, timid\". Just describe. The instruction says \"Describe a rabbit in 3 words\". So likely just output three words. Let's pick \"fluffy, sprightly, innocent\". Provide them, maybe separated by commas.",
  "done": true,
  "total_duration": 431531772,
  "prompt_eval_count": 81,
  "eval_count": 85
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:23:26:853395000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:23:26:864911000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:23:26:884395000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:23:26:892474000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:23:26:900021000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:23:26:906964000: _call_curl: Turbo Mode
[DEBUG] 23:23:26:914320000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 23:23:28:145032000: ollama_api_post: success: return 0
[DEBUG] 23:23:28:155715000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-15T21:23:27.89947872Z",
  "response": "Soft, quick, playful.",
  "thinking": "We need to describe a rabbit in 3 words. The user wants a description in 3 words. Likely something like \"soft, swift, playful\" or \"fluffy, gentle, quick\" or \"curious, twitchy, adorable\". They want 3 words. That's straightforward. I will produce 3 words describing a rabbit. Ensure no extra words? But we can provide them separated by commas or just space-separated. The instruction says \"Describe a rabbit in 3 words\". I'd respond: \"Fluffy, swift, curious.\" That's 3 words. Or \"Soft, quick, playful.\" Probably \"Soft, quick, playful.\" Provide them. It's fine.",
  "done": true,
  "total_duration": 702186663,
  "prompt_eval_count": 81,
  "eval_count": 154
}

```
