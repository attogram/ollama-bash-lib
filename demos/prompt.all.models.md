# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
1 models: tinyllama:latest

prompt: What is your knowledge cutoff date? Respond with only the date.

## tinyllama:latest
```
As an artificial intelligence (AI) assistant, my knowledge cutoff date cannot be determined based on user input. I am programmed to learn and adapt over time based on interactions with humans. However, if you mean "date," my knowledge cutoff date is the current date (i.e., 2021-05-13).
```
