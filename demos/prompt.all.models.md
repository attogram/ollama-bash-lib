# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
3 models: deepseek-v3.1:671b gpt-oss:120b gpt-oss:20b

prompt: What is your knowledge cutoff date? Respond with only the date.

## deepseek-v3.1:671b
```
2023-10
```

## gpt-oss:120b
```
#### <thinking>
#### The user asks: "What is your knowledge cutoff date? Respond with only the date."

We must respond with only the date, no extra text. The knowledge cutoff date per system message is 2024-06. So respond with "2024-06".
#### </thinking>

2024-06
```

## gpt-oss:20b
```
#### <thinking>
#### The user wants: "What is your knowledge cutoff date? Respond with only the date." So we should give just the date string. According to system, it's 2025-09-09? No, system says knowledge cutoff is 2024-06. The correct is 2024-06. Format? Probably "2024-06". They want only the date. Use that.
#### </thinking>

2024-06
```
