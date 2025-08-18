# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3

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
  "created_at": "2025-08-18T20:56:24.46430366Z",
  "response": "Fluffy, gentle, curious",
  "thinking": "We need to provide a description of a rabbit in 3 words. The user wants a short description. Likely something like \"Fluffy, gentle, hops\". But we need just 3 words separated by commas or spaces. Could be \"Fluffy\", \"Gentle\", \"Playful\". The user asked: \"Describe a rabbit in 3 words\". So the answer should be exactly three words describing a rabbit. We should not add extra words or commentary. We likely respond with just three words, no punctuation? Probably punctuation okay. I'll respond with: \"Fluffy, gentle, playful\" or \"Soft, swift, curious\". Many possibilities. I'll choose \"Fluffy, gentle, curious\". That seems good.",
  "done": true,
  "total_duration": 884762204,
  "prompt_eval_count": 81,
  "eval_count": 162
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 22:56:26:548875400: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:56:26:577223900: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:56:26:618171700: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:56:26:641251200: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:56:26:663994600: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:56:26:727892000: _is_valid_json: success
[DEBUG] 22:56:26:751507300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:56:26:787052100: _call_curl: Turbo Mode
[DEBUG] 22:56:26:808549700: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:56:26:838532400: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:56:28:064397900: ollama_api_post: success
[DEBUG] 22:56:28:090231500: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-18T20:56:26.126665714Z",
  "response": "soft, swift, cute",
  "thinking": "The user simply asks: \"Describe a rabbit in 3 words\". We need to give 3 words describing a rabbit. Could be like \"soft furred, swift, cute\". It's straightforward. The user didn't specify any guidelines. Just give. Provide 3 words separated by commas or spaces. I would respond with three words in a concise manner. We'll just answer.",
  "done": true,
  "total_duration": 636697153,
  "prompt_eval_count": 81,
  "eval_count": 90
}

```
