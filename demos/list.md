# ollama_list, ollama_list_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.48.0

```
ollama_list
```
```
NAME                  ID              SIZE      MODIFIED    
deepseek-v3.1:671b    e1c8a9725f49    688 GB    2 weeks ago    
gpt-oss:120b          d98fe6ba01e6    65 GB     5 weeks ago    
gpt-oss:20b           05afbac4bad6    13 GB     5 weeks ago    
```

```
ollama_list_array
```
deepseek-v3.1:671b gpt-oss:120b gpt-oss:20b

```
ollama_list_json | jq '.'
```
```json
{
  "models": [
    {
      "name": "deepseek-v3.1:671b",
      "model": "deepseek-v3.1:671b",
      "modified_at": "2025-08-21T00:00:00Z",
      "size": 688586727753,
      "digest": "e1c8a9725f49",
      "details": {
        "parent_model": "",
        "format": "",
        "family": "",
        "families": null,
        "parameter_size": "",
        "quantization_level": ""
      }
    },
    {
      "name": "gpt-oss:120b",
      "model": "gpt-oss:120b",
      "modified_at": "2025-08-05T00:00:00Z",
      "size": 65290180781,
      "digest": "d98fe6ba01e6",
      "details": {
        "parent_model": "",
        "format": "",
        "family": "",
        "families": null,
        "parameter_size": "",
        "quantization_level": ""
      }
    },
    {
      "name": "gpt-oss:20b",
      "model": "gpt-oss:20b",
      "modified_at": "2025-08-05T00:00:00Z",
      "size": 13780162412,
      "digest": "05afbac4bad6",
      "details": {
        "parent_model": "",
        "format": "",
        "family": "",
        "families": null,
        "parameter_size": "",
        "quantization_level": ""
      }
    }
  ]
}
```
