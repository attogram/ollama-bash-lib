# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Demo

```bash
ollama_generate_stream_json "tinyllama:latest" "Describe a rabbit in 3 words"

```
```json
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:37.982508737Z",
  "response": "L",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.047626313Z",
  "response": "ively",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.089173967Z",
  "response": ",",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.126288048Z",
  "response": " curious",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.200911039Z",
  "response": " and",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.234432393Z",
  "response": " play",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.268777527Z",
  "response": "ful",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.303596878Z",
  "response": ".",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.338733565Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "context": [
    529,
    29989,
    5205,
    29989,
    29958,
    13,
    3492,
    526,
    263,
    8444,
    319,
    29902,
    20255,
    29889,
    2,
    29871,
    13,
    29966,
    29989,
    1792,
    29989,
    29958,
    13,
    19617,
    1091,
    29872,
    263,
    27127,
    277,
    297,
    29871,
    29941,
    3838,
    2,
    29871,
    13,
    29966,
    29989,
    465,
    22137,
    29989,
    29958,
    13,
    23859,
    368,
    29892,
    12758,
    322,
    1708,
    1319,
    29889
  ],
  "total_duration": 428537752,
  "load_duration": 36486879,
  "prompt_eval_count": 44,
  "prompt_eval_duration": 33994307,
  "eval_count": 9,
  "eval_duration": 357116756
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "tinyllama:latest" "Describe a rabbit in 3 words"

```
```json
[DEBUG] 22:08:38:357058294: ollama_generate_stream_json: [tinyllama:latest] [Describe a rabbit in 3 words]
[DEBUG] 22:08:38:364687773: ollama_generate_json: [tinyllama:latest] [Describe a rabbit in 3 words]
[DEBUG] 22:08:38:375024076: ollama_generate_json: json_payload: {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:08:38:383010796: ollama_api_post: [/api/generate] {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:08:38:387208798: _call_curl: [POST] [/api/generate] {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:08:38:396833828: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 22:08:38:401151820: _call_curl: json_body: {"model":"tinyllama:latest","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:08:38:405355675: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 22:08:39:001854498: ollama_api_post: success
[DEBUG] 22:08:39:006375333: ollama_generate_json: success
[DEBUG] 22:08:39:010764443: ollama_generate_stream_json: success
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.487803419Z",
  "response": "Qu",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.533665506Z",
  "response": "ir",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.617924679Z",
  "response": "ky",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.654701468Z",
  "response": ",",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.722224733Z",
  "response": " play",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.757442281Z",
  "response": "ful",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.801153834Z",
  "response": ",",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.87740097Z",
  "response": " and",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.91166456Z",
  "response": " curious",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.953391386Z",
  "response": ".",
  "done": false
}
{
  "model": "tinyllama:latest",
  "created_at": "2025-08-20T22:08:38.987707952Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "context": [
    529,
    29989,
    5205,
    29989,
    29958,
    13,
    3492,
    526,
    263,
    8444,
    319,
    29902,
    20255,
    29889,
    2,
    29871,
    13,
    29966,
    29989,
    1792,
    29989,
    29958,
    13,
    19617,
    1091,
    29872,
    263,
    27127,
    277,
    297,
    29871,
    29941,
    3838,
    2,
    29871,
    13,
    29966,
    29989,
    465,
    22137,
    29989,
    29958,
    13,
    2182,
    6793,
    29891,
    29892,
    1708,
    1319,
    29892,
    322,
    12758,
    29889
  ],
  "total_duration": 571046645,
  "load_duration": 33738378,
  "prompt_eval_count": 44,
  "prompt_eval_duration": 34785649,
  "eval_count": 11,
  "eval_duration": 501304567
}
```
