# ollama_chat_json

Request a chat completion from a model, receiving JSON output.

## Alias

`ocj`

## Usage
```
Usage: ollama_chat_json -m <model> [-h] [-v]
```

## Description
```
Request a chat completion from a model, receiving JSON output.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function sends the entire message history ('OBL_MESSAGES') to the specified model and returns the model's response as a raw JSON object.
It serves as the foundation for 'ollama_chat_stream', which provides more user-friendly text-based outputs.
If 'OBL_STREAM' is 0, it adds the assistant's response to the message history.
```

## Arguments
* `-m <model>`: The name of the model to use.

## Output
A JSON object containing the chat completion. If streaming is enabled, a stream of JSON objects is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
