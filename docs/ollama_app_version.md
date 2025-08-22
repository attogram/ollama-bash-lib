# ollama_app_version

Get the version of the Ollama application as plain text.

## Alias

`oave`

## Usage from Help Text
```
Usage: ollama_app_version [-h] [-v]
```

## Description from Help Text
```
Get the version of the Ollama application as plain text.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function queries the Ollama API for its version and returns just the version string.
It provides a simple way to check the installed Ollama version.
```

## Output
The Ollama version string is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
