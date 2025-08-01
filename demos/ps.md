# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.0

`ollama_ps`
```
NAME        ID              SIZE      PROCESSOR          CONTEXT    UNTIL              
qwen3:8b    500a1f067a9f    9.6 GB    25%/75% CPU/GPU    16384      4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "qwen3:8b",
      "model": "qwen3:8b",
      "size": 9569764352,
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
      "expires_at": "2025-08-01T23:50:26.2742876+02:00",
      "size_vram": 7164390400,
      "context_length": 16384
    }
  ]
}
```
