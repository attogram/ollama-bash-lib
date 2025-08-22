# ollama_lib_version

Get the version of the Ollama Bash Lib.

## Alias

`olv`

## Usage from Help Text
```
Usage: ollama_lib_version [-h] [-v]
```

## Description from Help Text
```
Get the version of the Ollama Bash Lib.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current version number of the library as defined in the 'OBL_VERSION' variable.
It is useful for checking the library version for compatibility or debugging purposes.
```

## Output
The version number of the library is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
