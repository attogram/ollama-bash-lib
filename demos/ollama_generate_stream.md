# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2

## Demo

```bash
ollama_generate_stream -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```

#### The user: \"Describe a rabbit in 3 words\". They probably want \"cute\", \"fluffy\", \"hare\". Or \"soft, swift, adorable\"? 3 words. Should be concise. So answer with something like \"Soft, quick, endearing\". That might be best. Or \"Playful, fluffy, swift\". 3 words. No additional commentary. Probably we answer with exactly 3 words. Choose: \"Cute, fluffy, fast\". Or \"Soft, quick, cute\". I think \"soft, quick, cute\" is fine. But could be \"playful, fluffy, agile\". That's also fine. We must ensure it's exactly 3 words. I will choose: \"Soft, quick, playful\". That covers. I'll output exactly those words. The output should be just the words, no quotes unless needed. I'll output: Soft, quick, playful. That's it.

Soft, quick, playful

```

## Demo Debug

```bash
`OBL_DEBUG=1 ollama_generate_stream -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 11:30:21:566419000: ollama_generate_stream: model='gpt-oss:20b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 11:30:21:574177000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 11:30:21:582984000: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:30:21:591179000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:30:21:595396000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:30:21:603471000: _call_curl: OBL_API: https://ollama.com
[DEBUG] 11:30:21:607370000: _call_curl: Turbo Mode
[DEBUG] 11:30:21:611278000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 11:30:21:615309000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:30:23:106058000: ollama_api_post: success
[DEBUG] 11:30:23:113767000: ollama_generate_json: success

#### The user requests: \"Describe a rabbit in 3 words\". They want a description that uses exactly 3 words. Should describe a rabbit. Probably something like \"Fluffy, graceful, playful\". But we need to think about the request: It's singular. The user wants three words. So we should offer a concise description. The best is \"Fluffy, graceful, playful\". Or \"Soft, swift, curious\". Or \"Cute, furry, nimble\". Any three words. I guess we can pick \"Soft, quick, curious\". Which exactly three words, separated by a comma and space. The user didn't specify formatting. It's basically a request for a description. Let's give them any coherent description. I'll choose \"Soft, swift, curious\". That's exactly three words: Soft, swift, curious. That matches a rabbit. Let's respond.

Soft, swift, curious.
[DEBUG] 11:30:24:766718000: ollama_generate_stream: exit=0

```
