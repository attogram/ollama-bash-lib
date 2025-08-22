# ollama_generate_stream

Generate a completion from a model as a stream of text.

## Alias

`ogs`

## Usage
```
Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]
```

## Description
```
Generate a completion from a model as a stream of text.

  -m <model>  Name of the model to use (required).
  -p <prompt> Prompt text. If omitted, the function reads from STDIN.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls ollama_generate_stream_json and pipes the output to jq to extract the response field from each JSON object, providing a continuous stream of text.
It is ideal for displaying real-time generation in interactive scripts.
```

## Arguments
* `-m <model>`: The name of the model to use.
* `-p <prompt>`: The prompt to send to the model.

## Output
The generated text is streamed to `stdout`.

## Return
* `0`: Success
* `1`: Error
* `2`: Usage error.
