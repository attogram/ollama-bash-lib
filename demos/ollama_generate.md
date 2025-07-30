# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.5

## Demo

```bash
ollama_generate "llava-llama3:8b" "Describe a rabbit in 2 short sentences"
```
```
Rabbit is a small, furry mammal with long ears and a bushy tail. It has white legs, brown body, and a pink nose.
```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate "llava-llama3:8b" "Describe a rabbit in 2 short sentences"`
```
```
[DEBUG] ollama_generate: [llava-llama3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: [llava-llama3:8b] [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_generate_json: OLLAMA_LIB_STREAM: 0
[DEBUG] json_clean: 16 bytes [llava-llama3:8b]
[DEBUG] json_clean: 39 bytes [Describe a rabbit in 2 short sentences]
[DEBUG] ollama_api_post: [/api/generate] [{"model":"llava-llama3:8b","prompt":"Descr]
[DEBUG] ollama_api_post: return 0
[DEBUG] ollama_generate_json: return: 0
[DEBUG] ollama_generate: result: 618 bytes
[DEBUG] json_sanitize: 618 bytes [{"model":"llava-llama3:8b","created_at":"2]
[DEBUG] json_sanitize: sanitized: 618 bytes [[{"model":"llava-llama3:8b","created_at":"2]]
A fluffy, furry, long-legged rodent. This animal is well known for its gentle nature and tendency to eat carrots.
[DEBUG] ollama_generate: return: 0
```
