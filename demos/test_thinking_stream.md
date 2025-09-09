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


#### We need to answer \"Why is the sky blue? Be concise.\"

Provide concise answer about Rayleigh scattering, shorter wavelengths, etc. Use short paragraphs.The sky appears blue because molecules and tiny particles in Earth’s atmosphere scatter shorter‑wavelength (blue) sunlight more efficiently than longer‑wavelength (red) light. This Rayleigh scattering redirects blue light in all directions, so when you look up you see a sky bathed in blue.

## ollama_chat_stream

```
ollama_messages_clear
ollama_messages_add -r "user" -c "Why is the ocean blue? Be concise."
ollama_chat_stream -m "$(ollama_model_random)"
```

The ocean appears blue because water absorbs light at longer (red, orange) wavelengths more efficiently than at shorter (blue) wavelengths. The remaining blue light is scattered and back‑reflected to our eyes, and the sky’s own blue light further enhances the color. This selective absorption and scattering give the sea its characteristic blue hue.
