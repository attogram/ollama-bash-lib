# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.6

`ollama_ps`
```
NAME                ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
llava:7b            8dd30f6b0cb1    6.2 GB    100% GPU     4096       4 minutes from now    
granite3.3:2b       07bd1f170855    2.7 GB    100% GPU     4096       4 minutes from now    
deepseek-r1:1.5b    e0979632db5a    2.0 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "llava:7b",
      "model": "llava:7b",
      "size": 6182481920,
      "digest": "8dd30f6b0cb19f555f2c7a7ebda861449ea2cc76bf1f44e262931f45fc81d081",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama",
          "clip"
        ],
        "parameter_size": "7B",
        "quantization_level": "Q4_0"
      },
      "expires_at": "2025-07-30T22:47:16.792333+02:00",
      "size_vram": 6182481920,
      "context_length": 4096
    },
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
      "expires_at": "2025-07-30T22:46:55.616239+02:00",
      "size_vram": 2686878533,
      "context_length": 4096
    },
    {
      "name": "deepseek-r1:1.5b",
      "model": "deepseek-r1:1.5b",
      "size": 1982904832,
      "digest": "e0979632db5a88d1a53884cb2a941772d10ff5d055aabaa6801c4e36f3a6c2d7",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen2",
        "families": [
          "qwen2"
        ],
        "parameter_size": "1.8B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-30T22:46:41.985165+02:00",
      "size_vram": 1982904832,
      "context_length": 4096
    }
  ]
}
```
