# ollama_app_version_json

Get the version of the Ollama application in JSON format.

## Alias

`oavj`

## Usage
```
Usage: ollama_app_version_json [-h] [-v]
```

## Description
```
Get the version of the Ollama application in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API and returns the raw JSON response containing the version information.
This is useful for programmatic version checking and comparison.
```

## Output
A JSON object containing the Ollama version is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
