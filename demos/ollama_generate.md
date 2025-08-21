# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
#### <thinking>
#### User asks: "Describe a rabbit in 3 words". This is straightforward, no policy violation. Provide three words description. Could be "fluffy, timid, hopping". Provide answer.
#### </thinking>

Fluffy, timid, hopping.
```

## Demo Debug


```
OLLAMA_LIB_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 15:52:00:967140000: ollama_generate: [-m] [gpt-oss:120b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 15:52:00:979371000: ollama_generate: init: model: [] prompt: []
[DEBUG] 15:52:00:985756000: ollama_generate: while getopts: OPTARG: [gpt-oss:120b] opt: [m]
[DEBUG] 15:52:00:991722000: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 15:52:00:997464000: ollama_generate: final: model: [gpt-oss:120b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 15:52:01:003128000: ollama_generate: checking: model: [gpt-oss:120b]
[DEBUG] 15:52:01:008568000: ollama_generate: checked: model: [gpt-oss:120b]
[DEBUG] 15:52:01:019475000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 15:52:01:031051000: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:52:01:039704000: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:52:01:044401000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:52:01:054251000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:52:01:058755000: _call_curl: Turbo Mode
[DEBUG] 15:52:01:063265000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:52:01:067789000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 15:52:02:551345000: ollama_api_post: success
[DEBUG] 15:52:02:562203000: ollama_generate_json: success
[DEBUG] 15:52:02:578852000: ollama_generate: result: 356 bytes: {"model":"gpt-oss:120b","created_at":"2025-08-21T13:52:02.191378681Z","response":"Fluffy, swift, curious.","thinking":"T
[DEBUG] 15:52:02:600898000: ollama_generate: thinking: off
[DEBUG] 15:52:02:614478000: ollama_generate: thinking FOUND
#### <thinking>
#### The user asks for a description of a rabbit in 3 words. That's permissible. Just respond with three adjectives or descriptors. No violation. Provide answer.
#### </thinking>

Fluffy, swift, curious.
[DEBUG] 15:52:02:627643000: ollama_generate: success
```
