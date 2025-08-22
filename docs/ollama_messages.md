# ollama_messages

Get all messages in the current session.

## Alias

`om`

## Usage
```
Usage: ollama_messages [-h] [-v]
```

## Description
```
Get all messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns a JSON array of all messages that have been added to the current session via 'ollama_messages_add'.
The output of this function is suitable for use in the 'messages' field of a chat completion request.
```

## Output
A JSON object for each message in the context is sent to `stdout`, one per line.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
