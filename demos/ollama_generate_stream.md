# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

## Demo

```bash
ollama_generate_stream -m "deepseek-v3.1:671b" -p "Describe a rabbit in 3 words"
```
```
Fluffy, hopper, gentle.

```

## Demo Debug

```bash
`OBL_DEBUG=1 ollama_generate_stream -m "deepseek-v3.1:671b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 23:51:14:956616041: ollama_generate_stream: model='deepseek-v3.1:671b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 23:51:14:962073151: ollama_generate_json: [deepseek-v3.1:671b] [Describe a rabbit in 3 words]
[DEBUG] 23:51:14:968957274: ollama_generate_json: json_payload: {"model":"deepseek-v3.1:671b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:51:14:974638319: ollama_api_post: [/api/generate] {"model":"deepseek-v3.1:671b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:51:14:977433796: _call_curl: [POST] [/api/generate] {"model":"deepseek-v3.1:671b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:51:14:984690040: _call_curl: OBL_API: https://ollama.com
[DEBUG] 23:51:14:987641510: _call_curl: Turbo Mode
[DEBUG] 23:51:14:990569295: _call_curl: json_body: {"model":"deepseek-v3.1:671b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:51:14:993823201: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:51:15:478525731: ollama_api_post: success
[DEBUG] 23:51:15:481834266: ollama_generate_json: success
Fluffy, twitchy-nosed, hopper.
[DEBUG] 23:51:15:576379620: ollama_generate_stream: exit=0

```
