# ollama_thinking

Configures the 'thinking' mode for model responses.

## Alias

`ot`

## Usage

```bash
ollama_thinking [on|off|hide]
```

## Description

This function sets the `OBL_THINKING` environment variable, which controls whether the model's 'thinking' process is displayed.

### Modes:
* `on`: Show thinking output.
* `off`: Hide thinking output.
* `hide`: Do not show thinking output, but it is still available in the JSON response.

If no mode is provided, the current setting will be printed.

## Arguments

* `[on|off|hide]`: The mode to set. This is optional.

## Output

If no arguments are provided, the current thinking mode setting is sent to `stdout`.

## Return

* `0`: Success.
* `1`: Error (e.g., unknown mode).
