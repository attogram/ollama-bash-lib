# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.0

```bash
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
Okay, user asked about my knowledge cutoff date and specifically requested to respond with only the date. 

Hmm, this seems like a straightforward information request but I should be careful not to overcomplicate it since they want just the bare minimum response. The format is very clear - "Respond with only the date." So no explanations or extra words needed.

Let me confirm my knowledge cutoff period in my database... yes, it goes up to September 2023. That's when I last processed information from before. 

The user might be checking if they need to update their understanding of recent developments beyond this point. Or perhaps they're curious about how the AI works regarding knowledge boundaries. Either way, sticking strictly to the requested format is important here.

I should respond with just "September 2023" as that's the most accurate representation of my knowledge cutoff date without any additional context.
</think>
September 2023
```

## dolphin3:8b
```
2023-04-01
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
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date without any extra information. Let me recall the last update date for my training data. I think it was October 2024. Wait, no, maybe it's earlier. Let me double-check. Oh right, the cutoff date is October 2024. So the answer should be October 2024. Just need to format it as "October 2024" without any additional text.
</think>

October 2024
```
