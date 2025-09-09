# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

## Demo

```bash
ollama_generate_stream_json -m "deepseek-v3.1:671b" -p "Describe a rabbit in 3 words"

```
```json
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.0067779Z",
  "response": "",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.006807581Z",
  "response": "Fluffy",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.006818787Z",
  "response": ",",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.028402384Z",
  "response": " ho",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.053017295Z",
  "response": "ppy",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.053030842Z",
  "response": ",",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.053037399Z",
  "response": " tw",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.108303642Z",
  "response": "itch",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.108317945Z",
  "response": "y",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.108324981Z",
  "response": ".",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.108333073Z",
  "response": "",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.108336154Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "total_duration": 737855362,
  "prompt_eval_count": 11,
  "eval_count": 11
}
```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_stream_json -m "deepseek-v3.1:671b" -p "Describe a rabbit in 3 words"

```
```json
[DEBUG] 23:51:17:439872402: ollama_generate_stream_json: [deepseek-v3.1:671b] [Describe a rabbit in 3 words]
[DEBUG] 23:51:17:445086364: ollama_generate_json: [deepseek-v3.1:671b] [Describe a rabbit in 3 words]
[DEBUG] 23:51:17:452012328: ollama_generate_json: json_payload: {"model":"deepseek-v3.1:671b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:51:17:457814772: ollama_api_post: [/api/generate] {"model":"deepseek-v3.1:671b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:51:17:460566665: _call_curl: [POST] [/api/generate] {"model":"deepseek-v3.1:671b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:51:17:466760536: _call_curl: OBL_API: https://ollama.com
[DEBUG] 23:51:17:469695818: _call_curl: Turbo Mode
[DEBUG] 23:51:17:472367178: _call_curl: json_body: {"model":"deepseek-v3.1:671b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 23:51:17:475070962: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:51:18:360975121: ollama_api_post: success
[DEBUG] 23:51:18:364536360: ollama_generate_json: success
[DEBUG] 23:51:18:367655570: ollama_generate_stream_json: success
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.869411115Z",
  "response": "",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.89843683Z",
  "response": "Fluffy",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.89844979Z",
  "response": ",",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.907885787Z",
  "response": " ho",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.924563898Z",
  "response": "ppy",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.924577585Z",
  "response": ",",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.924584335Z",
  "response": " tw",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.945412998Z",
  "response": "itch",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.94542253Z",
  "response": "y",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.977366278Z",
  "response": ".",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.977380159Z",
  "response": "",
  "done": false
}
{
  "model": "deepseek-v3.1:671b",
  "created_at": "2025-09-09T21:51:17.9773841Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "total_duration": 357178018,
  "prompt_eval_count": 11,
  "eval_count": 11
}
```
