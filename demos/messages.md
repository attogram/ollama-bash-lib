Ollama Bash Lib - Demo - Messages
ollama_bash_lib: ./../ollama_bash_lib.sh
ollama_lib_version: v0.38.0
ollama_installed: OK
ollama_api_ping: OK

ollama_messages_count: 0
ollama_messages:

ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_count: 1
ollama_messages:
{"role":"system","content":"You are a helpful assistant"}

ollama_messages_add "user" "Hi"
ollama_messages_count: 2
ollama_messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"Hi"}

ollama_messages_add "assistant" "Hello!"
ollama_messages_count: 3
ollama_messages:
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"Hi"}
{"role":"assistant","content":"Hello!"}

ollama_messages_clear
ollama_messages_count: 0
ollama_messages:
