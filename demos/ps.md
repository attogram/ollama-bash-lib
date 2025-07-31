# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.8

`ollama_ps`
```
NAME          ID              SIZE     PROCESSOR         CONTEXT    UNTIL              
hermes3:8b    4f6b83f30b62    11 GB    4%/96% CPU/GPU    32768      4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "hermes3:8b",
      "model": "hermes3:8b",
      "size": 11694794752,
      "digest": "4f6b83f30b62bc3d0cf9be09266db222805ee815c8fd7d8b38f863f655be78b7",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "8.0B",
        "quantization_level": "Q4_0"
      },
      "expires_at": "2025-07-31T20:10:27.794695+02:00",
      "size_vram": 11263838208,
      "context_length": 32768
    }
  ]
}
```
