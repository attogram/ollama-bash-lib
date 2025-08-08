# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.32

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
  "created_at": "2025-08-08T21:34:01.631491951Z",
  "response": "Soft, playful, curious",
  "thinking": "The user just asks: \"Describe a rabbit in 3 words\". So we need to answer with a succinct three-word description. Probably \"Fluffy, playful, friendly\" or \"Soft, hopping, curious\". Any three words. Must be exactly three words. No explanation needed. Likely should just output three words. Let's pick \"Soft, playful, curious\". Ensure no punctuation? Could use commas. It's fine. We deliver exactly three words. Not more explanation. So answer.",
  "done": true,
  "total_duration": 762893723,
  "prompt_eval_count": 81,
  "eval_count": 113
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 23:34:02:774065200: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:34:02:784863300: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 23:34:02:808250500: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:34:02:819572000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:34:02:831356000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:34:02:841037800: _call_curl: Turbo Mode
[DEBUG] 23:34:02:852426000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 23:34:07:586401900: ollama_api_post: success: return 0
[DEBUG] 23:34:07:597761700: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-08T21:34:06.263671217Z",
  "response": "Fluffy, swift, curious.",
  "thinking": "We need to describe a rabbit in three words. So something like \"Fluffy, swift, soft\" or \"Clever, swift, soft\". The instruction: 3 words. Probably something straightforward: \"fluffy, quick, ears\". Let's choose: \"Fluffy, quick, curious\". We could do \"soft, quick, curious\". Let's pick: \"Fluffy, swift, curious\". Ensure exactly 3 words.",
  "done": true,
  "total_duration": 545147936,
  "prompt_eval_count": 81,
  "eval_count": 104
}

```
