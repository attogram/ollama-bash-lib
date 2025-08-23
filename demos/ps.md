# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

`ollama_ps`
```
NAME          ID              SIZE      PROCESSOR          CONTEXT    UNTIL              
mistral:7b    6577803aa9a0    8.3 GB    13%/87% CPU/GPU    16384      4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "mistral:7b",
      "model": "mistral:7b",
      "size": 8329906176,
      "digest": "6577803aa9a036369e481d648a2baebb381ebc6e897f2bb9a766a2aa7bfbc1cf",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "7.2B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-08-23T20:03:30.7864595+02:00",
      "size_vram": 7206864896,
      "context_length": 16384
    }
  ]
}
```
