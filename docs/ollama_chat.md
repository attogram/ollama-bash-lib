# ollama_chat

Request a chat completion from a model, receiving a plain text response.

## Alias

`oc`

## Usage from Help Text
```
Usage: ollama_chat -m <model> [-h] [-v]
```

## Description from Help Text
```
Request a chat completion from a model, receiving a plain text response.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function is a user-friendly wrapper around 'ollama_chat_json'.
It handles the JSON parsing and returns only the content of the model's message as a single string.
It is ideal for simple, non-streaming chat interactions.
```

## Arguments
* `-m <model>`: The name of the model to use.

## Output
The generated text is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
