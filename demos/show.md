# ollama_show, ollama_show_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.45.5

ollama_show "gpt-oss:120b"

```
  Model
    architecture        gptoss    
    parameters          116.8B    
    context length      131072    
    embedding length    2880      
    quantization        MXFP4     

  Capabilities
    thinking    

```


ollama_show_json "gpt-oss:120b"

```
{
  "details": {
    "parent_model": "gpt-oss:120b",
    "format": "",
    "family": "gptoss",
    "families": null,
    "parameter_size": "116829156672",
    "quantization_level": "MXFP4"
  },
  "model_info": {
    "general.architecture": "gptoss",
    "general.parameter_count": 116829156672,
    "gptoss.context_length": 131072,
    "gptoss.embedding_length": 2880
  },
  "capabilities": [
    "thinking"
  ],
  "modified_at": "0001-01-01T00:00:00Z"
}
```
