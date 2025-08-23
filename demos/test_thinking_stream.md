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



The sky is blue because of a phenomenon called **Rayleigh scattering**.  Sunlight is made of all colors. When sunlight enters the Earth's atmosphere, it bumps into air molecules. Blue light is scattered more than other colors, making the sky appear blue.





## ollama_chat_stream

```
ollama_messages_clear
ollama_messages_add -r "user" -c "Why is the ocean blue? Be concise."
ollama_chat_stream -m "$(ollama_model_random)"
```

TheoceanappearsblueduetoaprocesscalledRayleighscattering.Sunlight,especiallybluelight,scattersmoreinwatermolecules,gettingscatteredbacktowardsoureyes,makingtheoceanappearblue.
