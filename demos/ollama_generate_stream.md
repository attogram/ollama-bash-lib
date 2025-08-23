# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Demo

```bash
ollama_generate_stream -m "gemma3n:e2b" -p "Describe a rabbit in 3 words"
```
```


Fluffy, agile, curious. 


```

## Demo Debug

```bash
`OBL_DEBUG=1 ollama_generate_stream -m "gemma3n:e2b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 19:56:25:978438200: ollama_generate_stream: model='gemma3n:e2b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 19:56:26:030505800: ollama_generate_json: [gemma3n:e2b] [Describe a rabbit in 3 words]
[DEBUG] 19:56:26:088698800: ollama_generate_json: json_payload: {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 19:56:26:128819300: ollama_api_post: [/api/generate] {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 19:56:26:161660500: _call_curl: [POST] [/api/generate] {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 19:56:26:202368300: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 19:56:26:225506400: _call_curl: json_body: {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 19:56:26:252023200: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 19:56:26:823984200: ollama_api_post: success


**[DEBUG] 19:56:26:845263200: ollama_generate_json: success
Fluffy, agile, curious.** 

[DEBUG] 19:56:27:227288500: ollama_generate_stream: exit=0

```
