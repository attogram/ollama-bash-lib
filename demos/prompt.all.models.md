# Prompt all models
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.1

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." According to system message, knowledge cutoff: 2024-06. So answer: "2024-06". Must be only the date, no extra text.
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# The user asks: "What is your knowledge cutoff date? Respond with only the date."

We should answer with just the date. According to system: knowledge cutoff: 2024-06. So respond "2024-06".

We must not include extra words. Just the date.
# </thinking>

2024-06
```
