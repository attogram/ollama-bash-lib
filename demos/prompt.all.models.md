# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.1

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." Must respond only the date, no additional text. According to system, knowledge cutoff is 2024-06. So respond "2024-06".
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# We need to respond with only the date of knowledge cutoff. That date is 2024-06. The user wants only the date. So answer "2024-06". That is the precise date.
# </thinking>

2024-06
```
