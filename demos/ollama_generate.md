# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user wants a description of a rabbit in 3 words. Straightforward. Should be concise. Provide three words that describe a rabbit. Could be "soft, swift, playful" or "cuddly, quick, curious". Let's choose. They didn't specify further context. Just "rabbit in 3 words". So answer: "Soft, quick, curious." Done.
# </thinking>

Soft, swift, curious.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:09:24:363383900: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:09:24:392499800: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:09:24:421495000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:09:24:461815700: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:09:24:485028100: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:09:24:507914900: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:09:24:554546800: _is_valid_json: success
[DEBUG] 23:09:24:577334800: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:09:24:598861200: _call_curl: Turbo Mode
[DEBUG] 23:09:24:620324400: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:09:24:641982300: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:09:26:590189300: ollama_api_post: success
[DEBUG] 23:09:26:612219100: ollama_generate_json: success
[DEBUG] 23:09:26:682700800: ollama_generate: result: 737 bytes: {"model":"gpt-oss:20b","created_at":"2025-08-18T21:09:24.645104282Z","response":"Soft, swift, cuddly.","thinking":"User:
[DEBUG] 23:09:26:722834500: _is_valid_json: success
[DEBUG] 23:09:26:774234000: ollama_generate: thinking: off
[DEBUG] 23:09:26:826818300: ollama_generate: thinking FOUND
# <thinking>
# User: "Describe a rabbit in 3 words". They likely want a concise 3 word descriptive phrase. Likely answer: "soft, swift, fluffy". Or "cute, swift, gentle". Provide exactly three words.

Need to respond with only 3 words. Probably "soft, swift, cuddly". Ensure exactly 3 words. Provide maybe "soft, swift, cuddly".

Note: punctuation? They didn't specify. Could be "Soft, swift, cuddly" or "Soft swift cuddly". Usually punctuation is fine. 3 separate words. I'll give "Soft, swift, cuddly." It's still three words. Good.
# </thinking>

Soft, swift, cuddly.
[DEBUG] 23:09:26:884041800: ollama_generate: success
```
