# ollama_list_array

Lists all available models in a space-separated format suitable for a bash array.

## Alias

`ola`

## Usage

```bash
models=($(ollama_list_array))
```

## Output

A space-separated list of model names is sent to `stdout`.

## Return

* `0`: Success.
* `1`: Error.
