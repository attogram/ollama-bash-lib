# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.2

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
#### <thinking>
#### The user asks: "What is your knowledge cutoff date? Respond with only the date." The developer instruction says respond only with the date. The user wants the date. According to system prompt: "knowledge cutoff: 2024-06". So answer should be "2024-06". It must be only the date, no extra text.
#### </thinking>

2024-06
```

## gpt-oss:20b
```
#### <thinking>
#### User: "What is your knowledge cutoff date? Respond with only the date." The user explicitly requests me to respond only the date. So I should comply: The date is "2024-06". Should I format "2024-06" or "2024-06-XX"? According to policies, knowledge cutoff is 2024-06. The user wants only the date, so "2024-06" is appropriate. That seems correct.
#### </thinking>

2024-06
```
