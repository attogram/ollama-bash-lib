# ollama_messages_clear

Clear all messages from the current session.

## Alias

`omc`

## Usage from Help Text
```
Usage: ollama_messages_clear [-h] [-v]
```

## Description from Help Text
```
Clear all messages from the current session.

  -h          Show this help and exit.
  -v          Show version information and exit.

This function resets the 'OBL_MESSAGES' array, effectively deleting the entire conversation history for the current session.
This is useful for starting a new conversation without restarting the script.
```

## Output
None.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
