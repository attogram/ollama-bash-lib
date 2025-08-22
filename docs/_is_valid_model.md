# _is_valid_model

Validates a model name. If the name is empty, it returns a random model name.

## Usage

```bash
_is_valid_model "model_name"
```

## Arguments

* `"model_name"`: The model name to validate.

## Output

If the model name is valid, the same name is sent to `stdout`. If the input name is empty, a random model name is sent to `stdout`. If the name is invalid, an empty string is sent to `stdout`.

## Return

* `0`: The model name is valid.
* `1`: The model name is invalid.
