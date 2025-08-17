# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.8

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user requests: "Describe a rabbit in 3 words". So we need to describe a rabbit in 3 words. They likely want a concise description. The answer should be exactly 3 words: maybe "Fluffy, swift, playful" or "Soft, quick, curious". Need to exactly provide 3 words. They didn't ask for anything else. Provide 3 words separated by commas or just space? Usually comma separated is good. Must be just 3 words. Let's deliver.
# </thinking>

Fluffy, swift, playful.
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# We need to give a short answer: 3 words describing a rabbit. We could choose: "soft, agile, playful". Or "fluffy, quick, curious". The question: "Describe a rabbit in 3 words". So we just need 3 words. Could be any valid description. Let's choose something like "Soft, nimble, curious". Let's output exactly three words, no other text. Also no extra punctuation? The instruction is to "Describe a rabbit in 3 words". They didn't restrict punctuation. Maybe we should just list three words. I can do "Fluffy, speedy, friendly". That's 3 words. Let's do that.
# </thinking>

Fluffy, speedy, friendly
```
