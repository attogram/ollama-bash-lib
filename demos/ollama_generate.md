# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Setup

OLLAMA_HOST: http://localhost:11434
OLLAMA_LIB_API: http://localhost:11434


## Demo

```bash
ollama_generate "tinyllama:latest" "Describe a rabbit in 3 words"
```
```
Intriguing, intelligent, and playful.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "tinyllama:latest" "Describe a rabbit in 3 words"
```
```
[DEBUG] 22:08:30:359670063: ollama_generate: [tinyllama:latest] [Describe a rabbit in 3 words]
[DEBUG] 22:08:30:367684360: ollama_generate_json: [tinyllama:latest] [Describe a rabbit in 3 words]
[DEBUG] 22:08:30:377962918: ollama_generate_json: json_payload: {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:08:30:385349081: ollama_api_post: [/api/generate] {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:08:30:389590405: _call_curl: [POST] [/api/generate] {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:08:30:399095424: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:08:30:403367952: _call_curl: json_body: {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 22:08:30:407568711: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 22:08:31:375963827: ollama_api_post: success
[DEBUG] 22:08:31:380305085: ollama_generate_json: success
[DEBUG] 22:08:31:388604712: ollama_generate: result: 667 bytes: {"model":"tinyllama:latest","created_at":"2025-08-20T22:08:31.363151079Z","response":"Crafty, curious and quirky: a desc
[DEBUG] 22:08:31:404021928: ollama_generate: thinking: off
Crafty, curious and quirky: a description of a rabbit in three words!
[DEBUG] 22:08:31:419666227: ollama_generate: success
```
