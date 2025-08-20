# ollama_generate_stream

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

## Demo

```bash
ollama_generate_stream "granite3.3:2b" "Describe a rabbit in 3 words"
```
```
[ERROR] ollama_generate_stream: Not Found: prompt.
Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]

```

## Demo Debug

```bash
`OLLAMA_LIB_DEBUG=1 ollama_generate_stream "granite3.3:2b" "Describe a rabbit in 3 words"`
```
```json
[DEBUG] 22:21:33:823043800: _is_valid_model: Model name empty: getting random model
[DEBUG] 22:21:33:894106400: ollama_app_installed
[ERROR] ollama_generate_stream: Not Found: prompt.
Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]

```
