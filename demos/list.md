# ollama_list, ollama_list_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.40.0
```

ollama_list

NAME                         ID              SIZE      MODIFIED    
qwen3:14b                    bdbd181c33f2    9.3 GB    2 weeks ago    
deepseek-r1:14b              c333b7232bdb    9.0 GB    2 weeks ago    
llama3.1:8b-instruct-q4_1    e129e608a752    5.1 GB    2 weeks ago    
mistral:7b-instruct          3944fe81ec14    4.1 GB    2 weeks ago    
gemma3n:e4b                  15cb39fd9394    7.5 GB    2 weeks ago    
cogito:3b                    bd144357d717    2.2 GB    3 weeks ago    
granite3.3:8b                fd429f23b909    4.9 GB    3 weeks ago    
llama3.2:3b                  a80c4f17acd5    2.0 GB    3 weeks ago    
gemma3n:e2b                  719372f8c7de    5.6 GB    3 weeks ago    
qwen3:4b                     2bfd38a7daaf    2.6 GB    3 weeks ago    
cogito:8b                    75b508ddece1    4.9 GB    3 weeks ago    
hermes3:8b                   4f6b83f30b62    4.7 GB    3 weeks ago    
deepseek-r1:8b               6995872bfe4c    5.2 GB    3 weeks ago    
qwen3:0.6b                   7df6b6e09427    522 MB    3 weeks ago    
smollm2:1.7b                 cef4a1e09247    1.8 GB    3 weeks ago    
smollm2:360m                 297281b699fc    725 MB    3 weeks ago    
smollm2:135m                 9077fe9d2ae1    270 MB    3 weeks ago    
llama3.2:1b                  baf6a787fdff    1.3 GB    5 weeks ago    
deepseek-r1:1.5b             e0979632db5a    1.1 GB    5 weeks ago    
qwen3:8b                     500a1f067a9f    5.2 GB    5 weeks ago    
granite3.3:2b                07bd1f170855    1.5 GB    5 weeks ago    
dolphin-mistral:7b           5dc8c5a2be65    4.1 GB    6 weeks ago    
qwen3:1.7b                   8f68893c685c    1.4 GB    7 weeks ago    
gemma:2b                     b50d6c999e59    1.7 GB    7 weeks ago    
dolphin3:8b                  d5ab9ae8e1f2    4.9 GB    7 weeks ago    
deepcoder:1.5b               3bc49891ec47    1.1 GB    7 weeks ago    
llava-phi3:3.8b              c7edd7b87593    2.9 GB    7 weeks ago    
llava-llama3:8b              44c161b1f465    5.5 GB    7 weeks ago    
minicpm-v:8b                 c92bfad01205    5.5 GB    7 weeks ago    
mistral:7b                   f974a74358d6    4.1 GB    7 weeks ago    
qwen2.5-coder:7b             dae161e27b0e    4.7 GB    7 weeks ago    
codellama:7b                 8fdf8f752f6e    3.8 GB    7 weeks ago    
gemma3:1b                    8648f39daa8f    815 MB    7 weeks ago    
llava:7b                     8dd30f6b0cb1    4.7 GB    7 weeks ago    
qwen2.5vl:7b                 5ced39dfa4ba    6.0 GB    7 weeks ago    
gemma3:4b                    a2af6cc3eb7f    3.3 GB    7 weeks ago    
qwen2.5vl:3b                 fb90415cde1e    3.2 GB    7 weeks ago    

ollama_list_json

{
  "models": [
    {
      "name": "qwen3:14b",
      "model": "qwen3:14b",
      "modified_at": "2025-07-11T20:04:53.236737569+02:00",
      "size": 9276198565,
      "digest": "bdbd181c33f2ed1b31c972991882db3cf4d192569092138a7d29e973cd9debe8",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen3",
        "families": [
          "qwen3"
        ],
        "parameter_size": "14.8B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "deepseek-r1:14b",
      "model": "deepseek-r1:14b",
      "modified_at": "2025-07-11T19:31:47.150283227+02:00",
      "size": 8988112209,
      "digest": "c333b7232bdb521236694ffbb5f5a6b11cc45d98e9142c73123b670fca400b09",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen2",
        "families": [
          "qwen2"
        ],
        "parameter_size": "14.8B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "llama3.1:8b-instruct-q4_1",
      "model": "llama3.1:8b-instruct-q4_1",
      "modified_at": "2025-07-11T19:05:50.182386915+02:00",
      "size": 5130271918,
      "digest": "e129e608a75255d65ab033dbfd9e2e5935d75e876550110273ac6fd1a6571ce8",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "8.0B",
        "quantization_level": "Q4_1"
      }
    },
    {
      "name": "mistral:7b-instruct",
      "model": "mistral:7b-instruct",
      "modified_at": "2025-07-11T18:47:40.506171286+02:00",
      "size": 4113301822,
      "digest": "3944fe81ec14610e0852c3d915768ee8d507ea541387fdfcbbf9edaa0c757734",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "7.2B",
        "quantization_level": "Q4_0"
      }
    },
    {
      "name": "gemma3n:e4b",
      "model": "gemma3n:e4b",
      "modified_at": "2025-07-11T18:44:02.665974994+02:00",
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
    },
    {
      "name": "cogito:3b",
      "model": "cogito:3b",
      "modified_at": "2025-07-08T20:21:28.950499509+02:00",
      "size": 2241013645,
      "digest": "bd144357d717922daff29200122c3f2aab52d2a643ec73ce304f7827069ec74d",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "3.6B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "granite3.3:8b",
      "model": "granite3.3:8b",
      "modified_at": "2025-07-08T20:00:52.335253465+02:00",
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
      "name": "llama3.2:3b",
      "model": "llama3.2:3b",
      "modified_at": "2025-07-07T21:51:42.515372094+02:00",
      "size": 2019393189,
      "digest": "a80c4f17acd55265feec403c7aef86be0c25983ab279d83f3bcd3abbcb5b8b72",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "3.2B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "gemma3n:e2b",
      "model": "gemma3n:e2b",
      "modified_at": "2025-07-07T15:29:43.105978778+02:00",
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
      "name": "qwen3:4b",
      "model": "qwen3:4b",
      "modified_at": "2025-07-07T12:49:09.011522046+02:00",
      "size": 2620788260,
      "digest": "2bfd38a7daaf4b1037efe517ccb73d1a3bbd4822cf89f1a82be1569050a114e0",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen3",
        "families": [
          "qwen3"
        ],
        "parameter_size": "4.0B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "cogito:8b",
      "model": "cogito:8b",
      "modified_at": "2025-07-06T19:13:19.734377972+02:00",
      "size": 4920747948,
      "digest": "75b508ddece134205c621b91237310024ca983027fb7f724c2032d106419bd1b",
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
      "name": "hermes3:8b",
      "model": "hermes3:8b",
      "modified_at": "2025-07-06T14:05:12.011995281+02:00",
      "size": 4661227243,
      "digest": "4f6b83f30b62bc3d0cf9be09266db222805ee815c8fd7d8b38f863f655be78b7",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "8.0B",
        "quantization_level": "Q4_0"
      }
    },
    {
      "name": "deepseek-r1:8b",
      "model": "deepseek-r1:8b",
      "modified_at": "2025-07-06T13:53:47.962152456+02:00",
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
      "name": "qwen3:0.6b",
      "model": "qwen3:0.6b",
      "modified_at": "2025-07-06T12:43:44.236577907+02:00",
      "size": 522653767,
      "digest": "7df6b6e09427a769808717c0a93cadc4ae99ed4eb8bf5ca557c90846becea435",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen3",
        "families": [
          "qwen3"
        ],
        "parameter_size": "751.63M",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "smollm2:1.7b",
      "model": "smollm2:1.7b",
      "modified_at": "2025-07-03T19:29:45.646736864+02:00",
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
      "name": "smollm2:360m",
      "model": "smollm2:360m",
      "modified_at": "2025-07-03T19:20:16.871802052+02:00",
      "size": 725566512,
      "digest": "297281b699fc51376006233ca400cd664c4f7b80ed88a47ef084f1e4b089803b",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "361.82M",
        "quantization_level": "F16"
      }
    },
    {
      "name": "smollm2:135m",
      "model": "smollm2:135m",
      "modified_at": "2025-07-03T19:17:30.536524511+02:00",
      "size": 270898672,
      "digest": "9077fe9d2ae1a4a41a868836b56b8163731a8fe16621397028c2c76f838c6907",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "134.52M",
        "quantization_level": "F16"
      }
    },
    {
      "name": "llama3.2:1b",
      "model": "llama3.2:1b",
      "modified_at": "2025-06-23T09:33:32.2467426+02:00",
      "size": 1321098329,
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
      }
    },
    {
      "name": "deepseek-r1:1.5b",
      "model": "deepseek-r1:1.5b",
      "modified_at": "2025-06-23T09:29:07.210707775+02:00",
      "size": 1117322768,
      "digest": "e0979632db5a88d1a53884cb2a941772d10ff5d055aabaa6801c4e36f3a6c2d7",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen2",
        "families": [
          "qwen2"
        ],
        "parameter_size": "1.8B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "qwen3:8b",
      "model": "qwen3:8b",
      "modified_at": "2025-06-20T20:28:15.494308886+02:00",
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
      "name": "granite3.3:2b",
      "model": "granite3.3:2b",
      "modified_at": "2025-06-20T12:27:10.940013854+02:00",
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
      "name": "dolphin-mistral:7b",
      "model": "dolphin-mistral:7b",
      "modified_at": "2025-06-17T10:26:28.210344861+02:00",
      "size": 4108940323,
      "digest": "5dc8c5a2be6510dcb2afbcffdedc73acbd5868d2c25d9402f6044beade3d5f70",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "7B",
        "quantization_level": "Q4_0"
      }
    },
    {
      "name": "qwen3:1.7b",
      "model": "qwen3:1.7b",
      "modified_at": "2025-06-09T13:58:56.657031871+02:00",
      "size": 1359293444,
      "digest": "8f68893c685c3ddff2aa3fffce2aa60a30bb2da65ca488b61fff134a4d1730e7",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen3",
        "families": [
          "qwen3"
        ],
        "parameter_size": "2.0B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "gemma:2b",
      "model": "gemma:2b",
      "modified_at": "2025-06-09T13:56:24.790452967+02:00",
      "size": 1678456656,
      "digest": "b50d6c999e592ae4f79acae23b4feaefbdfceaa7cd366df2610e3072c052a160",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "gemma",
        "families": [
          "gemma"
        ],
        "parameter_size": "3B",
        "quantization_level": "Q4_0"
      }
    },
    {
      "name": "dolphin3:8b",
      "model": "dolphin3:8b",
      "modified_at": "2025-06-09T13:53:21.335009089+02:00",
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
      "name": "deepcoder:1.5b",
      "model": "deepcoder:1.5b",
      "modified_at": "2025-06-09T13:44:56.954778865+02:00",
      "size": 1117323700,
      "digest": "3bc49891ec476c824dce80db4140aae693004f631a69c1ebb0f9e8e47e8e7999",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen2",
        "families": [
          "qwen2"
        ],
        "parameter_size": "1.8B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "llava-phi3:3.8b",
      "model": "llava-phi3:3.8b",
      "modified_at": "2025-06-08T22:59:18.091244027+02:00",
      "size": 2926568956,
      "digest": "c7edd7b8759394f9995a9394b97a29aeff7ee9c921054a210347326287d300f2",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama",
          "clip"
        ],
        "parameter_size": "4B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "llava-llama3:8b",
      "model": "llava-llama3:8b",
      "modified_at": "2025-06-08T22:19:54.211880148+02:00",
      "size": 5545682182,
      "digest": "44c161b1f46523301da9c0cc505afa4a4a0cc62f580581d98a430bb21acd46de",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama",
          "clip"
        ],
        "parameter_size": "8B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "minicpm-v:8b",
      "model": "minicpm-v:8b",
      "modified_at": "2025-06-08T22:19:16.066567907+02:00",
      "size": 5473838466,
      "digest": "c92bfad0120556eda311984f1ac2f0d0a589b8d68c4053c13486b526276aa205",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen2",
        "families": [
          "qwen2",
          "clip"
        ],
        "parameter_size": "7.6B",
        "quantization_level": "Q4_0"
      }
    },
    {
      "name": "mistral:7b",
      "model": "mistral:7b",
      "modified_at": "2025-06-08T21:45:17.762914712+02:00",
      "size": 4113301824,
      "digest": "f974a74358d62a017b37c6f424fcdf2744ca02926c4f952513ddf474b2fa5091",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama"
        ],
        "parameter_size": "7.2B",
        "quantization_level": "Q4_0"
      }
    },
    {
      "name": "qwen2.5-coder:7b",
      "model": "qwen2.5-coder:7b",
      "modified_at": "2025-06-08T21:37:19.904910263+02:00",
      "size": 4683087561,
      "digest": "dae161e27b0e90dd1856c8bb3209201fd6736d8eb66298e75ed87571486f4364",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen2",
        "families": [
          "qwen2"
        ],
        "parameter_size": "7.6B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "codellama:7b",
      "model": "codellama:7b",
      "modified_at": "2025-06-08T21:36:16.944958422+02:00",
      "size": 3825910662,
      "digest": "8fdf8f752f6e80de33e82f381aba784c025982752cd1ae9377add66449d2225f",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": null,
        "parameter_size": "7B",
        "quantization_level": "Q4_0"
      }
    },
    {
      "name": "gemma3:1b",
      "model": "gemma3:1b",
      "modified_at": "2025-06-08T12:54:43.830884512+02:00",
      "size": 815319791,
      "digest": "8648f39daa8fbf5b18c7b4e6a8fb4990c692751d49917417b8842ca5758e7ffc",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "gemma3",
        "families": [
          "gemma3"
        ],
        "parameter_size": "999.89M",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "llava:7b",
      "model": "llava:7b",
      "modified_at": "2025-06-08T12:47:12.69352537+02:00",
      "size": 4733363377,
      "digest": "8dd30f6b0cb19f555f2c7a7ebda861449ea2cc76bf1f44e262931f45fc81d081",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "llama",
        "families": [
          "llama",
          "clip"
        ],
        "parameter_size": "7B",
        "quantization_level": "Q4_0"
      }
    },
    {
      "name": "qwen2.5vl:7b",
      "model": "qwen2.5vl:7b",
      "modified_at": "2025-06-05T22:19:40.459044824+02:00",
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
      "name": "gemma3:4b",
      "model": "gemma3:4b",
      "modified_at": "2025-06-05T18:47:19.197832569+02:00",
      "size": 3338801804,
      "digest": "a2af6cc3eb7fa8be8504abaf9b04e88f17a119ec3f04a3addf55f92841195f5a",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "gemma3",
        "families": [
          "gemma3"
        ],
        "parameter_size": "4.3B",
        "quantization_level": "Q4_K_M"
      }
    },
    {
      "name": "qwen2.5vl:3b",
      "model": "qwen2.5vl:3b",
      "modified_at": "2025-06-05T18:37:07.435835803+02:00",
      "size": 3200627168,
      "digest": "fb90415cde1ef08aa669ae74b082d49b158729b6db1ab183c941417d507e71a1",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "qwen25vl",
        "families": [
          "qwen25vl"
        ],
        "parameter_size": "3.8B",
        "quantization_level": "Q4_K_M"
      }
    }
  ]
}
```
