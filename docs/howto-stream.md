# How to Stream Content

To stream content, use the `ollama_generate_stream` or `ollama_chat_stream` functions.

## Generate Stream
```bash
ollama_generate_stream -m <model_name> -p <prompt>
```

## Chat Stream
```bash
ollama_chat_stream -m <model_name>
```

The output will be streamed to `stdout` as it is generated.
