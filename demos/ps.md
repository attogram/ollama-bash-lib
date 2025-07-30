# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

`ollama_ps`
```
NAME            ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
gemma3:1b       8648f39daa8f    1.9 GB    100% GPU     4096       4 minutes from now    
smollm2:360m    297281b699fc    1.6 GB    100% GPU     4096       4 minutes from now    
smollm2:1.7b    cef4a1e09247    3.6 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "gemma3:1b",
      "model": "gemma3:1b",
      "size": 1936012288,
      "digest": "8648f39daa8fbf5b18c7b4e6a8fb4990c692751d49917417b8842ca5758e7ffc",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "gemma3",
        "families": [
          "gemma3"
        ],
        "parameter_size": "999.89M",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-30T18:13:26.911844+02:00",
      "size_vram": 1936012288,
      "context_length": 4096
    },
    {
      "name": "smollm2:360m",
      "model": "smollm2:360m",
      "size": 1595405568,
      "digest": "297281b699fc51376006233ca400cd664c4f7b80ed88a47ef084f1e4b089803b",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "361.82M",
        "quantization_level": "F16"
      },
      "expires_at": "2025-07-30T18:13:06.775448+02:00",
      "size_vram": 1595405568,
      "context_length": 4096
    },
    {
      "name": "smollm2:1.7b",
      "model": "smollm2:1.7b",
      "size": 3559286784,
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
      "expires_at": "2025-07-30T18:13:04.219888+02:00",
      "size_vram": 3559286784,
      "context_length": 4096
    }
  ]
}
```
