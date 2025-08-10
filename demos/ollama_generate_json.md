# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.46

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
  "created_at": "2025-08-10T14:24:47.101294934Z",
  "response": "Soft, swift, curious",
  "thinking": "The user asks: \"Describe a rabbit in 3 words\". They want a three-word description. Should we answer with exactly three words. Yes. Possibly something like \"fluffy, curious, swift\". Or \"soft, playful, swift\". The user wants describing a rabbit. Likely answer with three words.\n\nLet's give \"soft, swift, curious\" or similar. Ensure exactly three words separated by commas or spaces? They didn't specify format. Probably just three words. We'll give \"Soft, swift, curious\". But ensure we have exactly three words. Use proper capitalization? Just three words: Soft swift curious. Or Soft, swift, curious. That's fine. We'll be safe: \"Soft, swift, curious\". That is three words. That's my final.",
  "done": true,
  "total_duration": 762738307,
  "prompt_eval_count": 81,
  "eval_count": 169
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 16:24:47:593400100: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 16:24:47:614555500: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 16:24:47:648104000: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 16:24:47:670135800: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 16:24:47:691705800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 16:24:47:715934600: _call_curl: Turbo Mode
[DEBUG] 16:24:47:737650700: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 16:24:48:771759500: ollama_api_post: success: return 0
[DEBUG] 16:24:48:794528600: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-10T14:24:48.333293624Z",
  "response": "Soft, curious, gentle.",
  "thinking": "We need to comply with instructions. The user: \"Describe a rabbit in 3 words\". We must answer. However, we should ensure we do not use disallowed content. The user wants three words to describe a rabbit. That's straightforward. We should comply. Ensure no disallowed content. It's fine. Let's provide three words: \"Fluffy\", \"Playful\", \"Gentle\". Or perhaps \"Soft\", \"Clever\", \"Endearing\". Let's produce three words separated by commas or space. We'll comply.",
  "done": true,
  "total_duration": 505491857,
  "prompt_eval_count": 81,
  "eval_count": 121
}

```
