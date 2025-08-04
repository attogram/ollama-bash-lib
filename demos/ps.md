# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

`ollama_ps`
```
NAME          ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
mistral:7b    6577803aa9a0    5.8 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "mistral:7b",
      "model": "mistral:7b",
      "size": 5778720768,
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
      "expires_at": "2025-08-04T20:51:32.8694193+02:00",
      "size_vram": 5778720768,
      "context_length": 4096
    }
  ]
}
```
