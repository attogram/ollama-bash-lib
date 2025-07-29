# ollama_ps, ollama_ps_json
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1
```

ollama_ps

NAME           ID              SIZE      PROCESSOR    CONTEXT    UNTIL              
dolphin3:8b    d5ab9ae8e1f2    6.2 GB    100% GPU     4096       4 minutes from now    
llama3.2:1b    baf6a787fdff    2.4 GB    100% GPU     4096       4 minutes from now    

ollama_ps_json

{
  "models": [
    {
      "name": "dolphin3:8b",
      "model": "dolphin3:8b",
      "size": 6157238848,
      "digest": "d5ab9ae8e1f22619a6be52e5694df422b7183a3883990a000188c363781ecb78",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "8.0B",
        "quantization_level": "Q4_K_M"
      },
      "expires_at": "2025-07-29T20:52:46.702448+02:00",
      "size_vram": 6157238848,
      "context_length": 4096
    },
    {
      "name": "llama3.2:1b",
      "model": "llama3.2:1b",
      "size": 2350966784,
      "digest": "baf6a787fdffd633537aa2eb51cfd54cb93ff08e28040095462bb63daf552878",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "1.2B",
        "quantization_level": "Q8_0"
      },
      "expires_at": "2025-07-29T20:52:38.107091+02:00",
      "size_vram": 2350966784,
      "context_length": 4096
    }
  ]
}
```
