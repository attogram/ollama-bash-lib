# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.0

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# We need to follow policies. The user asks: "Describe a rabbit in 3 words". That's a harmless request. Just give three adjectives like "fluffy, swift, timid". That's fine.

We must comply. There's no restriction. Provide answer.
# </thinking>

Fluffy, swift, timid.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:120b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# We just need to comply: a short description in three words. It's allowed.
# </thinking>

Fluffy, swift, curious.
```
