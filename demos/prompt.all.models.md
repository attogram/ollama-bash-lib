# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

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
Okay, user just asked about my knowledge cutoff date and wants me to respond with nothing but the date itself.

Hmm, this seems like a straightforward information request - they're probably checking how up-to-date I am before asking deeper questions. The way they phrased it is very precise ("Respond with only the date"), which suggests either:
- They've interacted with other AIs that give verbose responses and want efficiency
- Or they just want to test if I follow instructions strictly

Since my knowledge base ends at July 2024, I should be transparent about this limitation. The response is simple enough - just a single date line would work best here.

No need for elaboration unless they ask follow-ups, but I'll keep it clean as requested. If they're concerned about outdated info, they might probe further after seeing the cutoff date.
</think>
July 2024
```

## dolphin3:8b
```
April 21, 2023
```

## gemma3n:e2b
```
2023-04-01

```

## gemma3n:e4b
```
October 2024

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
2021-10-05
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M
```
My knowledge cut-off date is October 2023.
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L
```
2021-09-30
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
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date. Let me recall, my training data was last updated in 2024. Wait, but I should double-check that. The official information from Alibaba Cloud states that my knowledge cutoff is October 2024. So the answer should be October 2024. Just need to confirm there's no newer data. No, that's the latest. Alright, respond with the date.
</think>

October 2024
```

## smollm2:1.7b
```
2021-07-04
```
