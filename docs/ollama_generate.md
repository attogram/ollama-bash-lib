# ollama_generate

Generate a completion from a model as plain text.

## Alias

`og`

## Usage
```
Usage: ollama_generate -m <model> [-p <prompt>] [-h] [-v]
```

## Description
```
Generate a completion from a model as plain text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a wrapper around 'ollama_generate_json'. It takes the raw JSON output and extracts the 'response' field, returning it as a single string.
This is useful for when you only need the generated text and don't want to parse the JSON yourself.
```

## Arguments
* `-m <model>`: The name of the model to use.
* `-p <prompt>`: The prompt to send to the model.

## Output
The generated text is sent to `stdout`.

## Return
* `0`: Success
* `1`: Error
* `2`: Usage error.
