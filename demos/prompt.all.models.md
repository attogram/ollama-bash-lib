# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.9

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
#### The user asks: "What is your knowledge cutoff date? Respond with only the date."

We must obey. Answer with date only, no extra text. The knowledge cutoff is 2024-06. So just "2024-06".
#### </thinking>

2024-06
```

## gpt-oss:20b
```
#### <thinking>
#### The user asks: "What is your knowledge cutoff date? Respond with only the date." The answer should be just the date, presumably "2024-06". But maybe the model is updated? The instructions say respond only with the date. So I should output "2024-06-??". The policy says knowledge cutoff is 2024-06. The date format: "2024-06". Possibly also "2024-06-01"? The instruction says respond with only the date. I think "2024-06" is fine. No extra text.
#### </thinking>

2024-06
```
