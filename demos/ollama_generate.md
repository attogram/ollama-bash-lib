# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user asks: "Describe a rabbit in 3 words". This is a straightforward request, no policy violation. Provide three words that describe a rabbit, e.g., "fluffy, timid, hoppy". That's it.
# </thinking>

Fluffy, timid, hoppy.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 13:29:17:292093400: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:29:17:319081200: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:29:17:358739800: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 13:29:17:396060400: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:29:17:417207300: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:29:17:438174500: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:29:17:479782400: _is_valid_json: success
[DEBUG] 13:29:17:501154300: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 13:29:17:523090500: _call_curl: Turbo Mode
[DEBUG] 13:29:17:554717200: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:29:17:576480100: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 13:29:19:139401400: ollama_api_post: success
[DEBUG] 13:29:19:160685100: ollama_generate_json: success
[DEBUG] 13:29:19:234326400: ollama_generate: result: 442 bytes: {"model":"gpt-oss:120b","created_at":"2025-08-17T11:29:18.340150743Z","response":"Fluffy, timid, hopping.","thinking":"W
[DEBUG] 13:29:19:296892200: _is_valid_json: success
[DEBUG] 13:29:19:354374200: ollama_generate: thinking: off
[DEBUG] 13:29:19:401994500: ollama_generate: thinking FOUND
# <thinking>
# We need to respond to user: "Describe a rabbit in 3 words". No disallowed content. Just produce three words that describe a rabbit. Possibly "fluffy, timid, hopping". That's three. Or "soft, twitchy, curious". Provide three words. Okay.
# </thinking>

Fluffy, timid, hopping.
[DEBUG] 13:29:19:447259800: ollama_generate: success
```
