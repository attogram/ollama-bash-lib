# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.3

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." The developer instruction says to respond only with the date. The user request is straightforward and allowed. So answer with just the date: "2024-06-01"? Actually the system message in the prompt says: "Knowledge cutoff: 2024-06". Typically the date is "June 2024". The user wants a date, we can respond "2024-06-01" or "June 2024". The instruction: "Respond with only the date." Probably "2024-06". That is a date. Could be "2024-06-01". To be safe and precise, I'd give "2024-06". That is a date component. It's ambiguous, but okay. They ask for date, so the answer is the date. I'll respond with "2024-06".
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# We are instructed to respond only the date, per system messages: "All responses should be brief." And no other content. But user said "What is your knowledge cutoff date? Respond with only the date." The assistant should answer short: "2024-06". Probably "2024-06-01" or something? The cutoff date is June 2024. According to typical GPT-4, it's 2023-09? But system says knowledge cutoff is 2024-06. Should respond exactly "2024-06" or "2024-06-??" Usually system had known cutoff: 2024-06. In the system message: "Knowledge cutoff: 2024-06" So answer "2024-06".
# </thinking>

2024-06
```
