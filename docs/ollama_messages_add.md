# ollama_messages_add

Add a message to the current session's message history.

## Alias

`oma`

## Usage
```
Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]
```

## Description
```
Add a message to the current session's message history.

  -r <role>   The role of the message sender (user, assistant, system).
  -c <content> The content of the message.
  -h          Show this help and exit.
  -v          Show version information and exit.

This function appends a new message object to the 'OBL_MESSAGES' array.
This history is then used by 'ollama_chat' and related functions to maintain a conversation with the model.
```

## Arguments
* `-r <role>`: The role of the message author (e.g., "user", "assistant").
* `-c <content>`: The content of the message.

## Output
None.

## Return
* `0`: Success.
* `1`: Error.
* `2`: Usage error.
