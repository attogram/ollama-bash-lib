# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
#### <thinking>
#### The user asks: "Describe a rabbit in 3 words". This is a simple request. We need to respond with three words describing a rabbit. Not disallowed. Provide answer.
#### </thinking>

Soft, speedy, whiskered.
```

## Demo Debug


```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 13:02:15:403859600: ollama_generate: [-m] [gpt-oss:120b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 13:02:15:447155300: ollama_generate: init: model: [] prompt: []
[DEBUG] 13:02:15:471404000: ollama_generate: while getopts: OPTARG: [gpt-oss:120b] opt: [m]
[DEBUG] 13:02:15:496204900: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 13:02:15:521745400: ollama_generate: final: model: [gpt-oss:120b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 13:02:15:556541800: ollama_generate: checking: model: [gpt-oss:120b]
[DEBUG] 13:02:15:580091900: ollama_generate: checked: model: [gpt-oss:120b]
[DEBUG] 13:02:15:631209600: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 13:02:15:675519200: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:02:15:718161500: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:02:15:742318300: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:02:15:789638000: _call_curl: OBL_API: https://ollama.com
[DEBUG] 13:02:15:812755100: _call_curl: Turbo Mode
[DEBUG] 13:02:15:835997800: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 13:02:15:860624700: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 13:02:17:119766300: ollama_api_post: success
[DEBUG] 13:02:17:142447700: ollama_generate_json: success
[DEBUG] 13:02:17:214096600: ollama_generate: result: 360 bytes: {"model":"gpt-oss:120b","created_at":"2025-08-23T11:02:16.606825923Z","response":"Fluffy, timid, hopping.","thinking":"T
[DEBUG] 13:02:17:280814600: ollama_generate: thinking: off
[DEBUG] 13:02:17:337602200: ollama_generate: thinking FOUND
#### <thinking>
#### The user asks: "Describe a rabbit in 3 words". This is straightforward, no policy issues. Provide three words like "fluffy, timid, hopping". That satisfies.
#### </thinking>

Fluffy, timid, hopping.
[DEBUG] 13:02:17:398965000: ollama_generate: success
```
