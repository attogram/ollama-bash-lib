# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.8

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
# <thinking>
# User: "Describe a rabbit in 3 words". They just want 3 words describing a rabbit. Should keep simple. Probably answer: "Fluffy, energetic, curious". Or "Soft, swift, playful". There is no special formatting. Probably respond with exactly three words separated by commas or spaces. Provide concise. I'll do "Fluffy, swift, curious". That is all.
# </thinking>

Fluffy, swift, curious
```

## Demo Debug


```
OLLAMA_LIB_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 11:36:25:630700000: ollama_generate: [-m] [gpt-oss:20b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 11:36:25:642928000: ollama_generate: init: model: [] prompt: []
[DEBUG] 11:36:25:649440000: ollama_generate: while getopts: OPTARG: [gpt-oss:20b] opt: [m]
[DEBUG] 11:36:25:655470000: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 11:36:25:661303000: ollama_generate: final: model: [gpt-oss:20b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 11:36:25:667303000: ollama_generate: checking: model: [gpt-oss:20b]
[DEBUG] 11:36:25:673139000: ollama_generate: checked: model: [gpt-oss:20b]
[DEBUG] 11:36:25:684185000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 11:36:25:695619000: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:36:25:705237000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:36:25:710197000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:36:25:720031000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:36:25:724632000: _call_curl: Turbo Mode
[DEBUG] 11:36:25:729238000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:36:25:733710000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:36:26:681352000: ollama_api_post: success
[DEBUG] 11:36:26:689322000: ollama_generate_json: success
[DEBUG] 11:36:26:703787000: ollama_generate: result: 536 bytes: {"model":"gpt-oss:20b","created_at":"2025-08-21T09:36:26.385094731Z","response":"Soft, swift, adorable.","thinking":"We 
[DEBUG] 11:36:26:722828000: ollama_generate: thinking: off
[DEBUG] 11:36:26:734627000: ollama_generate: thinking FOUND
# <thinking>
# We need to produce a description of a rabbit in 3 words. Likely a short answer: "Fluffy, curious, swift" or something. Should be descriptive. Probably any three words as long as they describe a rabbit. Could be "Soft, swift, playful". I'll choose "Soft, swift, adorable". It's descriptive. Ensure it's exactly 3 words, as requested.
# </thinking>

Soft, swift, adorable.
[DEBUG] 11:36:26:745826000: ollama_generate: success
```
