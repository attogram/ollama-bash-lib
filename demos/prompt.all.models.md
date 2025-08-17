# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.8

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." The user wants a single date, presumably "2024-06". According to system message: "knowledge cutoff: 2024-06". So we respond with "2024-06". No extra text.
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# The user asks: "What is your knowledge cutoff date? Respond with only the date." So respond with the date of the knowledge cutoff. That is 2024-06. The earlier instruction: respond with only the date. So output "2024-06" or "2024-06-??". The OpenAI internal doc says knowledge cutoff is 2023-04? Wait: The actual knowledge cutoff for GPT-4 is maybe 2023-05? But the conversation earlier says "Knowledge cutoff: 2024-06". In "OpenAI policy" we should respond with the official cutoff: 2023-11? However I recall GPT-4's cutoff is 2023-04? But the conversation says "knowledge cutoff: 2024-06". The system message says "You are ChatGPT, knowledge cutoff 2024-06". So respond with "2024-06". The user says respond with only the date. So "2024-06".
# </thinking>

2024-06
```
