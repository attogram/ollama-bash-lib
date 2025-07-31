# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.14

## Demo

```bash
ollama_generate "minicpm-v:8b" "Describe a rabbit in 2 short sentences"
```
```
A rabbit is an animal with soft fur, long ears and strong hind legs. It usually has a small body size that varies according to the species but it can reach up to several pounds depending on age and gender. They are herbivorous animals typically found living outside or in natural areas such as forests or grasslands where they spend most of their time grazing.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "minicpm-v:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [minicpm-v:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [minicpm-v:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 13 bytes [minicpm-v:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"minicpm-v:8b","prompt":"Describe]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 734 bytes
[DEBUG] json_sanitize: 734 bytes [{"model":"minicpm-v:8b","created_at":"2025]
[DEBUG] json_sanitize: sanitized: 734 bytes [[{"model":"minicpm-v:8b","created_at":"2025]]
A rabbit is typically small, fluffy mammal with long ears and a strong sense of smell. They are commonly found in fields and grasslands where they primarily eat vegetation like grass or crops.
[DEBUG] ollama_generate: return: 0
```
