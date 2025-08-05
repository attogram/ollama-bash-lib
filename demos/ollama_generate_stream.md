# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

## Demo

```bash
ollama_generate_stream "mistral:7b" "Describe a rabbit in 3 words"
```
```
 Agile, fluffy, timid.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "mistral:7b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 21:04:37:393579300: ollama_generate_stream: [mistral:7b] [Describe a rabbit in 3 words]
[DEBUG] 21:04:37:411356700: ollama_generate_json: [mistral:7b] [Describe a rabbit in 3 words]
[DEBUG] 21:04:37:422765200: ollama_generate_json: OLLAMA_LIB_STREAM: 1
[DEBUG] 21:04:37:446991900: ollama_api_post: [/api/generate] [{
  "model": "mistral:7b",
  "prompt": "De]
[DEBUG] 21:04:38:335111000: ollama_api_post: return 0
[DEBUG] 21:04:38:347612400: ollama_generate_json: return: 0
 Fluffy, agile, herbivore.[DEBUG] 21:05:26:825179800: ollama_generate_stream: return: 0

```
