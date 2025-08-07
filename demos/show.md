# ollama_show, ollama_show_json

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.23

ollama_show "gpt-oss:20b"

```
  Model
    architecture        gptoss    
    parameters          20.9B     
    context length      131072    
    embedding length    2880      
    quantization        MXFP4     

```


ollama_show_json "gpt-oss:20b"

```
{
  "details": {
    "parent_model": "gpt-oss:20b",
    "format": "",
    "family": "gptoss",
    "families": null,
    "parameter_size": "20914757184",
    "quantization_level": "MXFP4"
  },
  "model_info": {
    "general.architecture": "gptoss",
    "general.parameter_count": 20914757184,
    "gptoss.context_length": 131072,
    "gptoss.embedding_length": 2880
  },
  "modified_at": "0001-01-01T00:00:00Z"
}
```
