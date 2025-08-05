# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_generate_stream_json "granite3.3:8b" "Describe a rabbit in 3 words"

```
```json
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:30.9580142Z",
  "response": "Small",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:30.9923896Z",
  "response": ",",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.0218186Z",
  "response": " fl",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.0503995Z",
  "response": "uff",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.0793871Z",
  "response": "y",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.1093169Z",
  "response": ",",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.1376743Z",
  "response": " hop",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.1666235Z",
  "response": "ping",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.1953127Z",
  "response": " m",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.2205082Z",
  "response": "am",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.245613Z",
  "response": "mal",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.2706611Z",
  "response": ".",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.2942663Z",
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
    12470,
    30,
    2022,
    2966,
    107,
    30,
    23592,
    7075,
    345,
    404,
    7904,
    32
  ],
  "total_duration": 3706470300,
  "load_duration": 3199554900,
  "prompt_eval_count": 50,
  "prompt_eval_duration": 116665300,
  "eval_count": 13,
  "eval_duration": 388798400
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "granite3.3:8b" "Describe a rabbit in 3 words"

```
```json
[DEBUG] 21:05:31:319880100: ollama_generate_stream_json: [granite3.3:8b] [Describe a rabbit in 3 words]
[DEBUG] 21:05:31:331116800: ollama_generate_json: [granite3.3:8b] [Describe a rabbit in 3 words]
[DEBUG] 21:05:31:342567200: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 21:05:31:365304100: ollama_api_post: [/api/generate] [{
  "model": "granite3.3:8b",
  "prompt": ]
[DEBUG] 21:05:31:959852300: ollama_api_post: return 0
[DEBUG] 21:05:31:970877300: ollama_generate_json: return: 0
[DEBUG] 21:05:31:981458800: ollama_generate_stream_json: return: 0
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.6456739Z",
  "response": "Small",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.6716611Z",
  "response": ",",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.6951003Z",
  "response": " fl",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.7198303Z",
  "response": "uff",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.7440006Z",
  "response": "y",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.7679769Z",
  "response": ",",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.7927808Z",
  "response": " hop",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.8174993Z",
  "response": "ping",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.8421396Z",
  "response": " m",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.8673769Z",
  "response": "am",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.8910913Z",
  "response": "mal",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.9155029Z",
  "response": ".",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-05T19:05:31.940533Z",
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
    12470,
    30,
    2022,
    2966,
    107,
    30,
    23592,
    7075,
    345,
    404,
    7904,
    32
  ],
  "total_duration": 330760000,
  "load_duration": 9835200,
  "prompt_eval_count": 50,
  "prompt_eval_duration": 1057900,
  "eval_count": 13,
  "eval_duration": 319346100
}
```
