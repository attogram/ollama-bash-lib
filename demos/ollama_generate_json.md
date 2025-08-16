# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

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
  "created_at": "2025-08-16T22:17:58.742303358Z",
  "response": "Soft, quick, curious",
  "thinking": "We need to produce a description of a rabbit in 3 words. The user: \"Describe a rabbit in 3 words\". So we should output three descriptive words. Likely something like \"fluffy, quick, graceful\". Or \"soft, nimble, curious\". Ensure exactly three words. The user doesn't ask for a sentence, just description. So output just 3 words. Probably separate by commas? But maybe just space separated? It's okay: \"Soft, quick, curious\". That’s 3 words separated by commas. I'll do \"Soft, quick, curious\". Ensure it's exactly three words. I'll give that.",
  "done": true,
  "total_duration": 674855458,
  "prompt_eval_count": 81,
  "eval_count": 142
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:17:59:432882500: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:17:59:460509900: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 00:17:59:482615500: ollama_generate_json: stream: false
[DEBUG] 00:17:59:504502300: ollama_generate_json: thinking: false
[DEBUG] 00:17:59:548302300: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:17:59:569459800: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:17:59:590967500: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:17:59:632593600: _is_valid_json: success
[DEBUG] 00:17:59:677925300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:17:59:701029500: _call_curl: Turbo Mode
[DEBUG] 00:17:59:739060400: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:17:59:761562600: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 00:18:00:842614700: ollama_api_post: success
[DEBUG] 00:18:00:864290700: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-16T22:18:00.141541228Z",
  "response": "Fluffy, graceful, playful.",
  "thinking": "User: \"Describe a rabbit in 3 words\". Need 3 words describing a rabbit. Probably \"fluffy, graceful, adorable\". We must output exactly three words. Ensure it's distinct, avoid comma? We can separate by commas or spaces. Let's answer: \"Fluffy, graceful, playful.\" Provide exactly 3 words. Probably \"Fluffy, graceful, playful.\" Good.",
  "done": true,
  "total_duration": 547523031,
  "prompt_eval_count": 81,
  "eval_count": 95
}

```
