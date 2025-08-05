# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

## Demo

```bash
ollama_generate "mistral:7b" "Describe a rabbit in 3 words"
```
```
 Agile, fluffy, nibbler.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "mistral:7b" "Describe a rabbit in 3 words"`
```
```
[DEBUG] 13:22:26:926784000: ollama_generate: [mistral:7b] [Describe a rabbit in 3 words]
[DEBUG] 13:22:26:930572000: ollama_generate_json: [mistral:7b] [Describe a rabbit in 3 words]
[DEBUG] 13:22:26:933755000: ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] 13:22:26:941311000: ollama_api_post: [/api/generate] [{
  "model": "mistral:7b",
  "prompt": "De]
[DEBUG] 13:22:27:594619000: ollama_api_post: return 0
[DEBUG] 13:22:27:605164000: ollama_generate_json: return: 0
[DEBUG] 13:22:27:621275000: ollama_generate: result: 407 bytes
 Agile, fluffy, rodent.
[DEBUG] 13:22:29:631470000: ollama_generate: return: 0
```
