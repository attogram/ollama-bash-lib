# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-21T13:52:04.538408341Z",
  "response": "Soft, curious, swift.",
  "thinking": "The user says: \"Describe a rabbit in 3 words\". They want a description in exactly 3 words. We need to respond. The answer needs to be 3 words that describe a rabbit. They didn't specify anything else, so maybe \"fluffy, playful, timid\" or \"soft, curious, speedy\". Let's produce 3 words. Let's give 3 distinct adjectives separated by commas. The user just wants 3 words. Let's be concise.",
  "done": true,
  "total_duration": 1324981782,
  "prompt_eval_count": 81,
  "eval_count": 109
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```json
[DEBUG] 15:52:04:853467000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 15:52:04:870107000: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:52:04:883254000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:52:04:890205000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:52:04:903268000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 15:52:04:909618000: _call_curl: Turbo Mode
[DEBUG] 15:52:04:915667000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 15:52:04:921339000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 15:52:06:268117000: ollama_api_post: success
[DEBUG] 15:52:06:276608000: ollama_generate_json: success
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-21T13:52:05.957770057Z",
  "response": "fluffy, quick, curious",
  "thinking": "We need 3 words describing a rabbit. Probably \"fluffy, swift, gentle\" etc. But should follow instructions: \"Describe a rabbit in 3 words\". So just list three words. Keep it minimal. Might present as \"fluffy, swift, curious\" etc.\n\nWe can choose: \"soft, clever, quick\" but better: \"fluffy, gentle, energetic\". Many options. Let's give one. I'll choose \"fluffy, quick, curious\". Provide exactly 3 words.",
  "done": true,
  "total_duration": 867800566,
  "prompt_eval_count": 81,
  "eval_count": 118
}

```
