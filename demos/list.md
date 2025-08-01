# ollama_list, ollama_list_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.41.18

```
ollama_list
```
```
NAME              ID              SIZE      MODIFIED    
deepseek-r1:8b    6995872bfe4c    5.2 GB    11 days ago    
dolphin3:8b       d5ab9ae8e1f2    4.9 GB    11 days ago    
gemma3n:e4b       15cb39fd9394    7.5 GB    12 days ago    
mistral:7b        6577803aa9a0    4.4 GB    11 days ago    
qwen2.5vl:7b      5ced39dfa4ba    6.0 GB    11 days ago    
qwen3:8b          500a1f067a9f    5.2 GB    12 days ago    
```

```
ollama_list_array
```
```
deepseek-r1:8b dolphin3:8b gemma3n:e4b mistral:7b qwen2.5vl:7b qwen3:8b
```

```
ollama_list_json | jq '.'
```
```json
{
  "models": [
    {
      "name": "deepseek-r1:8b",
      "model": "deepseek-r1:8b",
      "modified_at": "2025-07-21T22:11:14.7518793+02:00",
      "size": 5225376047,
      "digest": "6995872bfe4c521a67b32da386cd21d5c6e819b6e0d62f79f64ec83be99f5763",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen3",
        "families": [
          "qwen3"
        ],
        "parameter_size": "8.2B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "dolphin3:8b",
      "model": "dolphin3:8b",
      "modified_at": "2025-07-21T22:00:52.2303758+02:00",
      "size": 4920757726,
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
      }
    },
    {
      "name": "qwen2.5vl:7b",
      "model": "qwen2.5vl:7b",
      "modified_at": "2025-07-21T21:54:09.3814713+02:00",
      "size": 5969245856,
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
      }
    },
    {
      "name": "mistral:7b",
      "model": "mistral:7b",
      "modified_at": "2025-07-21T21:42:19.8424884+02:00",
      "size": 4372824384,
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
      }
    },
    {
      "name": "qwen3:8b",
      "model": "qwen3:8b",
      "modified_at": "2025-07-20T14:30:40.3324961+02:00",
      "size": 5225388164,
      "digest": "500a1f067a9f782620b40bee6f7b0c89e17ae61f686b92c24933e4ca4b2b8b41",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen3",
        "families": [
          "qwen3"
        ],
        "parameter_size": "8.2B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "gemma3n:e4b",
      "model": "gemma3n:e4b",
      "modified_at": "2025-07-20T11:55:19.7055314+02:00",
      "size": 7547589116,
      "digest": "15cb39fd9394fd2549f6df9081cfc84dd134ecf2c9c5be911e5629920489ac32",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "gemma3n",
        "families": [
          "gemma3n"
        ],
        "parameter_size": "6.9B",
        "quantization_level": "Q4_K_M"
      }
    }
  ]
}
```
