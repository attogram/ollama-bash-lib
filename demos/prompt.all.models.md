# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.11

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
#### The user asks: "What is your knowledge cutoff date? Respond with only the date." The developer message says "You are ChatGPT". The user request is straightforward. The answer should be just the date. According to system: Knowledge cutoff: 2024-06. So answer: "2024-06". Probably format as YYYY-MM-DD? The user said only the date. The cutoff is June 2024, but exact day? The system says "Knowledge cutoff: 2024-06". That's just month and year. Could answer "2024-06". That's a date string. Might be acceptable. Provide only date, no other text.
#### </thinking>

2024-06
```

## gpt-oss:20b
```
#### <thinking>
#### The user asks: "What is your knowledge cutoff date? Respond with only the date." We need to answer with just the date per instruction. The knowledge cutoff date is 2024-06. The user specifically wants only the date. So the correct response should be "2024-06". No additional text, no explanations, just that.
#### </thinking>

2024-06
```
