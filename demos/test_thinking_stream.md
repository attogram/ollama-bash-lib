--- Testing ollama_generate_stream with thinking ON ---
[ERROR] ollama_generate_stream: Not Found: prompt.
Usage: ollama_generate_stream -m <model> [-p <prompt>] [-h] [-v]

--- Testing ollama_chat_stream with thinking ON ---
Error: Missing required arguments

Usage: ollama_messages_add -r <role> -c <content> [-h] [-v]
# <thinking>
# [ERROR] _ollama_chat_payload: Message history is empty
Error: Missing required arguments

Usage: ollama_api_post -P <path> -d <data> [-h] [-v]
[ERROR] _ollama_chat_stream_false: ollama_api_post failed
[ERROR] ollama_messages_last_json: Message History is empty: count: [0]
[ERROR] ollama_messages_last: error getting message content: 1
[ERROR] ollama_chat: ollama_chat_json response empty

# </thinking>

[ERROR] ollama_chat_stream: ollama_chat failed with code 1
