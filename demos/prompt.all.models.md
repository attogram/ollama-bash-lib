# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.7

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." The developer instruction likely says respond with only the date. No policy conflict. Provide date format: "2024-06". Could be "2024-06-01"? The knowledge cutoff is "2024-06". I'll output that.
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# User wants just date. Should respond with e.g. "2024-06".
# </thinking>

2024-06
```
