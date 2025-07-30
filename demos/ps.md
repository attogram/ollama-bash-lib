# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

`ollama_ps`
```
NAME               ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
granite3.3:2b      07bd1f170855    2.7 GB    100% GPU     4096       4 minutes from now    
llava-llama3:8b    44c161b1f465    6.8 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "granite3.3:2b",
      "model": "granite3.3:2b",
      "size": 2686878533,
      "digest": "07bd1f170855240f9e162bf54ea494a8bc1c73d8cbd1365d7fccbeb7d2504947",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "granite",
        "families": [
          "granite"
        ],
        "parameter_size": "2.5B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-30T23:33:39.878113+02:00",
      "size_vram": 2686878533,
      "context_length": 4096
    },
    {
      "name": "llava-llama3:8b",
      "model": "llava-llama3:8b",
      "size": 6781644800,
      "digest": "44c161b1f46523301da9c0cc505afa4a4a0cc62f580581d98a430bb21acd46de",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama",
          "clip"
        ],
        "parameter_size": "8B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-30T23:33:34.256058+02:00",
      "size_vram": 6781644800,
      "context_length": 4096
    }
  ]
}
```
