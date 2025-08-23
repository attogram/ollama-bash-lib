# How to Chat

See `demos/interactive.chat.sh` for an example of an interactive chat session.

Chat is based on a list of messages that is sent to the model on every request.

Add a message:
```
ollama_messages_add user "Hello"
```

Send the message list to the model:
```
ollama_chat gpt-oss:20b
```

This will do a Chat Completion, based on the message list, and send it to `stdout`.

You are responsible for adding the response into the message list:
```
response="$(ollama_chat gpt-oss:20b)"
ollama_messages_add assistant "$response"
echo "$response"
```

View the current message list (in JSON format) with `ollama_messages`

Clear the message list with `ollama_messages_clear`

Get the message count with `ollama_messages_count`
