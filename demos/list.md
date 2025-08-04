# ollama_list, ollama_list_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.1

```
ollama_list
```
```
NAME                                                      ID              SIZE      MODIFIED     
deepseek-r1:8b                                            6995872bfe4c    5.2 GB    13 days ago     
dolphin3:8b                                               d5ab9ae8e1f2    4.9 GB    13 days ago     
gemma3n:e2b                                               719372f8c7de    5.6 GB    26 hours ago    
gemma3n:e4b                                               15cb39fd9394    7.5 GB    2 weeks ago     
granite3.3:2b                                             07bd1f170855    1.5 GB    23 hours ago    
granite3.3:8b                                             fd429f23b909    4.9 GB    23 hours ago    
hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS    d6e3345a2af6    4.4 GB    26 hours ago    
hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M    33f561b5281e    5.7 GB    27 hours ago    
hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L    bcbfe32e5762    6.8 GB    28 hours ago    
mistral:7b                                                6577803aa9a0    4.4 GB    23 hours ago    
qwen2.5vl:7b                                              5ced39dfa4ba    6.0 GB    13 days ago     
qwen3:8b                                                  500a1f067a9f    5.2 GB    2 weeks ago     
smollm2:1.7b                                              cef4a1e09247    1.8 GB    23 hours ago    
```

```
ollama_list_array
```
```
deepseek-r1:8b dolphin3:8b gemma3n:e2b gemma3n:e4b granite3.3:2b granite3.3:8b hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:IQ4_XS hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L mistral:7b qwen2.5vl:7b qwen3:8b smollm2:1.7b
```

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
      "name": "granite3.3:8b",
      "model": "granite3.3:8b",
      "modified_at": "2025-08-03T20:52:15.6705564+02:00",
      "size": 4942891653,
      "digest": "fd429f23b90980ed1bef53b990894e7b0199331f6ae90c5650240a7d5b70f1f7",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "granite",
        "families": [
          "granite"
        ],
        "parameter_size": "8.2B",
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
      "name": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M",
      "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q5_K_M",
      "modified_at": "2025-08-03T17:34:28.0779621+02:00",
      "size": 5724147669,
      "digest": "33f561b5281e341c47cbe7f41e4f141a0695bb41924a5711a98d32f8cf50daac",
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
      "name": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
      "model": "hf.co/bartowski/Ministral-8B-Instruct-2410-GGUF:Q6_K_L",
      "modified_at": "2025-08-03T16:36:32.1504738+02:00",
      "size": 6847631317,
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
      }
    },
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
