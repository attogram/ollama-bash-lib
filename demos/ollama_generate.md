# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
#### <thinking>
#### The user asks: "Describe a rabbit in 3 words". Simple request, no policy issues. Provide three words describing a rabbit. Could be "fluffy, timid, swift". Should be fine.
#### </thinking>

Fluffy, timid, swift.
```

## Demo Debug


```
OLLAMA_LIB_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 22:43:27:385303500: ollama_generate: [-m] [gpt-oss:120b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 22:43:27:422530900: ollama_generate: init: model: [] prompt: []
[DEBUG] 22:43:27:446886600: ollama_generate: while getopts: OPTARG: [gpt-oss:120b] opt: [m]
[DEBUG] 22:43:27:477300500: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 22:43:27:508716200: ollama_generate: final: model: [gpt-oss:120b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 22:43:27:539741200: ollama_generate: checking: model: [gpt-oss:120b]
[DEBUG] 22:43:27:560339300: ollama_generate: checked: model: [gpt-oss:120b]
[DEBUG] 22:43:27:608114800: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 22:43:27:651212600: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:43:27:688076500: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:43:27:725332600: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:43:27:790691600: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 22:43:27:812581900: _call_curl: Turbo Mode
[DEBUG] 22:43:27:835372200: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:43:27:856952300: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:43:29:502895600: ollama_api_post: success
[DEBUG] 22:43:29:523937000: ollama_generate_json: success
[DEBUG] 22:43:29:577714200: ollama_generate: result: 384 bytes: {"model":"gpt-oss:120b","created_at":"2025-08-21T20:43:28.960196187Z","response":"Fluffy, timid, hoppy.","thinking":"The
[DEBUG] 22:43:29:658409500: ollama_generate: thinking: off
[DEBUG] 22:43:29:705043100: ollama_generate: thinking FOUND
#### <thinking>
#### The user asks: "Describe a rabbit in 3 words". This is a simple request. No policy violation. Provide three words that describe a rabbit, e.g., fluffy, timid, hoppy.

We can comply.
#### </thinking>

Fluffy, timid, hoppy.
[DEBUG] 22:43:29:754649100: ollama_generate: success
```
