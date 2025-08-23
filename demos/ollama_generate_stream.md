# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Demo

```bash
ollama_generate_stream -m "smollm2:1.7b" -p "Describe a rabbit in 3 words"
```
```


Cute, fluffy, bunny.

```

## Demo Debug

```bash
`OBL_DEBUG=1 ollama_generate_stream -m "smollm2:1.7b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 15:32:46:055409700: ollama_generate_stream: model='smollm2:1.7b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 15:32:46:130925300: ollama_generate_json: [smollm2:1.7b] [Describe a rabbit in 3 words]
[DEBUG] 15:32:46:169769000: ollama_generate_json: json_payload: {"model":"smollm2:1.7b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:32:46:206338000: ollama_api_post: [/api/generate] {"model":"smollm2:1.7b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:32:46:229092000: _call_curl: [POST] [/api/generate] {"model":"smollm2:1.7b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:32:46:271576200: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 15:32:46:292532000: _call_curl: json_body: {"model":"smollm2:1.7b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:32:46:314752000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 15:32:46:709620200: ollama_api_post: success


C[DEBUG] 15:32:46:730752800: ollama_generate_json: success
ute, fluffy, hoppy.
[DEBUG] 15:32:47:031789700: ollama_generate_stream: exit=0

```
