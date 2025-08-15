# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.9

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
  "created_at": "2025-08-15T23:51:53.268599331Z",
  "response": "fluffy, gentle, playful",
  "thinking": "The question: \"Describe a rabbit in 3 words\". They want a brief description, presumably 3 words. Likely something like \"fluffy, curious, hopping\". The user says \"Describe a rabbit in 3 words\". Should we just answer those 3 words, no extra? Could be \"soft, playful, quick\". Let's choose something appealing. Maybe \"fluffy, gentle, swift\". The user didn't specify length beyond 3 words. So just 3 words. We'll answer: \"fluffy, gentle, playful\". That is three words. Just give that. Ok.",
  "done": true,
  "total_duration": 579215175,
  "prompt_eval_count": 81,
  "eval_count": 136
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 01:51:53:588622000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 01:51:53:599280000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 01:51:53:614700000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:51:53:621494000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:51:53:627791000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 01:51:53:634086000: _call_curl: Turbo Mode
[DEBUG] 01:51:53:639631000: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"verbose":false}]
[DEBUG] 01:51:54:921040000: ollama_api_post: success: return 0
[DEBUG] 01:51:54:930702000: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-15T23:51:54.574497837Z",
  "response": "Playful, fluffy, swift",
  "thinking": "The user says \"Describe a rabbit in 3 words\". We have to provide a response. They ask for a description in 3 words. We should obey and give exactly three words. It's ambiguous: we can give three adjectives or maybe any description that in total has three words. Let's choose \"Playful, fluffy, swift\". That is three words separated by commas or maybe just three words separated by spaces. The instruction: \"Describe a rabbit in 3 words\". So we can respond \"Playful, fluffy, swift\". That’s three words. Or \"Soft, swift, curious\". Use exactly three words. Let's just answer with \"Playful, fluffy, swift\". Ensure no other words. Probably good to keep the formatting simple.",
  "done": true,
  "total_duration": 686105124,
  "prompt_eval_count": 81,
  "eval_count": 166
}

```
