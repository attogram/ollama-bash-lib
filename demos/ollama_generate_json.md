# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.34

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
  "created_at": "2025-08-08T22:51:02.230327683Z",
  "response": "Gentle, nimble, whiskered",
  "thinking": "The user wants \"Describe a rabbit in 3 words\". The answer should be exactly 3 words describing a rabbit. Probably something like \"fluffy, swift, curious\" or \"soft, playful, quick\", etc. We need exactly 3 words. Provide them with maybe commas. Ok. We'll produce something like \"Fluffy, swift, playful\". Ensure it's exactly 3 words. Or \"Soft, quick, curious\". Or \"Gentle, nimble, whiskered\". But \"whiskered\" is one word. That's 3: \"Gentle, nimble, whiskered\". Yes. Let's do \"Gentle, nimble, whiskered\". That fits.",
  "done": true,
  "total_duration": 723921043,
  "prompt_eval_count": 81,
  "eval_count": 157
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:51:03:389675500: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:51:03:401236100: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:51:03:425033200: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:51:03:436731400: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:51:03:446915600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:51:03:457765600: _call_curl: Turbo Mode
[DEBUG] 00:51:03:468064500: _call_curl: json_body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:51:04:376163100: ollama_api_post: success: return 0
[DEBUG] 00:51:04:386629300: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-08T22:51:03.205327334Z",
  "response": "Soft, playful, quick.",
  "thinking": "User wants: \"Describe a rabbit in 3 words\". They likely expect three adjectives. We should provide exactly 3 words, separated by commas or spaces? Probably just list. Let's do \"Soft, playful, quick.\" Let's output that.",
  "done": true,
  "total_duration": 351783088,
  "prompt_eval_count": 81,
  "eval_count": 65
}

```
