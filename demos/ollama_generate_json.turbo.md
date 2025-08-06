# ollama_generate_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.15

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-06T22:53:37.523615307Z",
  "response": "Soft, fast, playful",
  "thinking": "We need to describe a rabbit in three words. The user says \"Describe a rabbit in 3 words\". So we must respond with exactly 3 words. Let's consider synonyms: \"fluffy\", \"quick\", \"cuddly\". That's 3. Or \"soft\", \"agile\", \"hoppy\". Ensure exactly three words. Avoid punctuation? We can do \"Fluffy, quick, cute\". That's four words? Actually \"Fluffy, quick, cute\" is 3 words with commas. Yes it's 3 words: Fluffy / quick / cute. Or \"Soft\", \"fast\", \"playful\". That's 3. I'll choose \"Soft\", \"fast\", \"playful\". Probably correct. Let's answer with three words.",
  "done": true,
  "total_duration": 730710214,
  "prompt_eval_count": 81,
  "eval_count": 167
}

```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate_json "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```json
[DEBUG] 00:53:38:084334400: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 00:53:38:095236400: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 00:53:38:118107800: ollama_api_post: [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:53:38:130182000: _call_curl: [POST] [/api/generate] [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:53:38:141175400: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:53:38:152501500: _call_curl: Turbo Mode
[DEBUG] 00:53:38:162550200: _call_curl: adding json body: [{"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false}]
[DEBUG] 00:53:39:360978600: ollama_api_post: success: return 0
[DEBUG] 00:53:39:371317400: ollama_generate_json: success: return: 0
{
  "model": "gpt-oss:20b",
  "created_at": "2025-08-06T22:53:38.733754222Z",
  "response": "Soft, swift, playful.",
  "thinking": "We need a description of a rabbit in 3 words. Likely something like \"fluffy, hopping, gentle\" or \"soft, swift, adorable.\" The user wants a very brief description. Let's give a succinct set of 3 words. Probably \"fluffy, swift, playful.\" Or \"cuddly, quick, gentle.\" We'll provide exactly three words. We'll output maybe \"soft, swift, playful.\" That is three words. Let's do \"soft, swift, playful.\"",
  "done": true,
  "total_duration": 570760357,
  "prompt_eval_count": 81,
  "eval_count": 115
}

```
