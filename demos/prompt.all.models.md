# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." Must respond only with the date, no extra text. According to system prompt: "You are ChatGPT... Knowledge cutoff: 2024-06". So answer: "2024-06". Must be exactly that, no punctuation? Probably just "2024-06".
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# User asks: "What is your knowledge cutoff date? Respond with only the date."

We need to respond with just the date, no other text.

The knowledge cutoff for the model is 2024-06. The instruction says Respond with only the date.

Therefore output: "2024-06". Probably day is included? The instruction: "Respond with only the date." Our knowledge cutoff date is June 2024. Could give "2024-06". Possibly need full date? The date format maybe year-month-day? The system says "knowledge cutoff date" but not specifying day. Usually ChatGPT has cutoff of 2021-09? but updated to 2024-06. Usually it's "2024-06". So output that.

Also we should check if we need trailing slash? Just the date string.

Thus:

2024-06

End.
# </thinking>

2024-06
```
