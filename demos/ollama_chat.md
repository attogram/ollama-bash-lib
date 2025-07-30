# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "mistral:7b-instruct"
```
```
 Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "mistral:7b-instruct"
```
```
 The secret word is "RABBIT".
```
```bash
ollama_messages | jq -c
```
```json
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":" Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":" The secret word is \"RABBIT\"."}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "mistral:7b-instruct"
```
```
[DEBUG] ollama_messages_add: [system]
[DEBUG] json_safe_value: 7 bytes [system]
[DEBUG] json_safe_value: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 94 bytes [The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?]
[DEBUG] ollama_chat: [mistral:7b-instruct]
[DEBUG] ollama_chat_json: [mistral:7b-instruct]
[DEBUG] json_safe_value: 20 bytes [mistral:7b-instruct]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"mistral:7b-instruct","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 390 bytes [{"model":"mistral:7b-instruct","created_at":"2025-07-30T16:42:45.659724Z","message":{"role":"assistant","content":" Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."},"done_reason":"stop","done":true,"total_duration":1503950333,"load_duration":24249916,"prompt_eval_count":37,"prompt_eval_duration":343185417,"eval_count":24,"eval_duration":1135413666}]
[DEBUG] jq_sanitized: sanitized: [{"model":"mistral:7b-instruct","created_at":"2025-07-30T16:42:45.659724Z","message":{"role":"assistant","content":" Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."},"done_reason":"stop","done":true,"total_duration":1503950333,"load_duration":24249916,"prompt_eval_count":37,"prompt_eval_duration":343185417,"eval_count":24,"eval_duration":1135413666}]
[DEBUG] ollama_chat_json: content:  Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 85 bytes [ Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".]
[DEBUG] jq_sanitize: 390 bytes [{"model":"mistral:7b-instruct","created_at":"2025-07-30T16:42:45.659724Z","message":{"role":"assistant","content":" Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."},"done_reason":"stop","done":true,"total_duration":1503950333,"load_duration":24249916,"prompt_eval_count":37,"prompt_eval_duration":343185417,"eval_count":24,"eval_duration":1135413666}]
[DEBUG] jq_sanitized: sanitized: [{"model":"mistral:7b-instruct","created_at":"2025-07-30T16:42:45.659724Z","message":{"role":"assistant","content":" Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."},"done_reason":"stop","done":true,"total_duration":1503950333,"load_duration":24249916,"prompt_eval_count":37,"prompt_eval_duration":343185417,"eval_count":24,"eval_duration":1135413666}]
[DEBUG] ollama_chat: content:  Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".
 Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 85 bytes [ Yes, I understand. If you ask me for the secret word, I will respond with "RABBIT".]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "mistral:7b-instruct"
```
```
[DEBUG] ollama_messages_add: [user]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [mistral:7b-instruct]
[DEBUG] ollama_chat_json: [mistral:7b-instruct]
[DEBUG] json_safe_value: 20 bytes [mistral:7b-instruct]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"mistral:7b-instruct","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":" Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."},{"role":"user","content":"What is the secret word??"}],"stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 334 bytes [{"model":"mistral:7b-instruct","created_at":"2025-07-30T16:42:46.837056Z","message":{"role":"assistant","content":" The secret word is \"RABBIT\"."},"done_reason":"stop","done":true,"total_duration":1000233709,"load_duration":21018250,"prompt_eval_count":71,"prompt_eval_duration":519454708,"eval_count":10,"eval_duration":457818125}]
[DEBUG] jq_sanitized: sanitized: [{"model":"mistral:7b-instruct","created_at":"2025-07-30T16:42:46.837056Z","message":{"role":"assistant","content":" The secret word is \"RABBIT\"."},"done_reason":"stop","done":true,"total_duration":1000233709,"load_duration":21018250,"prompt_eval_count":71,"prompt_eval_duration":519454708,"eval_count":10,"eval_duration":457818125}]
[DEBUG] ollama_chat_json: content:  The secret word is "RABBIT".
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 30 bytes [ The secret word is "RABBIT".]
[DEBUG] jq_sanitize: 334 bytes [{"model":"mistral:7b-instruct","created_at":"2025-07-30T16:42:46.837056Z","message":{"role":"assistant","content":" The secret word is \"RABBIT\"."},"done_reason":"stop","done":true,"total_duration":1000233709,"load_duration":21018250,"prompt_eval_count":71,"prompt_eval_duration":519454708,"eval_count":10,"eval_duration":457818125}]
[DEBUG] jq_sanitized: sanitized: [{"model":"mistral:7b-instruct","created_at":"2025-07-30T16:42:46.837056Z","message":{"role":"assistant","content":" The secret word is \"RABBIT\"."},"done_reason":"stop","done":true,"total_duration":1000233709,"load_duration":21018250,"prompt_eval_count":71,"prompt_eval_duration":519454708,"eval_count":10,"eval_duration":457818125}]
[DEBUG] ollama_chat: content:  The secret word is "RABBIT".
 The secret word is "RABBIT".
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 30 bytes [ The secret word is "RABBIT".]
```
```bash
ollama_messages | jq -c
```
```json
[DEBUG] ollama_messages
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":" Yes, I understand. If you ask me for the secret word, I will respond with \"RABBIT\"."}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":" The secret word is \"RABBIT\"."}
```
