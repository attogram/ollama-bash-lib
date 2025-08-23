# ollama_model_unload

Unload a model from memory.

## Alias

`omu`

## Usage
```
Usage: ollama_model_unload -m <model> [-h] [-v]
```

## Description
```
Unload a model from memory.

  -m <model>  Name of the model to unload (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function frees up system resources by unloading a specified model from memory.
This is useful for managing memory usage, especially on systems with limited resources.
```

## Arguments
* `-m <model>`: The name of the model to unload.

## Output
None.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
