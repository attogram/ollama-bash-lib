# ollama_ps, ollama_ps_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.0
```

ollama_ps

NAME             ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
granite3.3:2b    07bd1f170855    2.7 GB    100% GPU     4096       4 minutes from now    
cogito:3b        bd144357d717    3.4 GB    100% GPU     4096       4 minutes from now    

ollama_ps_json

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
      "expires_at": "2025-07-30T00:30:38.630149+02:00",
      "size_vram": 2686878533,
      "context_length": 4096
    },
    {
      "name": "cogito:3b",
      "model": "cogito:3b",
      "size": 3367856128,
      "digest": "bd144357d717922daff29200122c3f2aab52d2a643ec73ce304f7827069ec74d",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "3.6B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-30T00:30:33.064234+02:00",
      "size_vram": 3367856128,
      "context_length": 4096
    }
  ]
}
```
