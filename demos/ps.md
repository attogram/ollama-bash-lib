# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.20

`ollama_ps`
```
NAME        ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
qwen3:8b    500a1f067a9f    6.5 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "qwen3:8b",
      "model": "qwen3:8b",
      "size": 6499533824,
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
      "expires_at": "2025-08-03T00:15:17.5080524+02:00",
      "size_vram": 6499533824,
      "context_length": 4096
    }
  ]
}
```
