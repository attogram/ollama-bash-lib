# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

## Demo

```bash
ollama_generate_stream -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```

#### We need to be concise: likely \"furry, swift, gentle\". Provide answer: It's three words. Done.

Furry, swift, gentle.

```

## Demo Debug

```bash
`OBL_DEBUG=1 ollama_generate_stream -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 13:02:23:997436800: ollama_generate_stream: model='gpt-oss:20b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 13:02:24:051874800: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 13:02:24:092485600: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 13:02:24:130432700: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 13:02:24:151171500: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 13:02:24:199663800: _call_curl: OBL_API: https://ollama.com
[DEBUG] 13:02:24:221931000: _call_curl: Turbo Mode
[DEBUG] 13:02:24:243645900: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 13:02:24:267624200: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 13:02:25:867075400: ollama_api_post: success
[DEBUG] 13:02:25:895979900: ollama_generate_json: success

#### The user: \"Describe a rabbit in 3 words\". We need a succinct description of a rabbit using exactly 3 words (a phrase of 3 words). The instruction: \"Describe a rabbit in 3 words\". So we should respond with 3 words, describing a rabbit. Likely \"fluffy, swift, gentle\" - that's 3 words. But they might want a 3-word phrase: \"soft, quick, curious\" or \"fluffy, hopping, innocent\". The instruction is presumably to use 3 words. It's straightforward. No nuance.

We must be careful that it's exactly 3 words. The words themselves can be separated by spaces, punctuation, maybe commas. I think they want three words. Let's give something like: \"Soft, quick, curious\". That's 3 words separated by commas. Or \"Fluffy, swift, gentle\". That seems nice. Or \"Gentle, playful, hop\". But better to be descriptive: \"Fluffy, quick, gentle\". That's indeed 3 words: Fluffy (1), quick (2), gentle (3). Let's answer that.

Fluffy, quick, gentle.
[DEBUG] 13:02:34:495320600: ollama_generate_stream: exit=0

```
