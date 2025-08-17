# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.0

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." We need to respond with just the date, no extra text. According to system message, knowledge cutoff is 2024-06. So respond with "2024-06". Ensure only the date.
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# User: "What is your knowledge cutoff date? Respond with only the date." So respond just with date. Probably "2023-09" as ChatGPT's knowledge cutoff. But the model might have date 2024-06? The system says knowledge cutoff: 2024-06. Actually the user says "Respond with only the date." In earlier messages the system says Knowledge cutoff: 2024-06. So answer could be "2024-06". Should I use format "YYYY-MM-DD" or "YYYY-MM"? The previous instructions: "Respond with only the date." I'd assume they want a date. We can answer "2024-06". Or maybe "2024-06-01"? But simpler: "2024-06". Let's respond with "2024-06".
# </thinking>

2024-06
```
