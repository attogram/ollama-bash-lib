# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.4

`ollama_ps`
```
NAME              ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
qwen3:1.7b        8f68893c685c    2.4 GB    100% GPU     4096       4 minutes from now    
deepseek-r1:8b    6995872bfe4c    6.6 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "qwen3:1.7b",
      "model": "qwen3:1.7b",
      "size": 2392883541,
      "digest": "8f68893c685c3ddff2aa3fffce2aa60a30bb2da65ca488b61fff134a4d1730e7",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen3",
        "families": [
          "qwen3"
        ],
        "parameter_size": "2.0B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-30T22:19:01.698724+02:00",
      "size_vram": 2392883541,
      "context_length": 4096
    },
    {
      "name": "deepseek-r1:8b",
      "model": "deepseek-r1:8b",
      "size": 6557205504,
      "digest": "6995872bfe4c521a67b32da386cd21d5c6e819b6e0d62f79f64ec83be99f5763",
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
      "expires_at": "2025-07-30T22:18:42.75539+02:00",
      "size_vram": 6557205504,
      "context_length": 4096
    }
  ]
}
```
