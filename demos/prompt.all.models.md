# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.3

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
30th November 2022
```

## gemma3n:e2b
```
2023-04-13
```

## granite3.3:2b
```
2023-05-15
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS
```
2021-09-07
```

## mistral:7b
```
 My knowledge cutoff date is 2021.
```

## qwen3:8b
```
<think>
Okay, the user is asking about my knowledge cutoff date. Let me recall. I remember that my training data goes up to 2024, but I need to confirm the exact date. Wait, the official information says the cutoff is October 2024. But I should double-check to make sure I'm not mixing up different sources. Yes, the correct date is October 2024. I need to respond with just the date, no extra text. Alright, that's straightforward.
</think>

October 2024
```

## smollm2:1.7b
```
2019-06-30
```
