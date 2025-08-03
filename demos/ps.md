# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.21

`ollama_ps`
```
NAME                                                      ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS    d6e3345a2af6    5.7 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
      "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
      "size": 5668653056,
      "digest": "d6e3345a2af633b74d678e0eeb07d64ed0204a27ea43ab87c438c5dce6ec8e82",
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
      "expires_at": "2025-08-03T21:02:03.8010476+02:00",
      "size_vram": 5668653056,
      "context_length": 4096
    }
  ]
}
```
