# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

## Demo

```bash
ollama_generate_stream -m "gemma3n:e2b" -p "Describe a rabbit in 3 words"
```
```


Fluffy, twitchy, agile. 


```

## Demo Debug

```bash
`OBL_DEBUG=1 ollama_generate_stream -m "gemma3n:e2b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:05:11:805393600: ollama_generate_stream: model='gemma3n:e2b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 22:05:11:859371100: ollama_generate_json: [gemma3n:e2b] [Describe a rabbit in 3 words]
[DEBUG] 22:05:11:901099100: ollama_generate_json: json_payload: {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:05:11:939267000: ollama_api_post: [/api/generate] {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:05:11:974758100: _call_curl: [POST] [/api/generate] {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:05:12:020674700: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 22:05:12:043821600: _call_curl: json_body: {"model":"gemma3n:e2b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:05:12:065320600: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 22:05:12:992701700: ollama_api_post: success


**[DEBUG] 22:05:13:018126400: ollama_generate_json: success
Fluffy, quick, curious.** 

Or, if you want something a bit more descriptive:

**Ears, nose, hops.** 

[DEBUG] 22:05:14:203929400: ollama_generate_stream: exit=0

```
