# ollama_ps

List running model processes in a human-readable format.

## Alias

`op`

## Usage from Help Text
```
Usage: ollama_ps [-h] [-v]
```

## Description from Help Text
```
List running model processes in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama ps' to display a table of all models currently running in memory.
It is a quick way to check which models are active and consuming resources.
```

## Output
A table of running models is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
