# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.2

`ollama_ps`
```
NAME        ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
llava:7b    8dd30f6b0cb1    6.2 GB    100% GPU     4096       4 minutes from now    
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
      "expires_at": "2025-07-30T19:51:10.717254+02:00",
      "size_vram": 6182481920,
      "context_length": 4096
    }
  ]
}
```
