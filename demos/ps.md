# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.24

`ollama_ps`
```
NAME               ID              SIZE     PROCESSOR          CONTEXT    UNTIL              
deepseek-r1:14b    c333b7232bdb    14 GB    48%/52% CPU/GPU    16384      4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "deepseek-r1:14b",
      "model": "deepseek-r1:14b",
      "size": 14218500096,
      "digest": "c333b7232bdb521236694ffbb5f5a6b11cc45d98e9142c73123b670fca400b09",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen2",
        "families": [
          "qwen2"
        ],
        "parameter_size": "14.8B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-08-01T18:03:02.3445354+02:00",
      "size_vram": 7330822144,
      "context_length": 16384
    }
  ]
}
```
