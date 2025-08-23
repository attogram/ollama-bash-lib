# ollama_ps, ollama_ps_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

`ollama_ps`
```
NAME             ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
granite3.3:2b    07bd1f170855    2.6 GB    100% GPU     4096       4 minutes from now    
smollm2:1.7b     cef4a1e09247    3.5 GB    100% GPU     4096       4 minutes from now    
```

`ollama_ps_json | jq`
```
{
  "models": [
    {
      "name": "granite3.3:2b",
      "model": "granite3.3:2b",
      "size": 2629206853,
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
      "expires_at": "2025-08-23T15:38:39.2249446+02:00",
      "size_vram": 2629206853,
      "context_length": 4096
    },
    {
      "name": "smollm2:1.7b",
      "model": "smollm2:1.7b",
      "size": 3501615104,
      "digest": "cef4a1e09247f018ca0c482ad4c2ce1474aba5e87f245dacf97f07948d05d8b4",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "1.7B",
        "quantization_level": "Q8_0"
      },
      "expires_at": "2025-08-23T15:38:16.054006+02:00",
      "size_vram": 3501615104,
      "context_length": 4096
    }
  ]
}
```
