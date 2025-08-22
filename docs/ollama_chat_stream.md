# ollama_chat_stream

Request a chat completion from a model, receiving a stream of text.

## Alias

`ocs`

## Usage from Help Text
```
Usage: ollama_chat_stream -m <model> [-h] [-v]
```

## Description from Help Text
```
Request a chat completion from a model, receiving a stream of text.

  -m <model>  Name of the model to use (required).
  -h          Show this help and exit.
  -v          Show version information and exit.

This function calls 'ollama_chat' with streaming enabled and processes the output to provide a continuous stream of text from the model's response.
It is perfect for interactive chat applications where you want to display the response as it is being generated.
The assistant's response is NOT added to the message history.
```

## Arguments
* `-m <model>`: The name of the model to use.

## Output
The generated text is streamed to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
