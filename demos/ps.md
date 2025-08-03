# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.0

`ollama_ps`
```
NAME                                                      ID              SIZE      PROCESSOR          CONTEXT    UNTIL              
hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L    bcbfe32e5762    8.3 GB    11%/89% CPU/GPU    4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
      "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
      "size": 8253194240,
      "digest": "bcbfe32e5762e18863d4caa81f1e23b9b1691b29352582625ce9fcc4b26860dc",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "8.02B",
        "quantization_level": "unknown"
      },
      "expires_at": "2025-08-04T00:34:28.1304015+02:00",
      "size_vram": 7332593664,
      "context_length": 4096
    }
  ]
}
```
