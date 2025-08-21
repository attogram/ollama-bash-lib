# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
#### <thinking>
#### We need to comply: user asks for 3-word description. That's fine. No policy issues. Provide three words: "fluffy, twitchy, curious".
#### </thinking>

Fluffy, twitchy, curious.
```

## Demo Debug


```
OLLAMA_LIB_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 15:42:23:170609000: ollama_generate: [-m] [gpt-oss:120b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 15:42:23:180974000: ollama_generate: init: model: [] prompt: []
[DEBUG] 15:42:23:185258000: ollama_generate: while getopts: OPTARG: [gpt-oss:120b] opt: [m]
[DEBUG] 15:42:23:189856000: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 15:42:23:197092000: ollama_generate: final: model: [gpt-oss:120b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 15:42:23:204175000: ollama_generate: checking: model: [gpt-oss:120b]
[DEBUG] 15:42:23:210879000: ollama_generate: checked: model: [gpt-oss:120b]
[DEBUG] 15:42:23:222205000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 15:42:23:234367000: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:42:23:244635000: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:42:23:249806000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:42:23:261422000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:42:23:267000000: _call_curl: Turbo Mode
[DEBUG] 15:42:23:272494000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:42:23:278072000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 15:42:24:249138000: ollama_api_post: success
[DEBUG] 15:42:24:259462000: ollama_generate_json: success
[DEBUG] 15:42:24:281338000: ollama_generate: result: 283 bytes: {"model":"gpt-oss:120b","created_at":"2025-08-21T13:42:23.935229767Z","response":"Soft, swift, curious.","thinking":"We 
[DEBUG] 15:42:24:311317000: ollama_generate: thinking: off
[DEBUG] 15:42:24:328823000: ollama_generate: thinking FOUND
#### <thinking>
#### We need to respond with three words describing a rabbit. It's fine. No policy issues.
#### </thinking>

Soft, swift, curious.
[DEBUG] 15:42:24:345122000: ollama_generate: success
```
