# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.10

`ollama_ps`
```
NAME            ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
smollm2:1.7b    cef4a1e09247    4.7 GB    100% GPU     32768      4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "smollm2:1.7b",
      "model": "smollm2:1.7b",
      "size": 4674971648,
      "digest": "cef4a1e09247f018ca0c482ad4c2ce1474aba5e87f245dacf97f07948d05d8b4",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "1.7B",
        "quantization_level": "Q8_0"
      },
      "expires_at": "2025-07-31T20:38:34.56898+02:00",
      "size_vram": 4674971648,
      "context_length": 32768
    }
  ]
}
```
