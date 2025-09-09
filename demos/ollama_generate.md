# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

## Demo


```
ollama_generate -m "$model" -p "$prompt"
```
```
#### <thinking>
#### The user says: "Describe a rabbit in 3 words". We should give 3 words. Likely something like "fluffy, hopping, curious" or "soft, quick, playful". But user didn't specify tone. Just 3 words. Let's choose a succinct and evocative description. Maybe "fluffy, agile, curious". Or "soft, swift, adorable". We'll output three words. The instructions: "Describe a rabbit in 3 words"—the simplest: "soft, swift, curious". Let's do that.
#### </thinking>

Soft, swift, curious.
```

## Demo Debug


```
OBL_DEBUG=1 ollama_generate -m "$model" -p "$prompt"
```
```
[DEBUG] 23:51:09:173395545: ollama_generate: [-m] [gpt-oss:20b] [-p] [Describe a rabbit in 3 words]
[DEBUG] 23:51:09:178657412: ollama_generate: init: model: [] prompt: []
[DEBUG] 23:51:09:181555093: ollama_generate: while getopts: OPTARG: [gpt-oss:20b] opt: [m]
[DEBUG] 23:51:09:184070513: ollama_generate: while getopts: OPTARG: [Describe a rabbit in 3 words] opt: [p]
[DEBUG] 23:51:09:186710182: ollama_generate: final: model: [gpt-oss:20b] prompt: [Describe a rabbit in 3 words]
[DEBUG] 23:51:09:189669202: ollama_generate: checking: model: [gpt-oss:20b]
[DEBUG] 23:51:09:192213231: ollama_generate: checked: model: [gpt-oss:20b]
[DEBUG] 23:51:09:197866331: ollama_generate_json: [gpt-oss:20b] [Describe a rabbit in 3 words]
[DEBUG] 23:51:09:204361585: ollama_generate_json: json_payload: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:51:09:209641070: ollama_api_post: [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:51:09:212583796: _call_curl: [POST] [/api/generate] {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:51:09:219280870: _call_curl: OBL_API: https://ollama.com
[DEBUG] 23:51:09:223322634: _call_curl: Turbo Mode
[DEBUG] 23:51:09:225859985: _call_curl: json_body: {"model":"gpt-oss:20b","prompt":"Describe a rabbit in 3 words","stream":false,"thinking":false}
[DEBUG] 23:51:09:229748327: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w HTTP_CODE_DELIMITER%{http_code} -H Authorization: Bearer [REDACTED] -X POST https://ollama.com/api/generate -d @-
[DEBUG] 23:51:10:885127334: ollama_api_post: success
[DEBUG] 23:51:10:888243954: ollama_generate_json: success
[DEBUG] 23:51:10:895243109: ollama_generate: result: 858 bytes: {"model":"gpt-oss:20b","created_at":"2025-09-09T21:51:09.70692214Z","response":"Soft agile curious","thinking":"We need 
[DEBUG] 23:51:10:906084398: ollama_generate: thinking: off
[DEBUG] 23:51:10:912966342: ollama_generate: thinking FOUND
#### <thinking>
#### We need a 3-word description of a rabbit. Chatbot should produce exactly 3 words. Probably "Fluffy, agile, friendly". Or "Soft, swift, curious". Let's pick 3 words, maybe no commas: "Soft agile curious". But likely they expect 3 words separated by spaces. Could be "Soft, quick, whiskered" but that's 3 words? "Soft quick whiskered" okay. We'll do "Soft, quivering, curious" maybe. But we can choose: "Soft, quick, inquisitive". I'll produce 3 words separated by spaces, no punctuation? The instruction "Describe a rabbit in 3 words" likely expects 3 words separated by spaces. No need for punctuation. I'll give "Soft agile curious". That fits.
#### </thinking>

Soft agile curious
[DEBUG] 23:51:10:919037429: ollama_generate: success
```
