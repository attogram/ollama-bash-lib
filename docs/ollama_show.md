# ollama_show

Show detailed information about a model in a human-readable format.

## Alias

`os`

## Usage
```
Usage: ollama_show -m <model> [-h] [-v]
```

## Description
```
Show detailed information about a model in a human-readable format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama show' to display details about a specified model, including its parameters, template, and more.
It is useful for inspecting the configuration of a model.
```

## Arguments
* `-m <model>`: The name of the model to show.

## Output
Text containing information about the model is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
