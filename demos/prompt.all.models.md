# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.18

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
Okay, user just asked about my knowledge cutoff date and specifically requested to respond with only the date. 

Hmm, this seems like a straightforward factual question - they probably want to know exactly how up-to-date I am before asking more complex things. The phrasing "Respond with only the date" suggests ta might be testing me or preparing for an important query where timing matters.

I should keep it simple and precise as requested. August 2021 is indeed my cutoff, but interesting that user didn't ask about anything else - maybe they're just verifying capabilities before diving deeper? 

The response needs to match their exact formatting request: no extra words or explanations beyond the single date. This feels like either a technical check from someone who knows AI systems well, or perhaps a cautious first question from someone new evaluating reliability.
</think>
August 2021
```

## dolphin3:8b
```
October 1, 2023
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
Okay, the user is asking about my knowledge cutoff date. I need to make sure I provide the correct date without any extra information. Let me recall the latest update. I think it's October 2024. Wait, no, maybe it's earlier. Let me check. Oh right, my knowledge is up to October 2024. But I should confirm. Yes, the cutoff date is October 2024. I need to respond with just that date.
</think>

October 2024
```
