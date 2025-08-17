# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.1

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# We need to respond: describe a rabbit in 3 words. Likely just 3 words: "Playful, fluffy, swift". Or "Gentle, agile, curious". Many possibilities. We should deliver three descriptive words. We must respond concisely. Probably: "Soft, swift, curious". Or maybe "Herbivore, agile, cute". Let's pick: "Gentle, swift, curious". It's 3 words. That works. Let's answer concisely.
# </thinking>

Gentle, swift, curious
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# We have a user: "Describe a rabbit in 3 words". It's quite straightforward. We must respond with description in exactly three words. Potential answers: "Graceful, curious, fluffy." But that's four words. We need exactly three words. Could be "Graceful, curious, fluffy" but that's 3 words if separated by commas: "Graceful, curious, fluffy". That counts 3 words: Graceful, curious, fluffy. Usually commas don't create new words. But we need exactly 3 words. Maybe "Graceful, curious, fluffy" is three words. Alternatively "Eager, quick, soft". Or "Playful, swift, fluffy". Ensure the words are separate by spaces? Possibly "Graceful curious fluffy". That is three. If we want to add commas, it's fine. So answer: "Graceful, curious, fluffy." That is fine.
# </thinking>

Graceful, curious, fluffy.
```
