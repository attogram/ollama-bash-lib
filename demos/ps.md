# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.5

`ollama_ps`
```
NAME                  ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
dolphin-mistral:7b    5dc8c5a2be65    5.6 GB    100% GPU     4096       4 minutes from now    
smollm2:360m          297281b699fc    1.6 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "dolphin-mistral:7b",
      "model": "dolphin-mistral:7b",
      "size": 5558075968,
      "digest": "5dc8c5a2be6510dcb2afbcffdedc73acbd5868d2c25d9402f6044beade3d5f70",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "7B",
        "quantization_level": "Q4_0"
      },
      "expires_at": "2025-07-30T22:37:19.438754+02:00",
      "size_vram": 5558075968,
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
      "expires_at": "2025-07-30T22:36:53.898969+02:00",
      "size_vram": 1595405568,
      "context_length": 4096
    }
  ]
}
```
