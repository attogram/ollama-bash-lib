# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user wants a description of a rabbit in 3 words. This is a straightforward request, no policy issues. Provide three adjectives or phrases: "soft, fluffy, agile". Provide.
# </thinking>

Soft, fluffy, agile.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:50:35:365865400: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:50:35:392763700: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 23:50:35:420501300: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 23:50:35:443158900: ollama_generate_json: stream: false
[DEBUG] 23:50:35:467027900: ollama_generate_json: thinking: false
[DEBUG] 23:50:35:499426100: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:50:35:522914900: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:50:35:545737400: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:50:35:597134000: _is_valid_json: success
[DEBUG] 23:50:35:617792800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:50:35:644363600: _call_curl: Turbo Mode
[DEBUG] 23:50:35:667527200: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:50:35:692081100: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:50:36:904976000: ollama_api_post: success
[DEBUG] 23:50:36:926920500: ollama_generate_json: success
[DEBUG] 23:50:36:983687600: ollama_generate: result: 405 bytes: {"model":"gpt-oss:120b","created_at":"2025-08-16T21:50:36.098427752Z","response":"Fluffy, swift, gentle.","thinking":"Th
[DEBUG] 23:50:37:027689400: _is_valid_json: success
[DEBUG] 23:50:37:090912600: ollama_generate: thinking: off
[DEBUG] 23:50:37:138916600: ollama_generate: thinking FOUND
# <thinking>
# The user asks "Describe a rabbit in 3 words". That's straightforward, not disallowed. We need to provide three words describing a rabbit, e.g., "Fluffy, swift, gentle". No policy issues. Provide answer.
# </thinking>

Fluffy, swift, gentle.
[DEBUG] 23:50:37:198952700: ollama_generate: success
```
