# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
16 models: cogito:3b deepseek-r1:1.5b deepseek-r1:8b dolphin3:8b gemma3:4b gemma3n:e2b gemma3n:e4b granite3.3:2b granite3.3:8b hermes3:8b minicpm-v:8b mistral:7b qwen2.5-coder:7b qwen2.5vl:7b qwen3:1.7b qwen3:8b

prompt: What is your knowledge cutoff date? Respond with only the date.

## cogito:3b
```
2023
```

## deepseek-r1:1.5b
```
<think>
I'm DeepSeek-R1 created exclusively by DeepSeek. For the most accurate and up-to-date information about my knowledge, I suggest you run a human-like thought through the entire process myself.
</think>

I'm DeepSeek-R1 created exclusively by DeepSeek. For the most accurate and up-to-date information about my knowledge, I suggest you run a human-like thought through the entire process myself.
```

## deepseek-r1:8b
```
<think>
Hmm, the user is asking about my knowledge cutoff date and wants just a simple response with that date.

This seems like a straightforward question where they're probably testing or verifying how current (or outdated) my information is. I should give them exactly what they asked for without any extra fluff - just the date in ISO format as requested.
</think>
2023-10-25
```

## dolphin3:8b
```
March 15, 2023
```

## gemma3:4b
```
September 2021
```

## gemma3n:e2b
```
2023-04-13
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

## hermes3:8b
```
My knowledge comes from training data up until 2021. I don't have real-time access to new information beyond that cutoff date. So my official response must be: 2021.
```

## minicpm-v:8b
```
2021-09
```

## mistral:7b
```
2021-09-14 (Last updated)
```

## qwen2.5-coder:7b
```
2023-10-06
```

## qwen2.5vl:7b
```
2023-09-01
```

## qwen3:1.7b
```
<think>
Okay, the user is asking about my knowledge cutoff date. Let me make sure I understand what they're looking for.

First, I need to recall when the knowledge cutoff was for the model. The cutoff date is the date after which the model stops providing information. For this model, the cutoff date is July 30, 2024. That's when the training data was last updated. 

But wait, the user might not know the exact date. I should confirm that the cutoff date is July 30, 2024. Also, I need to make sure I don't include any extra information. The response should just be the date. Let me check again. Yes, the cutoff date is indeed July 30, 2024. So the answer is straightforward.
</think>

July 30, 2024
```

## qwen3:8b
```
<think>
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date. Let me recall the information I have. My training data is up to October 2024. Wait, but I should double-check that. The official documentation states that my knowledge is cutoff as of October 2024. So the answer should be October 2024. I need to respond with just the date, no extra text. Let me confirm once more to avoid any mistakes. Yes, October 2024 is correct.
</think>

October 2024
```
