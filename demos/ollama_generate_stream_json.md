# ollama_generate_stream_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

## Demo

```bash
ollama_generate_stream_json "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L" "Describe a rabbit in 3 words"

```
```json
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:29.8607182Z",
  "response": "Fl",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:29.9133926Z",
  "response": "uffy",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:29.9607856Z",
  "response": ",",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.0077167Z",
  "response": " C",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.0552342Z",
  "response": "ute",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.1021611Z",
  "response": ",",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.1492191Z",
  "response": " Fast",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.1962872Z",
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
    1359,
    2654,
    1044,
    35882
  ],
  "total_duration": 5061541600,
  "load_duration": 4567125100,
  "prompt_eval_count": 11,
  "prompt_eval_duration": 156343100,
  "eval_count": 8,
  "eval_duration": 337517200
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_stream_json "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L" "Describe a rabbit in 3 words"

```
```json
[DEBUG] ollama_generate_stream_json: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L] [Describe a rabbit in 3 words]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] ollama_api_post: [/api/generate] [{
  "model": "hf.co/bartowski/Ministral-8B]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate_stream_json: return: 0
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.5439879Z",
  "response": "Fl",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.5873501Z",
  "response": "uffy",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.6298899Z",
  "response": ",",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.6731762Z",
  "response": " fast",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.7163638Z",
  "response": ",",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.7610813Z",
  "response": " gentle",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.8063124Z",
  "response": ".",
  "done": false
}
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-04T18:19:30.8526746Z",
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
    7720,
    1044,
    26905,
    1046
  ],
  "total_duration": 381325000,
  "load_duration": 27533500,
  "prompt_eval_count": 11,
  "prompt_eval_duration": 40687800,
  "eval_count": 8,
  "eval_duration": 312010800
}
```
