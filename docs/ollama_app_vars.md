# ollama_app_vars

Display Ollama-related environment variables.

## Alias

`oav`

## Usage from Help Text
```
Usage: ollama_app_vars [-h] [-v]
```

## Description from Help Text
```
Display Ollama-related environment variables.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function prints a list of environment variables that can be used to configure the behavior of the Ollama application.
It is a helpful reference for understanding the available settings and their current values.
```

## Output
A list of environment variables and their current values is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
