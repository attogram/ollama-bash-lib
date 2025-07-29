# ollama_ps, ollama_ps_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1
```

ollama_ps

NAME             ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
granite3.3:2b    07bd1f170855    2.7 GB    100% GPU     4096       4 minutes from now    
llama3.2:3b      a80c4f17acd5    3.4 GB    100% GPU     4096       4 minutes from now    

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
      "expires_at": "2025-07-29T20:47:55.827998+02:00",
      "size_vram": 2686878533,
      "context_length": 4096
    },
    {
      "name": "llama3.2:3b",
      "model": "llama3.2:3b",
      "size": 3367856128,
      "digest": "a80c4f17acd55265feec403c7aef86be0c25983ab279d83f3bcd3abbcb5b8b72",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "3.2B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-29T20:47:34.045631+02:00",
      "size_vram": 3367856128,
      "context_length": 4096
    }
  ]
}
```
