# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.12

`ollama_ps`
```
NAME                ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
qwen2.5-coder:7b    dae161e27b0e    5.6 GB    100% GPU     4096       4 minutes from now    
mistral:7b          f974a74358d6    5.6 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "qwen2.5-coder:7b",
      "model": "qwen2.5-coder:7b",
      "size": 5618579456,
      "digest": "dae161e27b0e90dd1856c8bb3209201fd6736d8eb66298e75ed87571486f4364",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen2",
        "families": [
          "qwen2"
        ],
        "parameter_size": "7.6B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-31T23:09:25.861233+02:00",
      "size_vram": 5618579456,
      "context_length": 4096
    },
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
      "expires_at": "2025-07-31T23:09:18.546313+02:00",
      "size_vram": 5560649728,
      "context_length": 4096
    }
  ]
}
```
