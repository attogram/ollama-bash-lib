# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11

## Demo

```bash
ollama_generate_stream -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"
```
```

#### The user asks: \"Describe a rabbit in 3 words\". That's straightforward, not disallowed. Should comply. Provide three words describing a rabbit. Could be \"fluffy, timid, swift\" etc. Provide answer.

Fluffy, timid, swift.

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream -m "gpt-oss:120b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 15:52:08:867601000: ollama_generate_stream: model='gpt-oss:120b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 15:52:08:876601000: ollama_generate_json: [gpt-oss:120b] [Describe a rabbit in 3 words]
[DEBUG] 15:52:08:885654000: ollama_generate_json: json_payload: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:52:08:893722000: ollama_api_post: [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:52:08:898000000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:52:08:906964000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:52:08:911266000: _call_curl: Turbo Mode
[DEBUG] 15:52:08:915427000: _call_curl: json_body: {"model":"gpt-oss:120b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:52:08:919444000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 15:52:10:395490000: ollama_api_post: success
[DEBUG] 15:52:10:403872000: ollama_generate_json: success

#### The user ask to \"Describe a rabbit in 3 words\". That's straightforward: we can respond with three adjectives like \"fluffy, timid, adorable\". No policy issues. Provide answer.

Fluffy, timid, adorable.
[DEBUG] 15:52:10:884174000: ollama_generate_stream: exit=0

```
