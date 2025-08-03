# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.21

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
12 models: deepseek-r1:8b dolphin3:8b gemma3n:e2b gemma3n:e4b granite3.3:2b granite3.3:8b hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L mistral:7b qwen2.5vl:7b qwen3:8b

prompt: What is your knowledge cutoff date? Respond with only the date.

## deepseek-r1:8b
```
<think>
Hmm, the user is asking about my knowledge cutoff date and wants just a single line response containing that specific information.

This seems like a straightforward question - they're probably trying to understand how current or outdated my information might be regarding various topics. I should provide an accurate answer without any additional commentary since they specifically asked for only the date format.

I recall that my knowledge was last updated in July 2024, which covers most recent developments up through that point.

The user wants a concise response with just this piece of information - no explanations or additional context. I'll simply provide the date as requested while making sure to keep it formatted properly and exactly one line.
</think>
July 2024
```

## dolphin3:8b
```
October 10, 2023
```

## gemma3n:e2b
```
September 2021
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
April 2024
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
September 2023
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
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date. Let me recall the information I have. My training data is up to 2024, but I should verify that. Wait, the exact cutoff date might be different. Let me check the official sources. Oh right, the knowledge cutoff date is October 2024. I should confirm that there's no newer data beyond that. Since the user wants only the date, I'll respond with "October 2024" without any additional text.
</think>

October 2024
```
