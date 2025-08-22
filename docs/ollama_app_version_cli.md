# ollama_app_version_cli

Get the version of the installed Ollama application

## Alias

`oavc`

## Usage
```
Usage: ollama_app_version_cli [-h] [-v]
```

## Description
```
Get the version of the installed Ollama application

  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama --version' to get the version information directly from the command-line application.
This can be useful for verifying the ollama core cli is installed and working correctly.
```

## Output
The Ollama version string is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
