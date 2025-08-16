# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
2 models: gpt-oss:120b gpt-oss:20b

prompt: What is your knowledge cutoff date? Respond with only the date.

## gpt-oss:120b
```
# <thinking>
# The user asks: "What is your knowledge cutoff date? Respond with only the date." So we must output just the date. According to system instruction, knowledge cutoff is 2024-06. So respond "2024-06". No other text.
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# User: "What is your knowledge cutoff date? Respond with only the date."

We must respond with only date. The knowledge cutoff date is 2024-06. Should we answer like "2024-06"? The instructions say respond with only the date. So likely answer: "2024-06". Alternatively the date could be "2024-06-01" but earlier knowledge cutoff was "2024-06" as per instruction. They said "Knowledge cutoff: 2024-06". So respond with "2024-06".
# </thinking>

2024-06
```
