# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.2

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user asks: "Describe a rabbit in 3 words". This is straightforward. No policy issues. Provide three adjectives.
# </thinking>

Soft, curious, hoppy.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user asks: "Describe a rabbit in 3 words". Simple request. No policy issue. Provide three words describing a rabbit, like "fluffy, timid, swift". That's fine.
# </thinking>

Fluffy, swift, timid.
```
