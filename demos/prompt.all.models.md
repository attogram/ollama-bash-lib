# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.7

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
13 models: deepseek-r1:8b dolphin3:8b gemma3n:e2b gemma3n:e4b granite3.3:2b granite3.3:8b hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L mistral:7b qwen2.5vl:7b qwen3:8b smollm2:1.7b

prompt: What is your knowledge cutoff date? Respond with only the date.

## deepseek-r1:8b
```
<think>
Hmm, the user is asking about my knowledge cutoff date and wants me to respond with just that information.

This seems straightforward - they're simply requesting a specific piece of data from my capabilities as DeepSeek's AI assistant. My knowledge database was last updated before July 2024, so I should provide that exact figure without any additional explanation or commentary since they specifically asked for only the date format.

The user might be testing my boundaries or perhaps planning to ask follow-up questions where knowing this cutoff is relevant. Either way, sticking strictly to their request ensures clarity and efficiency in our interaction. There's no need to add more context unless they explicitly asks for it afterward.
</think>
July 2024
```

## dolphin3:8b
```
2023-10-01
```

## gemma3n:e2b
```
2023-04-04
```

## gemma3n:e4b
```
September 2021

```

## granite3.3:2b
```
2023-05
```

## granite3.3:8b
```
April 2024.
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS
```
2023-10
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M
```
2023-10
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L
```
2021-09
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
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date without any extra information. My knowledge was last updated in October 2024. Let me confirm that again. Yes, that's right. I should just state the date clearly.
</think>

October 2024
```

## smollm2:1.7b
```
2019-03-31
```
