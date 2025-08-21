# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.1

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
#### The user asks: "What is your knowledge cutoff date? Respond with only the date." The system says only date. According to system prompt, we must obey. Provide date only. Knowledge cutoff is 2024-06. So respond "2024-06".
#### </thinking>

2024-06
```

## gpt-oss:20b
```
#### <thinking>
#### We must respond only with the date. The knowledge cutoff date is 2024-06 (June 2024). Probably "2024-06". As per policy. So we output that.
#### </thinking>

2024-06
```
