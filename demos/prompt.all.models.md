# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
7 models: dolphin3:8b gemma3n:e2b granite3.3:2b hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS mistral:7b qwen3:8b smollm2:1.7b

prompt: What is your knowledge cutoff date? Respond with only the date.

## dolphin3:8b
```
31st December 2020
```

## gemma3n:e2b
```
September 2021
```

## granite3.3:2b
```
2023-05
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS
```
October 2023
```

## mistral:7b
```
 My knowledge cutoff date is 2021. However, I can help you learn about events and information that occurred before that as well!
```

## qwen3:8b
```
<think>
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date without any extra information.

First, I recall that my training data is up to October 2024. Wait, no, actually, the cutoff date for my knowledge is October 2024. But I should double-check that. Let me confirm. Yes, the latest data I have is from October 2024. So the answer should be October 2024. The user wants only the date, so I need to format it correctly as "October 2024" without any additional text. Make sure there's no markdown and just the date. Alright, that's it.
</think>

October 2024
```

## smollm2:1.7b
```
2021-03-15
```
