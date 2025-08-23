# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Setup

OLLAMA_HOST: http://localhost:11434
OBL_API: http://localhost:11434


## Demo

```bash
ollama_generate_json -m "granite3.3:2b" -p "Describe a rabbit in 3 words"
```
```json
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-23T17:56:18.8180891Z",
  "response": "Fast, Fluffy, Burrowing.",
  "done": true,
  "done_reason": "stop",
  "context": [
    49152,
    2946,
    49153,
    39558,
    390,
    17071,
    2821,
    44,
    30468,
    225,
    36,
    34,
    36,
    38,
    32,
    203,
    4282,
    884,
    8080,
    278,
    659,
    30,
    18909,
    810,
    25697,
    32,
    2448,
    884,
    312,
    17247,
    19551,
    47330,
    32,
    0,
    203,
    49152,
    496,
    49153,
    8591,
    312,
    40810,
    328,
    225,
    37,
    8153,
    0,
    203,
    49152,
    17594,
    49153,
    12200,
    30,
    5449,
    2966,
    107,
    30,
    34630,
    643,
    299,
    32
  ],
  "total_duration": 1203194400,
  "load_duration": 985779500,
  "prompt_eval_count": 50,
  "prompt_eval_duration": 117790400,
  "eval_count": 11,
  "eval_duration": 97787200
}

```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_json -m "granite3.3:2b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 19:56:18:890341100: ollama_generate_json: [granite3.3:2b] [Describe a rabbit in 3 words]
[DEBUG] 19:56:18:941769400: ollama_generate_json: json_payload: {"model":"granite3.3:2b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 19:56:18:980143500: ollama_api_post: [/api/generate] {"model":"granite3.3:2b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 19:56:19:000915400: _call_curl: [POST] [/api/generate] {"model":"granite3.3:2b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 19:56:19:045773400: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 19:56:19:068263600: _call_curl: json_body: {"model":"granite3.3:2b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 19:56:19:089336900: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 19:56:19:479428700: ollama_api_post: success
[DEBUG] 19:56:19:506919200: ollama_generate_json: success
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-23T17:56:19.4470972Z",
  "response": "Fast, Furious, Breeding.",
  "done": true,
  "done_reason": "stop",
  "context": [
    49152,
    2946,
    49153,
    39558,
    390,
    17071,
    2821,
    44,
    30468,
    225,
    36,
    34,
    36,
    38,
    32,
    203,
    4282,
    884,
    8080,
    278,
    659,
    30,
    18909,
    810,
    25697,
    32,
    2448,
    884,
    312,
    17247,
    19551,
    47330,
    32,
    0,
    203,
    49152,
    496,
    49153,
    8591,
    312,
    40810,
    328,
    225,
    37,
    8153,
    0,
    203,
    49152,
    17594,
    49153,
    12200,
    30,
    506,
    305,
    2406,
    30,
    551,
    18749,
    299,
    32
  ],
  "total_duration": 123293000,
  "load_duration": 14684500,
  "prompt_eval_count": 50,
  "prompt_eval_duration": 1085800,
  "eval_count": 11,
  "eval_duration": 107522700
}

```
