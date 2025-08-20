# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.7

`ollama_ps`
```
NAME                ID              SIZE      PROCESSOR    CONTEXT    UNTIL
tinyllama:latest    2644915ede35    827 MB    100% CPU     4096       4 minutes from now
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "tinyllama:latest",
      "model": "tinyllama:latest",
      "size": 827340800,
      "digest": "2644915ede352ea7bdfaff0bfac0be74c719d5d5202acb63a6fb095b52f394a4",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "1B",
        "quantization_level": "Q4_0"
      },
      "expires_at": "2025-08-20T22:09:46.162460313Z",
      "size_vram": 0,
      "context_length": 4096
    }
  ]
}
```
