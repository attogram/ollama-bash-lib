# ollama_list_json

List all available models in JSON format.

## Alias

`olj`

## Usage from Help Text
```
Usage: ollama_list_json [-h] [-v]
```

## Description from Help Text
```
List all available models in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for the list of available models and returns the raw JSON response.
This is useful for programmatic access to model information, allowing for easy parsing and manipulation with 'jq'.
```

## Output
A JSON object containing a list of available models is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
