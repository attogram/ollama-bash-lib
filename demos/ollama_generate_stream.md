# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Demo

```bash
ollama_generate_stream "tinyllama:latest" "Describe a rabbit in 3 words"
```
```
Cuddly,playfulandcute

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "tinyllama:latest" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:08:37:026086770: ollama_generate_stream: [tinyllama:latest] [Describe a rabbit in 3 words]
# <thinking>
# [DEBUG] 22:08:37:035118710: ollama_generate_json: [tinyllama:latest] [Describe a rabbit in 3 words]
[DEBUG] 22:08:37:045304864: ollama_generate_json: json_payload: {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:08:37:052889904: ollama_api_post: [/api/generate] {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:08:37:057288109: _call_curl: [POST] [/api/generate] {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:08:37:066909644: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:08:37:071348376: _call_curl: json_body: {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:08:37:075752251: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
S[DEBUG] 22:08:37:741253522: ollama_api_post: success
weet[DEBUG] 22:08:37:746742488: ollama_generate_json: success
,playful,andcurious.

# </thinking>

[DEBUG] 22:08:37:785352121: ollama_generate_stream: success

```
