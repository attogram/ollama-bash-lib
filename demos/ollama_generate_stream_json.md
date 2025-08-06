# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

## Demo

```bash
ollama_generate_stream_json "granite3.3:2b" "Describe a rabbit in 3 words"

```
```json
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.44845Z",
  "response": "Fl",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.471261Z",
  "response": "uff",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.493999Z",
  "response": "y",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.516628Z",
  "response": " Bur",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.539586Z",
  "response": "row",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.562864Z",
  "response": "er",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.586116Z",
  "response": ".",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.608859Z",
  "response": "",
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
    2134,
    2966,
    107,
    34630,
    643,
    265,
    32
  ],
  "total_duration": 269377500,
  "load_duration": 24999375,
  "prompt_eval_count": 50,
  "prompt_eval_duration": 82861916,
  "eval_count": 8,
  "eval_duration": 160765500
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "granite3.3:2b" "Describe a rabbit in 3 words"

```
```json
[DEBUG] 14:11:36:624793000: ollama_generate_stream_json: [granite3.3:2b] [Describe a rabbit in 3 words]
[DEBUG] 14:11:36:635250000: ollama_generate_json: [granite3.3:2b] [Describe a rabbit in 3 words]
[DEBUG] 14:11:36:644732000: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 14:11:36:662078000: ollama_api_post: [/api/generate] [{"model":"granite3.3:2b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 14:11:36:672351000: _call_curl: [POST] [/api/generate] [{"model":"granite3.3:2b","prompt":"Describe a rabbit in 3 words","stream":true}]
[DEBUG] 14:11:36:680490000: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 14:11:36:687675000: _call_curl: adding json body
[DEBUG] 14:11:36:887478000: ollama_api_post: success: return 0
[DEBUG] 14:11:36:898968000: ollama_generate_json: return: 0
[DEBUG] 14:11:36:908175000: ollama_generate_stream_json: return: 0
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.769347Z",
  "response": "Fl",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.792747Z",
  "response": "uff",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.817289Z",
  "response": "y",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.843442Z",
  "response": " Rabbit",
  "done": false
}
{
  "model": "granite3.3:2b",
  "created_at": "2025-08-06T12:11:36.871224Z",
  "response": "",
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
    2134,
    2966,
    107,
    36528
  ],
  "total_duration": 161695791,
  "load_duration": 27544916,
  "prompt_eval_count": 50,
  "prompt_eval_duration": 30555208,
  "eval_count": 5,
  "eval_duration": 102487917
}
```
