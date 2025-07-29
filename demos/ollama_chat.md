# ollama_chat
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.0

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
echo "$(ollama_messages_count) messages:"
ollama_messages
echo
ollama_chat "gemma3:4b"
```
```
2 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}

RABBIT. 

Understood! 😊
```
```bash
echo "$(ollama_messages_count) messages:"
ollama_messages
```
```
3 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"RABBIT. \n\nUnderstood! 😊"}
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "gemma3:4b"
```
```
RABBIT. 

You got it! 😄
```
```bash
echo "$(ollama_messages_count) messages:"
ollama_messages
```
```
5 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"RABBIT. \n\nUnderstood! 😊"}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":"RABBIT. \n\nYou got it! 😄"}
```
