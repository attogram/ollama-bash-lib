# ollama_list, ollama_list_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.46.8

```
ollama_list
```
```
NAME                                                      ID              SIZE      MODIFIED    
dolphin3:8b                                               d5ab9ae8e1f2    4.9 GB    4 weeks ago    
gemma3n:e2b                                               719372f8c7de    5.6 GB    2 weeks ago    
granite3.3:2b                                             07bd1f170855    1.5 GB    2 weeks ago    
hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS    d6e3345a2af6    4.4 GB    2 weeks ago    
mistral:7b                                                6577803aa9a0    4.4 GB    2 weeks ago    
qwen3:8b                                                  500a1f067a9f    5.2 GB    4 weeks ago    
smollm2:1.7b                                              cef4a1e09247    1.8 GB    2 weeks ago    
```

```
ollama_list_array
```
dolphin3:8b gemma3n:e2b granite3.3:2b hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS mistral:7b qwen3:8b smollm2:1.7b

```
ollama_list_json | jq '.'
```
```json
{
  "models": [
    {
      "name": "smollm2:1.7b",
      "model": "smollm2:1.7b",
      "modified_at": "2025-08-03T21:20:02.9178974+02:00",
      "size": 1820428533,
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
      }
    },
    {
      "name": "mistral:7b",
      "model": "mistral:7b",
      "modified_at": "2025-08-03T21:16:38.8638638+02:00",
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
      "name": "granite3.3:2b",
      "model": "granite3.3:2b",
      "modified_at": "2025-08-03T20:54:11.3482609+02:00",
      "size": 1545321637,
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
      }
    },
    {
      "name": "gemma3n:e2b",
      "model": "gemma3n:e2b",
      "modified_at": "2025-08-03T17:53:33.6294197+02:00",
      "size": 5621616562,
      "digest": "719372f8c7deee188821a4dcbaf75efa13a342d7e88a79d4fc2412b24947f6fd",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "gemma3n",
        "families": [
          "gemma3n"
        ],
        "parameter_size": "4.5B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
      "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS",
      "modified_at": "2025-08-03T17:46:43.2887526+02:00",
      "size": 4448227285,
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
    }
  ]
}
```
