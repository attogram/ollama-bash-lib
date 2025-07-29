# ollama_chat
A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.38.1

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
echo "$(ollama_messages_count) messages:"
ollama_messages
echo
ollama_chat "llava:7b"
```
```
2 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}

 Yes, I understand. Please let me know if there's anything else I can help you with! 
```
```bash
echo "$(ollama_messages_count) messages:"
ollama_messages
```
```
3 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":" Yes, I understand. Please let me know if there's anything else I can help you with! "}
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "llava:7b"
```
```
 The secret word is "RABBIT". 
```
```bash
echo "$(ollama_messages_count) messages:"
ollama_messages
```
```
5 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":" Yes, I understand. Please let me know if there's anything else I can help you with! "}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":" The secret word is \"RABBIT\". "}
```
