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
2021-07-15
```

## gemma3n:e2b
```
2023-04-06
```

## granite3.3:2b
```
2023-10
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS
```
October 2023
```

## mistral:7b
```
 My knowledge cutoff date is 2021.
```

## qwen3:8b
```
<think>
Okay, the user is asking about my knowledge cutoff date. I need to provide the date without any extra information.

First, I should recall the last update date for my training data. My training data was last updated in October 2024. That's the key point here.

Wait, I need to make sure there's no confusion with other models. The cutoff date is specific to my training data, so I should state it clearly. 

The user wants only the date, so I should format it as "October 2024" or the exact date if possible. Let me check again. The exact cutoff date is October 2024. 

No, wait, some models have specific dates like 2024-10-01. But I think for my case, the official cutoff is October 2024. I should confirm that. 

Yes, the correct cutoff date is October 2024. So the answer is simply that date.
</think>

October 2024
```

## smollm2:1.7b
```
2021-07-16
```
