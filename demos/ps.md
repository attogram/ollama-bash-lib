# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.25

`ollama_ps`
```
NAME           ID              SIZE      PROCESSOR          CONTEXT    UNTIL              
dolphin3:8b    d5ab9ae8e1f2    8.7 GB    19%/81% CPU/GPU    16384      4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "dolphin3:8b",
      "model": "dolphin3:8b",
      "size": 8650752576,
      "digest": "d5ab9ae8e1f22619a6be52e5694df422b7183a3883990a000188c363781ecb78",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "8.0B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-08-01T21:27:04.6179283+02:00",
      "size_vram": 7015958528,
      "context_length": 16384
    }
  ]
}
```
