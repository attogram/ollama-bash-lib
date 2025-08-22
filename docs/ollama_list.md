# ollama_list

List all available models in a human-readable format.

## Alias

`ol`

## Usage
```
Usage: ollama_list [-h] [-v]
```

## Description
```
List all available models in a human-readable format.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function uses 'ollama list' to display a formatted table of all locally available models.
It is a convenient way to quickly see the models you have installed.
```

## Output
A list of available models is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
