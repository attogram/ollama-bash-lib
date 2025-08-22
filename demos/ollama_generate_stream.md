# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1

## Demo

```bash
ollama_generate_stream -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"
```
```

#### The user wants a description of a rabbit in 3 words. Likely a short phrase. Must be exactly three words. They didn't specify more constraints. Provide something vivid? Could be \"fluffy, quick, curious\". That's three words with commas? Likely they want three separate words. Provide maybe \"soft, swift, playful\". That's three words. Provide maybe \"gentle, swift, fluffy\". That's three. I'll output just the three words. Possibly with commas? But they'd likely want simple words. I think \"soft, swift, playful\" is good. I'll just answer that.

soft, swift, playful

```

## Demo Debug

```bash
`OBL_DEBUG=1 ollama_generate_stream -m "gpt-oss:20b" -p "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:43:41:618435700: ollama_generate_stream: model='gpt-oss:20b'  prompt='Describe a rabbit in 3 words'
[DEBUG] 22:43:41:685715000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 22:43:41:731419500: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:43:41:782424100: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:43:41:808657100: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:43:41:855671600: _call_curl: OBL_API: https://ollama.com
[DEBUG] 22:43:41:880729100: _call_curl: Turbo Mode
[DEBUG] 22:43:41:908499600: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":true,"thinking":false}
[DEBUG] 22:43:41:930590100: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 22:43:43:860666700: ollama_api_post: success
[DEBUG] 22:43:43:891157900: ollama_generate_json: success

#### We need to respond to \"Describe a rabbit in 3 words\". The instruction: \"Describe a rabbit in 3 words\". So we need a 3 word description. So output three words describing a rabbit. Eg: \"Soft, cute, nimble\". Or \"Fluffy, swift, rabbit.\" We need exactly 3 words. Could be \"Soft, swift, hop\". We need to comply. Also we need to consider no extra commentary. Possibly no explanation. Just the 3 words. Let's produce \"Soft, swift, hop\". That is 3 words. Might want \"Cuddly, agile, hopper\". Ok.

Need to ensure it's exactly 3 words separated by spaces or punctuation. Let's use comma separated.

I'll give \"Soft, swift, hopping\". That is 3 words: Soft, swift, hopping.

Better: \"Soft, swift, hopping\" or \"Fluffy, quick, ears\" But ears is not an adjective. I think \"Soft, swift, hopping\" is good.

Ok.

Soft, swift, hopping
[DEBUG] 22:43:53:236336100: ollama_generate_stream: exit=0

```
