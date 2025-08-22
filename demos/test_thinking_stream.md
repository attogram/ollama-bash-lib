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



The sky appears blue because of a phenomenon called Rayleigh scattering, where sunlight interacts with molecules and particles in Earth's atmosphere. Shorter wavelengths like blue light are scattered more than longer wavelengths, making the sky appear blue.

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


