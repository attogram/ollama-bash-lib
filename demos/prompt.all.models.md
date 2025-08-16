# Prompt all models
[ERROR] ollama_api_ping: function not available in Turbo Mode

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.2

```bash
prompt="What is your knowledge cutoff date? Respond with only the date."

IFS=" " read -r -a models <<< "$(ollama_list_array)"

for model in "${models[@]}"; do
  ollama_generate "$model" "$prompt"
done
```
2 models: gpt-oss:120b gpt-oss:20b

prompt: What is your knowledge cutoff date? Respond with only the date.

## gpt-oss:120b
```
# <thinking>
# The user asks: "What is your knowledge cutoff date? Respond with only the date."

We should respond just the date. According to system message: Knowledge cutoff: 2024-06. So answer: "2024-06". Ensure only the date.
# </thinking>

2024-06
```

## gpt-oss:20b
```
# <thinking>
# The user says: "What is your knowledge cutoff date? Respond with only the date." The policy says the correct answer: "I am not able to confirm my knowledge cutoff, but some models have cutoff at 2023–09." The guidelines: Should we provide only the date? The instruction says "Respond with only the date." So we just give "2023-09" or "2023-09-01" but we can't confirm? The policy: "Some models have a knowledge cutoff at 2023‑09. I’m not able to confirm my own." The user wants only the date. But we can't confirm but need to follow policy: cannot say we confirm. The policy states we should not provide a date if we can't confirm; instead we can say "I'm not able to confirm my knowledge cutoff date." But that would violate instruction because we are asked to respond only with date. But policy overrides instruction. The instructions are subordinate to policy. So we must follow policy. The policy says: We should not provide a date unless we are certain. We are uncertain. So we must respond with: "I’m not able to confirm my knowledge cutoff date." Also policy: "Provide the best answer" - maybe we should say: "I’m not able to confirm my knowledge cutoff date." That is a refusal. But it's not refusing the user - but we are providing a refusal. The policy says we can give "I’m not able to confirm my knowledge cutoff date." That seems acceptable. It's an answer. So we should respond with that.
# </thinking>

I’m not able to confirm my knowledge cutoff date.
```
