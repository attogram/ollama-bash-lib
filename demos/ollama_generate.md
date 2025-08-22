# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
Fluffy, long ears, swift.
```

## Demo Debug


```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 23:50:56:924975800: ollama_generate: [-m] [hf.co/bartowski/Ministral-8B-Instruct-2410] [-p] [Describe a rabbit in 3 words]
[DEBUG] 23:50:56:977191500: ollama_generate: init: model: [] prompt: []
[DEBUG] 23:50:57:001244600: ollama_generate: while getopts: OPTARG: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS] opt: [m]
[DEBUG] 23:50:57:023537900: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 23:50:57:056452900: ollama_generate: final: model: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS] prompt: [Describe a rabbit in 3 words]
[DEBUG] 23:50:57:076881700: ollama_generate: checking: model: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS]
[DEBUG] 23:50:57:103226600: ollama_generate: checked: model: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS]
[DEBUG] 23:50:57:147282000: ollama_generate_json: [hf.co/bartowski/Ministral-8B-Instruct-2410] [Describe a rabbit in 3 words]
[DEBUG] 23:50:57:196330300: ollama_generate_json: json_payload: {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","prompt":"Describe a rabbit in 3 words","stream":false
[DEBUG] 23:50:57:232160800: ollama_api_post: [/api/generate] {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","prompt":"Describe a rabbit in 3 words","stream":false
[DEBUG] 23:50:57:254119600: _call_curl: [POST] [/api/generate] {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","prompt":"Describe a rabbit in 3 words","stream":false
[DEBUG] 23:50:57:306542100: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 23:50:57:326983900: _call_curl: json_body: {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","prompt":"Describe a rabbit in 3 words","stream":false
[DEBUG] 23:50:57:353476700: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 23:50:57:912156100: ollama_api_post: success
[DEBUG] 23:50:57:932801600: ollama_generate_json: success
[DEBUG] 23:50:58:005907300: ollama_generate: result: 424 bytes: {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","created_at":"2025-08-22T21:50:57.8232843Z","response"
[DEBUG] 23:50:58:064821200: ollama_generate: thinking: off
Fluffy, quick, gentle.
[DEBUG] 23:50:58:144489200: ollama_generate: success
```
