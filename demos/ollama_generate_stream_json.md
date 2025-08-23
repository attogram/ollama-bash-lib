# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Demo

```bash
ollama_generate_stream_json -m "dolphin3:8b" -p "Describe a rabbit in 3 words"

```
```json
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:49.7558935Z",
  "response": "Fl",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:49.7888523Z",
  "response": "uffy",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:49.8123651Z",
  "response": " white",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:49.8379545Z",
  "response": " tail",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:49.8616457Z",
  "response": ".",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:49.8861242Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "context": [
    128257,
    9125,
    198,
    2675,
    527,
    96096,
    11,
    264,
    11190,
    15592,
    18328,
    13,
    128256,
    198,
    128257,
    882,
    198,
    75885,
    264,
    39824,
    304,
    220,
    18,
    4339,
    128256,
    198,
    128257,
    78191,
    198,
    3968,
    30977,
    4251,
    9986,
    13
  ],
  "total_duration": 1926263700,
  "load_duration": 1667241100,
  "prompt_eval_count": 30,
  "prompt_eval_duration": 123822500,
  "eval_count": 6,
  "eval_duration": 133173800
}
```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_stream_json -m "dolphin3:8b" -p "Describe a rabbit in 3 words"

```
```json
[DEBUG] 15:32:49:933538600: ollama_generate_stream_json: [dolphin3:8b] [Describe a rabbit in 3 words]
[DEBUG] 15:32:49:986604200: ollama_generate_json: [dolphin3:8b] [Describe a rabbit in 3 words]
[DEBUG] 15:32:50:028717100: ollama_generate_json: json_payload: {"model":"dolphin3:8b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:32:50:091050100: ollama_api_post: [/api/generate] {"model":"dolphin3:8b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:32:50:113857500: _call_curl: [POST] [/api/generate] {"model":"dolphin3:8b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:32:50:168392200: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 15:32:50:189274600: _call_curl: json_body: {"model":"dolphin3:8b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 15:32:50:209787000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 15:32:50:742011000: ollama_api_post: success
[DEBUG] 15:32:50:768442400: ollama_generate_json: success
[DEBUG] 15:32:50:799538800: ollama_generate_stream_json: success
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.5231527Z",
  "response": "C",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.5468148Z",
  "response": "ute",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.5703873Z",
  "response": ",",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.5951939Z",
  "response": " fluffy",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.6189876Z",
  "response": ",",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.6434702Z",
  "response": " and",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.6687835Z",
  "response": " lively",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.693321Z",
  "response": ".",
  "done": false
}
{
  "model": "dolphin3:8b",
  "created_at": "2025-08-23T13:32:50.7178722Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "context": [
    128257,
    9125,
    198,
    2675,
    527,
    96096,
    11,
    264,
    11190,
    15592,
    18328,
    13,
    128256,
    198,
    128257,
    882,
    198,
    75885,
    264,
    39824,
    304,
    220,
    18,
    4339,
    128256,
    198,
    128257,
    78191,
    198,
    34,
    1088,
    11,
    68661,
    11,
    323,
    49277,
    13
  ],
  "total_duration": 272196300,
  "load_duration": 51316000,
  "prompt_eval_count": 30,
  "prompt_eval_duration": 2556900,
  "eval_count": 9,
  "eval_duration": 217847900
}
```
