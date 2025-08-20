# Prompt all models

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

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
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## gemma3n:e2b
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## granite3.3:2b
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## mistral:7b
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## qwen3:8b
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## smollm2:1.7b
```
[ERROR] ollama_generate: Not Found: prompt.
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```
