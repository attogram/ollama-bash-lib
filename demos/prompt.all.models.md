# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.7

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
#### The user asks: "What is your knowledge cutoff date? Respond with only the date." The system says respond with only the date. So answer just "2024-06-01"? Actually the cutoff is June 2024. The standard answer: "2024-06". Or "June 2024". They said only the date. Probably "2024-06". Could be "June 2024". But to be safe, give "2024-06". They want only the date. So "2024-06".
#### </thinking>

2024-06
```

## gpt-oss:20b
```
#### <thinking>
#### The user: "What is your knowledge cutoff date? Respond with only the date." So I need to output just the date. According to the system: "Knowledge cutoff: 2024-06". That likely means June 2024, maybe specifically "2024-06-01" or "2024-06" as month-year. They want only the date. So I respond with "2024-06". Let's do that.
#### </thinking>

2024-06
```
