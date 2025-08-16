# ollama_generate
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# We need to answer "Describe a rabbit in 3 words." Likely we provide 3 descriptive words about rabbit. The answer should be exactly 3 words. It could be "Soft, curious, fleet". Or "Fluffy, nimble, playful". Maybe we provide one set. I should just deliver it.

We should respond with 3 words, no extra punctuation? It could be "Fluffy, quick, curious". The instructions: Describe a rabbit in 3 words. So 3 descriptive words. Let's do "Soft. Quick. Curious." But that is 3 words but punctuation is okay. Let's give "Fluffy, nimble, curious." I think "Fluffy, nimble, curious." That is 3 words. Or "Soft, swift, inquisitive." I'll go for "Soft, swift, inquisitive." That's descriptive.

Ok. Let's give the answer.
# </thinking>

Soft, swift, inquisitive.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:33:55:422382300: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:33:55:452372700: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:33:55:480599000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:33:55:504578100: ollama_generate_json: stream: false
[DEBUG] 22:33:55:524563100: ollama_generate_json: thinking: false
[DEBUG] 22:33:55:558444600: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:33:55:593617900: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:33:55:623833500: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:33:55:670050800: _is_valid_json: VALID: return 0
[DEBUG] 22:33:55:692287200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:33:55:715868600: _call_curl: Turbo Mode
[DEBUG] 22:33:55:739039000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:33:55:766342900: _call_curl: piping json_body | curl -s -N -H Content-Type: application/json -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:33:56:918010800: ollama_api_post: success
[DEBUG] 22:33:56:948848600: ollama_generate_json: success
[DEBUG] 22:33:57:012961400: ollama_generate: result: 579 bytes: {"model":"gpt-oss:20b","created_at":"2025-08-16T20:33:56.117262443Z","response":"Gentle, swift, fluffy.","thinking":"The
[DEBUG] 22:33:57:060961500: _is_valid_json: VALID: return 0
[DEBUG] 22:33:57:104633300: ollama_generate: thinking: off
[DEBUG] 22:33:57:151486600: ollama_generate: thinking FOUND
# <thinking>
# The user: "Describe a rabbit in 3 words". They want a description in exactly three words. We can do "Gentle, swift, fluffy". But exactly 3 words. "Soft, swift, playful". Or "eager, quick, gentle". Must be exactly three words. It's open ended. We provide something. Eg: "Soft, quick, playful". That's 3 words. Or "Gentle, swift, fluffy". That is 3 words. Let's deliver.
# </thinking>

Gentle, swift, fluffy.
[DEBUG] 22:33:57:196783700: ollama_generate: success
```
