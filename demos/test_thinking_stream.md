# Test for streaming with thinking enabled

## Turn on thinking

```
ollama_thinking on
ollama_thinking
```

thinking is on

## ollama_generate_stream

```
ollama_generate_stream -m "$(ollama_model_random)" -p "Why is the sky blue? Be concise."
```

[ERROR] ollama_model_random: ollama is not installed
[ERROR] ollama_model_random: ollama is not installed

## ollama_chat_stream

```
ollama_messages_clear
ollama_messages_add -r "user" -c "Why is the ocean blue? Be concise."
ollama_chat_stream -m "$(ollama_model_random)"
```

[ERROR] ollama_model_random: ollama is not installed
[ERROR] ollama_model_random: ollama is not installed
Error: -m <model> is required

Usage: ollama_chat_stream -m <model> [-h] [-v]
