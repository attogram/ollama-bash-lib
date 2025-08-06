# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.10

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
April 2023
```

## deepseek-r1:1.5b
```
<think>
Hi! I'm DeepSeek-R1, an AI assistant independently developed. I'm excited to chat with you and help out!
</think>

Hi! I'm DeepSeek-R1, an AI assistant independently developed. I'm excited to chat with you and help out!
```

## deepseek-r1:8b
```
<think>
Hmm, the user is asking about my knowledge cutoff date and wants me to respond with just the date itself. This seems like a straightforward question, probably from someone who's curious or perhaps evaluating how recent my information is.

I should give them an accurate answer since they specifically requested it in such a clear way. The knowledge cutoff date for my training data was July 2024 - that would be the most precise response to their query.
</think>
July 2024
```

## dolphin3:8b
```
May 2023
```

## gemma3:4b
```
January 2023
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
2023-10
```

## granite3.3:8b
```
April 2024
```

## hermes3:8b
```
2023
```

## minicpm-v:8b
```
2021-09
```

## mistral:7b
```
2021-10-01 (October 1, 2021)
```

## qwen2.5-coder:7b
```
2023-10-01
```

## qwen2.5vl:7b
```
2023-09-01
```

## qwen3:1.7b
```
<think>
Okay, the user is asking about my knowledge cutoff date. I need to make sure I respond with only the date. Let me check the instructions again. The user wants me to provide only the date, so I shouldn't include any extra text.

Wait, the user mentioned "Respond with only the date." So I have to make sure my answer is just the date, no explanations or anything else. But how do I know the cutoff date? The knowledge cutoff date for the model is typically the date when the training data was last updated. For this model, the cutoff date is October 15, 2023. I should confirm that. Let me think... Yes, the training data was last updated on that date. So the answer is October 15, 2023. I need to make sure there's no other information. Just the date.
</think>

October 15, 2023
```

## qwen3:8b
```
<think>
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date without any extra information. Let me recall the latest update. I think it's October 2024. Wait, no, the cutoff date is usually the last date before the model was trained. Let me confirm. Yes, the knowledge cutoff date for my training data is October 2024. I should respond with just that date.
</think>

October 2024
```
