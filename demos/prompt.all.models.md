# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.5

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
# The user asks: "What is your knowledge cutoff date? Respond with only the date." So we must respond with only the date. According to system message: "Knowledge cutoff: 2024-06". So answer should be "2024-06". No other text.
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# The user: "What is your knowledge cutoff date? Respond with only the date." The instruction says respond with only the date. The instruction at assistant: We have the system's knowledge: "Knowledge cutoff: 2024-06." Must give only the date. So answer "2024-06". Probably just that.
# </thinking>

2024-06
```
