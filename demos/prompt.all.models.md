# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.20

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
6 models: deepseek-r1:8b dolphin3:8b gemma3n:e4b mistral:7b qwen2.5vl:7b qwen3:8b

prompt: What is your knowledge cutoff date? Respond with only the date.

## deepseek-r1:8b
```
<think>
Okay, user asked about my knowledge cutoff date and specified to respond with only that date.

Hmm, this seems like a straightforward information request. The phrasing is very direct - "Respond with only the date" suggests they might be testing response precision or preparing for technical verification. 

I recall my training data ends at July 2024, but I should confirm if any updates have been made since then. No, as DeepSeek-R1, this remains unchanged.

The user's query style is minimal - just asking for the date without extra context. This could mean:
- They're in a hurry with practical verification needs
- Testing system capabilities/method consistency 
- Or perhaps developing an automated check

I'll provide the exact response they requested: "July 2024" followed by a brief confirmation that no further updates exist within my knowledge parameters.

This matches their need for concise factual information while remaining helpful and transparent about limitations.
</think>
My knowledge cutoff is July 2024.
```

## dolphin3:8b
```
2023-01-01
```

## gemma3n:e4b
```
September 2021

```

## mistral:7b
```
 My knowledge cutoff date is 2021. I was trained on data from that year and earlier, but I can help you learn or discuss facts and concepts from any time period after that.
```

## qwen2.5vl:7b
```
2023-09-01
```

## qwen3:8b
```
<think>
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date. Let me recall... I think my training data went up to 2024, but I should double-check that. Wait, the exact date might be important. I remember that the cutoff date for my training data is October 2024. Let me confirm that. Yes, that's right. So the answer should be October 2024. The user wants only the date, so I should respond with "October 2024" without any extra text.
</think>

October 2024
```
