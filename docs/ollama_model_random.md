# ollama_model_random

Get the name of a randomly selected model.

## Alias

`omr`

## Usage from Help Text
```
Usage: ollama_model_random [-h] [-v]
```

## Description from Help Text
```
Get the name of a randomly selected model.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function selects a model at random from the list of locally available models.
It is useful when you want to use any available model without specifying one, for example, in testing or for creative applications.
```

## Output
A single model name is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error (e.g., no models available).
* `2`: Usage error.
