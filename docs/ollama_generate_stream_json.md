# ollama_generate_stream_json

Generate a completion from a model as a stream of JSON objects.

## Alias

`ogsj`

## Usage from Help Text
```
Usage: ollama_generate_stream_json -m <model> [-p <prompt>] [-h] [-v]
```

## Description from Help Text
```
Generate a completion from a model as a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sets the global 'OBL_STREAM' variable to 1 and then calls 'ollama_generate_json'.
It is the basis for 'ollama_generate_stream', which further processes the output into a continuous stream of text.
```

## Arguments
* `-m <model>`: The name of the model to use.
* `-p <prompt>`: The prompt to send to the model.

## Output
A stream of JSON objects containing the generated text and other metadata is sent to `stdout`.

## Return
* `0`: Success
* `1`: Error
* `2`: Usage error.
