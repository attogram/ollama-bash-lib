# ollama_ps, ollama_ps_json

A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

`ollama_ps`
```
NAME            ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
smollm2:360m    297281b699fc    1.6 GB    100% GPU     4096       4 minutes from now    
qwen3:8b        500a1f067a9f    6.6 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
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
      "expires_at": "2025-07-30T12:48:25.324054+02:00",
      "size_vram": 1595405568,
      "context_length": 4096
    },
    {
      "name": "qwen3:8b",
      "model": "qwen3:8b",
      "size": 6557205504,
      "digest": "500a1f067a9f782620b40bee6f7b0c89e17ae61f686b92c24933e4ca4b2b8b41",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen3",
        "families": [
          "qwen3"
        ],
        "parameter_size": "8.2B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-30T12:48:00.129685+02:00",
      "size_vram": 6557205504,
      "context_length": 4096
    }
  ]
}
```
