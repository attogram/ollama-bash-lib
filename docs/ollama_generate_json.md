# ollama_generate_json

Generate a completion from a model as JSON.

## Alias

`ogj`

## Usage
```
Usage: ollama_generate_json -m <model> [-p <prompt>] [-h] [-v]
```

## Description
```
Generate a completion from a model as JSON.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends a prompt to a specified model and returns the model's response as a raw JSON object.
If streaming is enabled via the global 'OBL_STREAM' variable, it will return a stream of JSON objects.
This is a foundational function for 'ollama_generate' and 'ollama_generate_stream', which process this JSON output into plain text.
```

## Arguments
* `-m <model>`: The name of the model to use.
* `-p <prompt>`: The prompt to send to the model.

## Output
A JSON object containing the generated text and other metadata is sent to `stdout`.

## Return
* `0`: Success
* `1`: Error
* `2`: Usage error.
