# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2

## Setup

OLLAMA_HOST: https://ollama.com
OBL_API: https://ollama.com


## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
#### <thinking>
#### User asks "Describe a rabbit in 3 words". That's fine. Provide three adjectives. No policy conflict.
#### </thinking>

Fluffy, curious, swift.
```

## Demo Debug


```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 11:30:13:395400000: ollama_generate: [-m] [gpt-oss:120b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 11:30:13:407797000: ollama_generate: init: model: [] prompt: []
[DEBUG] 11:30:13:414662000: ollama_generate: while getopts: OPTARG: [gpt-oss:120b] opt: [m]
[DEBUG] 11:30:13:421217000: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 11:30:13:427892000: ollama_generate: final: model: [gpt-oss:120b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 11:30:13:433947000: ollama_generate: checking: model: [gpt-oss:120b]
[DEBUG] 11:30:13:439795000: ollama_generate: checked: model: [gpt-oss:120b]
[DEBUG] 11:30:13:451761000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 11:30:13:464200000: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:30:13:474732000: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:30:13:480291000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:30:13:491711000: _call_curl: OBL_API: https://ollama.com
[DEBUG] 11:30:13:497136000: _call_curl: Turbo Mode
[DEBUG] 11:30:13:502413000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:30:13:507702000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:30:14:527945000: ollama_api_post: success
[DEBUG] 11:30:14:538481000: ollama_generate_json: success
[DEBUG] 11:30:14:554860000: ollama_generate: result: 311 bytes: {"model":"gpt-oss:120b","created_at":"2025-08-22T09:30:14.219676248Z","response":"Fluffy, twitchy, curious.","thinking":
[DEBUG] 11:30:14:576829000: ollama_generate: thinking: off
[DEBUG] 11:30:14:590798000: ollama_generate: thinking FOUND
#### <thinking>
#### User asks: "Describe a rabbit in 3 words". That's straightforward. No policy violation. Provide answer.
#### </thinking>

Fluffy, twitchy, curious.
[DEBUG] 11:30:14:604160000: ollama_generate: success
```
