# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

## Demo

```bash
ollama_generate_stream_json "granite3.3:8b" "Describe a rabbit in 3 words"

```
```json
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.4390426Z",
  "response": "C",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.4708103Z",
  "response": "ute",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.4942571Z",
  "response": ",",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.5175188Z",
  "response": " Long",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.5413811Z",
  "response": "-",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.5645489Z",
  "response": "e",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.5877175Z",
  "response": "ared",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.6108184Z",
  "response": ",",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.6337587Z",
  "response": " H",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.6567211Z",
  "response": "op",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.6796406Z",
  "response": "ping",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.7035534Z",
  "response": " m",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.7264562Z",
  "response": "am",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.7500284Z",
  "response": "mal",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.7732668Z",
  "response": ".",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:47.7991835Z",
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
    53,
    1142,
    30,
    6359,
    31,
    87,
    1941,
    30,
    677,
    520,
    7075,
    345,
    404,
    7904,
    32
  ],
  "total_duration": 3657843600,
  "load_duration": 3145866000,
  "prompt_eval_count": 50,
  "prompt_eval_duration": 148869500,
  "eval_count": 16,
  "eval_duration": 362301800
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "granite3.3:8b" "Describe a rabbit in 3 words"

```
```json
[DEBUG] ollama_generate_stream_json: [granite3.3:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [granite3.3:8b] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "granite3.3:8b",
  "prompt": ]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.0957676Z",
  "response": "Small",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.1186141Z",
  "response": ",",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.1415567Z",
  "response": " long",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.1647618Z",
  "response": "-",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.1876506Z",
  "response": "e",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.213946Z",
  "response": "ared",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.2344091Z",
  "response": ",",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.2577346Z",
  "response": " her",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.2806825Z",
  "response": "b",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.3035675Z",
  "response": "iv",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.3264919Z",
  "response": "ore",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.3494345Z",
  "response": ".",
  "done": false
}
{
  "model": "granite3.3:8b",
  "created_at": "2025-08-04T18:29:48.3724181Z",
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
    1946,
    31,
    87,
    1941,
    30,
    7791,
    84,
    387,
    686,
    32
  ],
  "total_duration": 313968300,
  "load_duration": 11522900,
  "prompt_eval_count": 50,
  "prompt_eval_duration": 2606100,
  "eval_count": 13,
  "eval_duration": 299158500
}
```
