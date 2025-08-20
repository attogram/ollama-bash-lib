# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

`ollama_ps`
```
NAME           ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
gemma3n:e2b    719372f8c7de    4.5 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "gemma3n:e2b",
      "model": "gemma3n:e2b",
      "size": 4501490016,
      "digest": "719372f8c7deee188821a4dcbaf75efa13a342d7e88a79d4fc2412b24947f6fd",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "gemma3n",
        "families": [
          "gemma3n"
        ],
        "parameter_size": "4.5B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-08-20T22:26:53.5163632+02:00",
      "size_vram": 4501490016,
      "context_length": 4096
    }
  ]
}
```
