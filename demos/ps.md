# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0

`ollama_ps`
```
NAME            ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
qwen2.5vl:7b    5ced39dfa4ba    8.6 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "qwen2.5vl:7b",
      "model": "qwen2.5vl:7b",
      "size": 8599426389,
      "digest": "5ced39dfa4bac325dc183dd1e4febaa1c46b3ea28bce48896c8e69c1e79611cc",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen25vl",
        "families": [
          "qwen25vl"
        ],
        "parameter_size": "8.3B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-30T23:24:24.577389+02:00",
      "size_vram": 8599426389,
      "context_length": 4096
    }
  ]
}
```
