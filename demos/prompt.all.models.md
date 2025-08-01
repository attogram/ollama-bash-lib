# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.26

```
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
Okay, user just asked about my knowledge cutoff date and specifically wants me to respond with only that date.

Hmm, this seems like a straightforward question - probably they want to know when their information was last updated before asking something else. Maybe checking if I can help with recent events or verifying the recency of data?

The response should be precise since they asked for "only the date". No need to add any explanations or context here unless they follow up.

I remember my cutoff is July 2024, so that's what I'll share. Simple and clean as requested.
</think>
July 2024
```

## dolphin3:8b
```
2021-11-24
```

## gemma3n:e4b
```
September 2021

```

## mistral:7b
```
 My knowledge cutoff date is 2021.
```

## qwen2.5vl:7b
```
2023-09-01
```

## qwen3:8b
```
<think>
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date. My training data is up to October 2024. Wait, but I should double-check that. Let me confirm. Yes, the latest data I have is from October 2024. So the answer should be October 2024. But the user wants only the date, so I should format it as "October 2024" without any extra text. Got it.
</think>

October 2024
```
