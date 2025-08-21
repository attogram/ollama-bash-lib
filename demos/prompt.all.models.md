# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.10

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
#### The user asks: "What is your knowledge cutoff date? Respond with only the date." So answer should be a date only. According to system message: knowledge cutoff: 2024-06. So respond with "2024-06". Probably format as YYYY-MM-DD? The cutoff date is month only. The system says cutoff: 2024-06. So output that exactly.
#### </thinking>

2024-06
```

## gpt-oss:20b
```
#### <thinking>
#### We are required to provide a single date as the assistant's response, with no additional content. Just the date. Likely format: YYYY-MM-DD. The knowledge cutoff date we have: "2024-06". Probably should be 2024-06-01 or 2024-06? The instruction: "Respond with only the date." We could respond "2024-06" maybe that's ambiguous. To be safe, we should respond with the date format used in the system message: "2025-08-21" is current date. But knowledge cutoff: it's 2024-06. That is month only, but the system might use "2024-06" meaning month-based. But I'd choose "2024-06-01" maybe. But the exact knowledge cutoff date given earlier: "Knowledge cutoff: 2024-06". Without day. But we need to respond with only date. So maybe "2024-06" is fine. But the instruction might want a full date format. The system says "Knowledge cutoff: 2024-06". The standard likely is year-month. So respond with that.

Let's output "2024-06".
#### </thinking>

2024-06
```
