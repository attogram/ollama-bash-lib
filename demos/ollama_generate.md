# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.9

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
#### <thinking>
#### We need to respond with a description of a rabbit in 3 words. Probably like "soft, hopping, whiskers". They want 3 words. Should be descriptive. Could be "fluffy, graceful, curious". "Endearing, twitching, quick". They want a short phrase of 3 words. Let's produce one.

We need to output just three words I guess. Might include quotes? They didn't specify formatting. Just output 3 words separated by spaces or punctuation? I'll output: "Soft, swift, playful".

In 3 words: "Soft, swift, playful". That's 3 words. Alternatively: "Soft, swift, playful". Good.
#### </thinking>

Soft, swift, playful
```

## Demo Debug


```
OLLAMA_LIB_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 11:55:06:091037000: ollama_generate: [-m] [gpt-oss:20b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 11:55:06:102946000: ollama_generate: init: model: [] prompt: []
[DEBUG] 11:55:06:108104000: ollama_generate: while getopts: OPTARG: [gpt-oss:20b] opt: [m]
[DEBUG] 11:55:06:112819000: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 11:55:06:117856000: ollama_generate: final: model: [gpt-oss:20b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 11:55:06:123589000: ollama_generate: checking: model: [gpt-oss:20b]
[DEBUG] 11:55:06:128278000: ollama_generate: checked: model: [gpt-oss:20b]
[DEBUG] 11:55:06:137688000: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 11:55:06:148493000: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:55:06:156780000: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:55:06:161169000: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:55:06:172248000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 11:55:06:177536000: _call_curl: Turbo Mode
[DEBUG] 11:55:06:182223000: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 11:55:06:186910000: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 11:55:07:748053000: ollama_api_post: success
[DEBUG] 11:55:07:761170000: ollama_generate_json: success
[DEBUG] 11:55:07:776735000: ollama_generate: result: 699 bytes: {"model":"gpt-oss:20b","created_at":"2025-08-21T09:55:07.206703855Z","response":"Gentle, curious, agile","thinking":"Use
[DEBUG] 11:55:07:821962000: ollama_generate: thinking: off
[DEBUG] 11:55:07:884065000: ollama_generate: thinking FOUND
#### <thinking>
#### User wants: "Describe a rabbit in 3 words". Provide a 3-word description. Ensure no extra words. 3 words exactly. Could say "Soft, hopping, curious". 3 words. Or "Gentle, playful, swift". Should be exactly three words. Let's pick "Soft, friendly, swift". That is 3 words. Or "Gentle, curious, agile". 3 words. I'll decide. Provide just those words, separated by commas maybe, but still 3 words. I guess just "Gentle, curious, agile". That is 3 words, including comma separated. It's okay.
#### </thinking>

Gentle, curious, agile
[DEBUG] 11:55:07:902661000: ollama_generate: success
```
