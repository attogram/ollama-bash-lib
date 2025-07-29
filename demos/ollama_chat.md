Ollama Bash Lib - Demo - ollama_chat
ollama_bash_lib: ./../ollama_bash_lib.sh
ollama_lib_version: v0.38.0
ollama_installed: OK
ollama_api_ping: OK

model: llava-phi3:3.8b

0 messages:

ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"

2 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}

ollama_chat "llava-phi3:3.8b"

Yes, I understand. The secret word is RABBIT. Is there anything else you would like to know or discuss?

ollama_messages_add "assistant" "RESPONSE"
ollama_messages_add "user" "What's the secret word??"

4 messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"Yes, I understand. The secret word is RABBIT. Is there anything else you would like to know or discuss?"}
{"role":"user","content":"What's the secret word??"}

ollama_chat "llava-phi3:3.8b"

The secret word is RABBIT. Is there anything else you need help with?
