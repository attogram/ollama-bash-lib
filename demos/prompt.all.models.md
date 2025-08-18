# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.3

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." According to system: "You are ChatGPT, knowledge cutoff: 2024-06". So answer just "2024-06". Must respond only the date, no extra text.
# </thinking>

2024‑06
```

## gpt-oss:20b
```
# <thinking>
# We need to respond with only the date. The knowledge cutoff date according to policy: October 2023? Wait: The policy says "Cutoff: 'The system has a knowledge cutoff of: 2023-10-01'". The earlier statement from system message: "knowledge cutoff July 2024"? But system instructions say knowledge cutoff 2023-10-01. The instruction says: "Your knowledge cutoff date is October 2023." But the system message says cutoff is 2023-10-01. We should answer with just the date. So respond: 2023-10-01.
# </thinking>

2023-10-01
```
