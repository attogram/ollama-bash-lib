# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

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
Hmm, the user just asked for my knowledge cutoff date and wants a simple response with nothing else but the date itself.

I recall that my training data goes up to September 2023, so I know everything before that date. That's standard information about how AI models like me work - they're trained on historical data, not current events or updates after their last dataset was compiled.

The user might be asking this for a few reasons: maybe they want to understand why my answers don't include recent developments, or perhaps they're testing what I know. It's also possible they're just making conversation before diving into something more substantial - many users do that with AI assistants initially.

I should provide the exact date (September 2023) as requested without any extra commentary since the user specifically asked for only the date in response. Keeping it simple respects their request while still being accurate about my capabilities.
</think>
September 2023
```

## dolphin3:8b
```
2023-10-01
```

## gemma3n:e2b
```
2023-04-06
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
January 2023
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M
```
2021-09
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L
```
2023-10
```

## mistral:7b
```
 My knowledge cutoff date is 2021. However, I am programmed to learn and adapt based on up-to-date data and information that I encounter during our interactions.
```

## qwen2.5vl:7b
```
2023-09-01
```

## qwen3:8b
```
<think>
Okay, the user is asking about my knowledge cutoff date. Let me recall. I think my training data goes up to 2024, but I should double-check that. Wait, no, the exact date might be different. Let me make sure. Oh right, the cutoff date is October 2024. But I need to confirm that. Wait, no, maybe it's earlier. I think the correct cutoff date is October 2024. Let me verify once more. Yes, that's right. The knowledge cutoff date is October 2024. So the answer should be October 2024.
</think>

October 2024
```

## smollm2:1.7b
```
2021-03-19
```
