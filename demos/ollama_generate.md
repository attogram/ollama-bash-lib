# ollama_generate
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user request: "Describe a rabbit in 3 words". They want a 3-word description. We just give it. So something like "Adorable swift hopper". Or "Soft fur wanderer". Use 3 words. Let’s produce a concise. The user wants just description. I will give exactly 3 words: "Playful, fluffy, swift" but that's 3 words with comma. We can use "Soft, quick, gentle". But that’s 3 words, maybe need no comma? Let's just give: "Soft, quick, gentle". Could also be "Velvet ears, quick". That's 3 words? Actually "Velvet ears quick"? That's 3 words, but not good. They probably want "Playful, swift, gentle". That's 3. So answer: "Playful swift gentle". Or "Soft, quick, gentle". I'll choose "Soft, quick, gentle". Provide them.
# </thinking>

Soft, quick, gentle.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 23:35:09:144562500: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:35:09:172622400: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:35:09:200840800: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 23:35:09:223534400: ollama_generate_json: stream: false
[DEBUG] 23:35:09:246205500: ollama_generate_json: thinking: false
[DEBUG] 23:35:09:278289400: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:35:09:299715100: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:35:09:323673100: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:35:09:370028700: _is_valid_json: success
[DEBUG] 23:35:09:394965700: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 23:35:09:418388000: _call_curl: Turbo Mode
[DEBUG] 23:35:09:441753300: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:35:09:464099800: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:35:10:525906100: ollama_api_post: success
[DEBUG] 23:35:10:547496200: ollama_generate_json: success
[DEBUG] 23:35:10:611499400: ollama_generate: result: 522 bytes: {"model":"gpt-oss:20b","created_at":"2025-08-16T21:35:09.715780416Z","response":"Fluffy, agile, playful.","thinking":"Th
[DEBUG] 23:35:10:659086300: _is_valid_json: success
[DEBUG] 23:35:10:729071100: ollama_generate: thinking: off
[DEBUG] 23:35:10:784528200: ollama_generate: thinking FOUND
# <thinking>
# The user asks: "Describe a rabbit in 3 words". We just need to output 3 descriptive words about a rabbit. For example: "Soft, quick, curious." That is 3 words. Or "Fluffy, agile, timid." Many options. We should provide exactly 3 words. Ensure they are in text and no extra. The user expects a short answer. Should do.
# </thinking>

Fluffy, agile, playful.
[DEBUG] 23:35:10:831709600: ollama_generate: success
```
