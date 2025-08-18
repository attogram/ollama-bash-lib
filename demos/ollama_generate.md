# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# We need to respond to the user: "Describe a rabbit in 3 words". According to policy; no disallowed content. It's safe. We just give 3 words description of a rabbit. That likely just requires a straightforward answer.

We should comply with style guidelines: no disallowed content, we can answer. The rabbit description in 3 words: "Soft, Agile, Curious". That is permissible. No disallowed content. Should we respond succinctly? Yes. Provide exactly 3 words. "Soft, agile, curious." Or "Fluffy, quick, shy." They said "Describe a rabbit in 3 words". So we can just give 3 words without commas. But it's okay.

We should just deliver that. Ensure compliance. So answer: "Soft, agile, curious." It's 3 words. Might mention "fluffy" etc. Okay.
# </thinking>

Soft, agile, curious.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:56:21:968019700: ollama_generate: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:56:21:996551200: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:56:22:024421600: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 22:56:22:066199100: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:56:22:088376600: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:56:22:114572800: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:56:22:158513500: _is_valid_json: success
[DEBUG] 22:56:22:186258900: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:56:22:211749200: _call_curl: Turbo Mode
[DEBUG] 22:56:22:233663500: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:56:22:258375700: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:56:23:877784500: ollama_api_post: success
[DEBUG] 22:56:23:900870500: ollama_generate_json: success
[DEBUG] 22:56:23:976991200: ollama_generate: result: 643 bytes: {"model":"gpt-oss:20b","created_at":"2025-08-18T20:56:21.862117804Z","response":"Soft, swift, curious.","thinking":"The 
[DEBUG] 22:56:24:037344400: _is_valid_json: success
[DEBUG] 22:56:24:100829800: ollama_generate: thinking: off
[DEBUG] 22:56:24:163600900: ollama_generate: thinking FOUND
# <thinking>
# The user wants a description of a rabbit in three words. Likely answer: "Soft, swift, curious." Or "Bouncy, fluffy, gentle." The prompt: "Describe a rabbit in 3 words". Possibly choose any three words that describe rabbit. The instruction: "Describe a rabbit in 3 words". So I should answer with exactly three words. No additional context.

Thus: "Soft, swift, curious." This is a description. I'll respond: "Soft, swift, curious."
# </thinking>

Soft, swift, curious.
[DEBUG] 22:56:24:225358200: ollama_generate: success
```
