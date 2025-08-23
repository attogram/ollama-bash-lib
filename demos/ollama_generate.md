# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
Cute, fluffy, and fast-moving.
```

## Demo Debug


```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 15:32:35:429171900: ollama_generate: [-m] [dolphin3:8b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 15:32:35:468262000: ollama_generate: init: model: [] prompt: []
[DEBUG] 15:32:35:489570300: ollama_generate: while getopts: OPTARG: [dolphin3:8b] opt: [m]
[DEBUG] 15:32:35:511840500: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 15:32:35:537158600: ollama_generate: final: model: [dolphin3:8b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 15:32:35:559616500: ollama_generate: checking: model: [dolphin3:8b]
[DEBUG] 15:32:35:583955100: ollama_generate: checked: model: [dolphin3:8b]
[DEBUG] 15:32:35:644889900: ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 3 words]
[DEBUG] 15:32:35:684773200: ollama_generate_json: json_payload: {"model":"dolphin3:8b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:32:35:722860400: ollama_api_post: [/api/generate] {"model":"dolphin3:8b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:32:35:757659800: _call_curl: [POST] [/api/generate] {"model":"dolphin3:8b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:32:35:818978600: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 15:32:35:844650000: _call_curl: json_body: {"model":"dolphin3:8b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:32:35:866758600: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 15:32:36:424820300: ollama_api_post: success
[DEBUG] 15:32:36:448715200: ollama_generate_json: success
[DEBUG] 15:32:36:516192000: ollama_generate: result: 480 bytes: {"model":"dolphin3:8b","created_at":"2025-08-23T13:32:36.3944121Z","response":"Fluffy, Ears, Hopper.","done":true,"done_
[DEBUG] 15:32:36:597235300: ollama_generate: thinking: off
Fluffy, Ears, Hopper.
[DEBUG] 15:32:36:676621700: ollama_generate: success
```
