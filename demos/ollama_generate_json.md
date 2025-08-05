# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_generate_json "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L" "Describe a rabbit in 3 words"
```
```json
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-05T19:03:50.4893098Z",
  "response": "Fluffy, Hoppy, Sweet",
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
    9025,
    1044,
    48126
  ],
  "total_duration": 4940103900,
  "load_duration": 4416111500,
  "prompt_eval_count": 11,
  "prompt_eval_duration": 169790900,
  "eval_count": 8,
  "eval_duration": 353148400
}

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_json "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 21:03:50:515983000: ollama_generate_json: [hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L] [Describe a rabbit in 3 words]
[DEBUG] 21:03:50:531008100: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 21:03:50:558842300: ollama_api_post: [/api/generate] [{
  "model": "hf.co/bartowski/Ministral-8B]
[DEBUG] 21:03:51:287914200: ollama_api_post: return 0
[DEBUG] 21:03:51:298712000: ollama_generate_json: return: 0
{
  "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
  "created_at": "2025-08-05T19:03:51.2679926Z",
  "response": "Fluffy, quick, long ears.",
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
    7586,
    1044,
    2730,
    32961,
    1046
  ],
  "total_duration": 458483300,
  "load_duration": 28943800,
  "prompt_eval_count": 11,
  "prompt_eval_duration": 47405600,
  "eval_count": 9,
  "eval_duration": 381626400
}

```
