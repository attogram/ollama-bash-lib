# ollama_show_json

Show detailed information about a model in JSON format.

## Alias

`osj`

## Usage
```
Usage: ollama_show_json -m <model> [-h] [-v]
```

## Description
```
Show detailed information about a model in JSON format.

  -m <model>  Name of the model to show (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get detailed information about a specific model and returns the raw JSON response.
This is ideal for programmatic access to model details, allowing for automated configuration checks or modifications.
```

## Arguments
* `-m <model>`: The name of the model to show.

## Output
A JSON object containing information about the model is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
