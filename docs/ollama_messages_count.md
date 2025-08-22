# ollama_messages_count

Get the number of messages in the current session.

## Alias

`omco`

## Usage from Help Text
```
Usage: ollama_messages_count [-h] [-v]
```

## Description from Help Text
```
Get the number of messages in the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function returns the current number of messages stored in the 'OBL_MESSAGES' array.
It can be used to check if a conversation has started or to monitor the length of the conversation history.
```

## Output
The number of messages is sent to `stdout`.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
