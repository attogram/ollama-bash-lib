# ollama_chat_stream_json

Request a chat completion from a model, receiving a stream of JSON objects.

## Alias

`ocsj`

## Usage from Help Text
```
Usage: ollama_chat_stream_json -m <model> [-h] [-v]
```

## Description from Help Text
```
Request a chat completion from a model, receiving a stream of JSON objects.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function enables streaming and calls 'ollama_chat' to get a raw stream of JSON objects from the model.
It is the basis for the 'ollama_chat_stream' function, which turns the JSON stream into a more human-readable text stream.
The assistant's response is NOT added to the message history.
```

## Arguments
* `-m <model>`: The name of the model to use.

## Output
A stream of JSON objects is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
