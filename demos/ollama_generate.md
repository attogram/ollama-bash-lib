# ollama_generate

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.7

## Setup

OLLAMA_HOST: https://ollama.com
OLLAMA_LIB_API: https://ollama.com


## Demo

```bash
ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user wants: "Describe a rabbit in 3 words". So we need to give three adjectives or nouns? Might be descriptive words. Just three words. Let's pick "Playful", "Fluffy", "Spry". The user might prefer concise answer. We'll output them separated by commas or just space. I'll output: "Playful, fluffy, spry". Or "Playful fluffy spry".

Given the instruction: "Describe a rabbit in 3 words". So answer with exactly 3 words. Let's output something like "Playful, fluffy, swift" or "Playful fluffy swift". Let's choose "Playful", "Fluffy", "Swift". That fits. I'll output "Playful, Fluffy, Swift".
# </thinking>

Playful, Fluffy, Swift
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1 ollama_generate "gpt-oss:20b" "Describe a rabbit in 3 words"
```
```
# <thinking>
# The user: "Describe a rabbit in 3 words". They want a description using exactly three words? Likely they want a short description. Provide exactly 3 words that describe a rabbit. E.g., "soft, hopping, curious" that's three words: "Soft" "Hopping" "Curious". Count wise: each word separate. That is three words. Or "fluffy, swift, gentle". Need to include punctuation or not? Probably simple. They might want "fluffy", "gentle", "playful". That's three words as well. We can provide one set. They didn't specify any constraints beyond "in 3 words". So produce a short answer: "soft, hopping, curious". The output from assistant: "soft hopping curious"? They might want a description. Let's respond with three words. Let's go with "Soft, hopping, curious". That's 3 words. Or "fluffy, gentle, curious". I'll do "fluffy, gentle, curious". That should satisfy. I'll ensure no extra words. Provide just the three words separated by commas or spaces. Let's do "fluffy gentle curious". Provide exactly 3 words. I guess better to separate with commas: "fluffy, gentle, curious" That's still three words plus commas. Should be okay. Let's respond.
# </thinking>

fluffy, gentle, curious
```
