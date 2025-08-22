# ollama_app_installed

Check if the Ollama application is installed on the local system.

## Alias

`oai`

## Usage from Help Text
```
Usage: ollama_app_installed [-h] [-v]
```

## Description from Help Text
```
Check if the Ollama application is installed on the local system.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses the 'command -v' utility to determine if the 'ollama' executable is in the system's PATH.
It is useful for pre-flight checks in scripts to ensure that required dependencies are available.
```

## Output
None.

## Return
* `0`: Ollama is installed.
* `1`: Ollama is not installed.
* `2`: Usage error.
