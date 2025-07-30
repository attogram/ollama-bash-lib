# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.2

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "granite3.3:8b"
```
```
Understood. If you ask for the secret word, I will respond with RABBIT.
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "granite3.3:8b"
```
```
RABBIT
```
```bash
ollama_messages | jq -c
```
```json
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"Understood. If you ask for the secret word, I will respond with RABBIT."}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":"RABBIT"}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "granite3.3:8b"
```
```
[DEBUG] ollama_messages_add: [system]
[DEBUG] json_safe_value: 7 bytes [system]
[DEBUG] json_safe_value: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 94 bytes [The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?]
[DEBUG] ollama_chat: [granite3.3:8b]
[DEBUG] ollama_chat_json: [granite3.3:8b]
[DEBUG] json_safe_value: 14 bytes [granite3.3:8b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"granite3.3:8b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 368 bytes [{"model":"granite3.3:8b","created_at":"2025-07-30T17:44:53.961059Z","message":{"role":"assistant","content":"Understood. If you ask for the secret word, I will respond with RABBIT."},"done_reason":"stop","done":true,"total_duration":1245044959,"load_duration":32764459,"prompt_eval_count":44,"prompt_eval_duration":60836125,"eval_count":20,"eval_duration":1150100750}]
[DEBUG] jq_sanitized: sanitized: [{"model":"granite3.3:8b","created_at":"2025-07-30T17:44:53.961059Z","message":{"role":"assistant","content":"Understood. If you ask for the secret word, I will respond with RABBIT."},"done_reason":"stop","done":true,"total_duration":1245044959,"load_duration":32764459,"prompt_eval_count":44,"prompt_eval_duration":60836125,"eval_count":20,"eval_duration":1150100750}]
[DEBUG] ollama_chat_json: content: Understood. If you ask for the secret word, I will respond with RABBIT.
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 72 bytes [Understood. If you ask for the secret word, I will respond with RABBIT.]
[DEBUG] jq_sanitize: 368 bytes [{"model":"granite3.3:8b","created_at":"2025-07-30T17:44:53.961059Z","message":{"role":"assistant","content":"Understood. If you ask for the secret word, I will respond with RABBIT."},"done_reason":"stop","done":true,"total_duration":1245044959,"load_duration":32764459,"prompt_eval_count":44,"prompt_eval_duration":60836125,"eval_count":20,"eval_duration":1150100750}]
[DEBUG] jq_sanitized: sanitized: [{"model":"granite3.3:8b","created_at":"2025-07-30T17:44:53.961059Z","message":{"role":"assistant","content":"Understood. If you ask for the secret word, I will respond with RABBIT."},"done_reason":"stop","done":true,"total_duration":1245044959,"load_duration":32764459,"prompt_eval_count":44,"prompt_eval_duration":60836125,"eval_count":20,"eval_duration":1150100750}]
[DEBUG] ollama_chat: content: Understood. If you ask for the secret word, I will respond with RABBIT.
Understood. If you ask for the secret word, I will respond with RABBIT.
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 72 bytes [Understood. If you ask for the secret word, I will respond with RABBIT.]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "granite3.3:8b"
```
```
[DEBUG] ollama_messages_add: [user]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [granite3.3:8b]
[DEBUG] ollama_chat_json: [granite3.3:8b]
[DEBUG] json_safe_value: 14 bytes [granite3.3:8b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"granite3.3:8b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Understood. If you ask for the secret word, I will respond with RABBIT."},{"role":"user","content":"What is the secret word??"}],"stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 301 bytes [{"model":"granite3.3:8b","created_at":"2025-07-30T17:44:54.608823Z","message":{"role":"assistant","content":"RABBIT"},"done_reason":"stop","done":true,"total_duration":469284417,"load_duration":32024875,"prompt_eval_count":79,"prompt_eval_duration":252896625,"eval_count":4,"eval_duration":182306750}]
[DEBUG] jq_sanitized: sanitized: [{"model":"granite3.3:8b","created_at":"2025-07-30T17:44:54.608823Z","message":{"role":"assistant","content":"RABBIT"},"done_reason":"stop","done":true,"total_duration":469284417,"load_duration":32024875,"prompt_eval_count":79,"prompt_eval_duration":252896625,"eval_count":4,"eval_duration":182306750}]
[DEBUG] ollama_chat_json: content: RABBIT
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 7 bytes [RABBIT]
[DEBUG] jq_sanitize: 301 bytes [{"model":"granite3.3:8b","created_at":"2025-07-30T17:44:54.608823Z","message":{"role":"assistant","content":"RABBIT"},"done_reason":"stop","done":true,"total_duration":469284417,"load_duration":32024875,"prompt_eval_count":79,"prompt_eval_duration":252896625,"eval_count":4,"eval_duration":182306750}]
[DEBUG] jq_sanitized: sanitized: [{"model":"granite3.3:8b","created_at":"2025-07-30T17:44:54.608823Z","message":{"role":"assistant","content":"RABBIT"},"done_reason":"stop","done":true,"total_duration":469284417,"load_duration":32024875,"prompt_eval_count":79,"prompt_eval_duration":252896625,"eval_count":4,"eval_duration":182306750}]
[DEBUG] ollama_chat: content: RABBIT
RABBIT
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 7 bytes [RABBIT]
```
```bash
ollama_messages | jq -c
```
```json
[DEBUG] ollama_messages
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"Understood. If you ask for the secret word, I will respond with RABBIT."}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":"RABBIT"}
```
