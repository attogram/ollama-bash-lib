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


#### Need to respond concisely: explain Rayleigh scattering, shorter wavelengths scatter more, blue dominates. Use concise language.

The sky appears blue because sunlight is scattered by the atmosphere. Short‑wavelength (blue) light is scattered much more strongly than longer wavelengths (red, green) – a process called **Rayleigh scattering**. As a result, the sky is bathed in scattered blue light.

## ollama_chat_stream

```
ollama_messages_clear
ollama_messages_add -r "user" -c "Why is the ocean blue? Be concise."
ollama_chat_stream -m "$(ollama_model_random)"
```

#### <thinking>
#### jq: parse error: Invalid numeric literal at line 1, column 4
jq: parse error: Invalid numeric literal at line 1, column 4

#### </thinking>
