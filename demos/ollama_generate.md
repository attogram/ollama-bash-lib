# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user asks: "Describe a rabbit in 3 words". That's a harmless request. We just need to give three words describing a rabbit. No policy violation. So answer: "fluffy, timid, hopping" or similar.
# </thinking>

Fluffy, timid, hopping.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 00:17:56:127237000: ollama_generate: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:17:56:153682400: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 00:17:56:195549600: _is_valid_model: VALID: [gpt-oss:120b]
[DEBUG] 00:17:56:219586800: ollama_generate_json: stream: false
[DEBUG] 00:17:56:249248600: ollama_generate_json: thinking: false
[DEBUG] 00:17:56:294388700: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:17:56:317771200: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:17:56:342886100: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:17:56:382001100: _is_valid_json: success
[DEBUG] 00:17:56:404126700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:17:56:437440600: _call_curl: Turbo Mode
[DEBUG] 00:17:56:469481000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 00:17:56:491785100: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 00:17:57:462588100: ollama_api_post: success
[DEBUG] 00:17:57:482970700: ollama_generate_json: success
[DEBUG] 00:17:57:539412400: ollama_generate: result: 449 bytes: {"model":"gpt-oss:120b","created_at":"2025-08-16T22:17:56.789459586Z","response":"Fluffy, swift, timid.","thinking":"The
[DEBUG] 00:17:57:585079800: _is_valid_json: success
[DEBUG] 00:17:57:649047800: ollama_generate: thinking: off
[DEBUG] 00:17:57:710824300: ollama_generate: thinking FOUND
# <thinking>
# The user asks: "Describe a rabbit in 3 words". This is a straightforward request. There's no policy violation. Provide three words that describe a rabbit, like "fluffy, swift, timid". Or other adjectives. It's fine.

We just need a short answer.
# </thinking>

Fluffy, swift, timid.
[DEBUG] 00:17:57:757186600: ollama_generate: success
```
