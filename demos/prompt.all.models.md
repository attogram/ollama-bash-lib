# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.2

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date."

We should respond with just the date. According to system message, knowledge cutoff: 2024-06. So respond with "2024-06". Ensure only that text.
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# User asks: "What is your knowledge cutoff date? Respond with only the date." So we need to respond with the date of knowledge cutoff. That is "2024-06". Probably need to format as just the date, maybe year-month? They specified "Respond with only the date." So likely "2024-06".
# </thinking>

2024-06
```
