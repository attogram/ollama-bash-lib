# ollama_ps_json

List running model processes in JSON format.

## Alias

`opj`

## Usage from Help Text
```
Usage: ollama_ps_json [-h] [-v]
```

## Description from Help Text
```
List running model processes in JSON format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API to get a list of running models and returns the raw JSON response.
This is useful for programmatic monitoring and management of running models.
```

## Output
A JSON object containing a list of running models is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
