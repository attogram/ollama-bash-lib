# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

## Demo

```bash
ollama_generate_stream -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"
```
```

#### We need to comply with policy. The user asks: \"Describe a rabbit in 3 words\". That's straightforward. Provide three adjectives like \"fluffy, swift, gentle\". No issues.

fluffy, swift, gentle

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 15:42:30:455915000: ollama_generate_stream: model='gpt-oss:120b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 15:42:30:468788000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 15:42:30:481685000: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:42:30:493027000: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:42:30:499141000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:42:30:511943000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:42:30:518018000: _call_curl: Turbo Mode
[DEBUG] 15:42:30:524084000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:42:30:530106000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 15:42:31:841041000: ollama_api_post: success
[DEBUG] 15:42:31:850766000: ollama_generate_json: success

#### The user asks: \"Describe a rabbit in 3 words\". That's straightforward, no policy violation. Provide three words: e.g., \"soft, timid, fluffy\". Provide answer.

Fluffy, timid, curious.
[DEBUG] 15:42:32:481077000: ollama_generate_stream: exit=0

```
