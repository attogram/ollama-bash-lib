# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.8

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
# User asks: "What is your knowledge cutoff date? Respond with only the date." Should answer only date, no extra text. Knowledge cutoff is 2024-06. So output "2024-06".
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# We need to respond with only the date of knowledge cutoff. According to system message earlier, knowledge cutoff date is 2023-10. The user wants only the date. So respond "2023-10".
# </thinking>

2023-10
```
