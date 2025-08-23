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



 The sky appears blue due to a process called Rayleigh scattering, where shorter-wavelength light like blue light is scattered more by the molecules in Earth's atmosphere than longer wavelengths of light such as red. This scattered blue light is what we perceive as the blue color of the sky.

## ollama_chat_stream

```
ollama_messages_clear
ollama_messages_add -r "user" -c "Why is the ocean blue? Be concise."
ollama_chat_stream -m "$(ollama_model_random)"
```

TheoceanappearsblueduetoaprocesscalledRayleighscattering,whereshorterbluewavelengthsoflightarescatteredmorethanlongerredonesintheatmosphere.ThiscausesusonEarthtoseetheoceanasbluefromadistance.
