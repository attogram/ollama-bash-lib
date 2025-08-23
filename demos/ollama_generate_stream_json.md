# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

## Demo

```bash
ollama_generate_stream_json -m "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS" -p "Describe a rabbit in 3 words"

```
```json
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:31.7665828Z",
  "response": "Fl",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:31.8168184Z",
  "response": "uffy",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:31.8549977Z",
  "response": ",",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:31.8941469Z",
  "response": " Hop",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:31.9332791Z",
  "response": "ping",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:31.9724884Z",
  "response": ",",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.011444Z",
  "response": " Sweet",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.0514112Z",
  "response": ".",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.0890021Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "context": [
    3,
    5847,
    13089,
    1261,
    40710,
    1294,
    1032,
    1051,
    6619,
    4,
    20961,
    124603,
    1044,
    29702,
    10577,
    1044,
    48126,
    1046
  ],
  "total_duration": 3951086200,
  "load_duration": 3462752200,
  "prompt_eval_count": 11,
  "prompt_eval_duration": 164770300,
  "eval_count": 9,
  "eval_duration": 323058600
}
```

## Demo Debug

```bash
OBL_DEBUG=1 ollama_generate_stream_json -m "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS" -p "Describe a rabbit in 3 words"

```
```json
[DEBUG] 19:56:32:137390300: ollama_generate_stream_json: [hf.co/bartowski/Ministral-8B-Instruct-2410] [Describe a rabbit in 3 words]
[DEBUG] 19:56:32:176921400: ollama_generate_json: [hf.co/bartowski/Ministral-8B-Instruct-2410] [Describe a rabbit in 3 words]
[DEBUG] 19:56:32:217589400: ollama_generate_json: json_payload: {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","prompt":"Describe a rabbit in 3 words","stream":true,
[DEBUG] 19:56:32:257125500: ollama_api_post: [/api/generate] {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","prompt":"Describe a rabbit in 3 words","stream":true,
[DEBUG] 19:56:32:295122900: _call_curl: [POST] [/api/generate] {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","prompt":"Describe a rabbit in 3 words","stream":true,
[DEBUG] 19:56:32:340678100: _call_curl: OBL_API: http://localhost:11434
[DEBUG] 19:56:32:388253000: _call_curl: json_body: {"model":"hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS","prompt":"Describe a rabbit in 3 words","stream":true,
[DEBUG] 19:56:32:410299400: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -X POST http://localhost:11434/api/generate -d @-
[DEBUG] 19:56:33:089197900: ollama_api_post: success
[DEBUG] 19:56:33:110010100: ollama_generate_json: success
[DEBUG] 19:56:33:132141300: ollama_generate_stream_json: success
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.738809Z",
  "response": "Fl",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.7787257Z",
  "response": "uffy",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.8180388Z",
  "response": ",",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.8579986Z",
  "response": " long",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.8970407Z",
  "response": "-e",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.9362882Z",
  "response": "ared",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:32.9760765Z",
  "response": ",",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:33.0163282Z",
  "response": " quick",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
  "created_at": "2025-08-23T17:56:33.0566215Z",
  "response": "",
  "done": true,
  "done_reason": "stop",
  "context": [
    3,
    5847,
    13089,
    1261,
    40710,
    1294,
    1032,
    1051,
    6619,
    4,
    20961,
    124603,
    1044,
    2730,
    7058,
    2789,
    1044,
    7586
  ],
  "total_duration": 405643600,
  "load_duration": 46574800,
  "prompt_eval_count": 11,
  "prompt_eval_duration": 40020100,
  "eval_count": 9,
  "eval_duration": 318535700
}
```
