# ollama_list_array

List all available models as a Bash array.

## Alias

`ola`

## Usage
```
Usage: ollama_list_array [-h] [-v]
```

## Description
```
List all available models as a Bash array.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function retrieves the list of models and formats them as a space-separated string, suitable for loading directly into a Bash array.
Example:
  models=($(ollama_list_array))
```

## Output
A space-separated list of model names is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
