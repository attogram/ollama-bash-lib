# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.4

`ollama_ps`
```
NAME          ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
mistral:7b    f974a74358d6    5.6 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "mistral:7b",
      "model": "mistral:7b",
      "size": 5560649728,
      "digest": "f974a74358d62a017b37c6f424fcdf2744ca02926c4f952513ddf474b2fa5091",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "7.2B",
        "quantization_level": "Q4_0"
      },
      "expires_at": "2025-08-05T13:35:25.892481+02:00",
      "size_vram": 5560649728,
      "context_length": 4096
    }
  ]
}
```
