# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
Cute, fluffy, adventurous.
```

## Demo Debug


```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 19:56:15:657322000: ollama_generate: [-m] [smollm2:1.7b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 19:56:15:727768300: ollama_generate: init: model: [] prompt: []
[DEBUG] 19:56:15:748958400: ollama_generate: while getopts: OPTARG: [smollm2:1.7b] opt: [m]
[DEBUG] 19:56:15:771258600: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 19:56:15:791877300: ollama_generate: final: model: [smollm2:1.7b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 19:56:15:822072000: ollama_generate: checking: model: [smollm2:1.7b]
[DEBUG] 19:56:15:843737300: ollama_generate: checked: model: [smollm2:1.7b]
[DEBUG] 19:56:15:889406100: ollama_generate_json: [smollm2:1.7b] [Describe a rabbit in 3 words]
[DEBUG] 19:56:15:927197800: ollama_generate_json: json_payload: {"model":"smollm2:1.7b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 19:56:15:977858600: ollama_api_post: [/api/generate] {"model":"smollm2:1.7b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 19:56:16:000354200: _call_curl: [POST] [/api/generate] {"model":"smollm2:1.7b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 19:56:16:040814100: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 19:56:16:064366400: _call_curl: json_body: {"model":"smollm2:1.7b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 19:56:16:085589700: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 19:56:16:469116000: ollama_api_post: success
[DEBUG] 19:56:16:498336000: ollama_generate_json: success
[DEBUG] 19:56:16:561138500: ollama_generate: result: 497 bytes: {"model":"smollm2:1.7b","created_at":"2025-08-23T17:56:16.4462811Z","response":"Plush: fluffy, bunny, cute.","done":true
[DEBUG] 19:56:16:637826500: ollama_generate: thinking: off
Plush: fluffy, bunny, cute.
[DEBUG] 19:56:16:732610200: ollama_generate: success
```
