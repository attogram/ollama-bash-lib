# ollama_chat

A demo of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "qwen2.5vl:3b"
```
```
Understood.
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "qwen2.5vl:3b"
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
{"role":"assistant","content":"Understood."}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":"RABBIT"}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "qwen2.5vl:3b"
```
```
[DEBUG] ollama_messages_add: [system]
[DEBUG] json_safe_value: 7 bytes [system]
[DEBUG] json_safe_value: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 94 bytes [The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?]
[DEBUG] ollama_chat: [qwen2.5vl:3b]
[DEBUG] ollama_chat_json: [qwen2.5vl:3b]
[DEBUG] json_safe_value: 13 bytes [qwen2.5vl:3b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"qwen2.5vl:3b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 303 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T11:35:54.483307Z","message":{"role":"assistant","content":"Understood."},"done_reason":"stop","done":true,"total_duration":181181042,"load_duration":63843375,"prompt_eval_count":44,"prompt_eval_duration":34789542,"eval_count":4,"eval_duration":81626916}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T11:35:54.483307Z","message":{"role":"assistant","content":"Understood."},"done_reason":"stop","done":true,"total_duration":181181042,"load_duration":63843375,"prompt_eval_count":44,"prompt_eval_duration":34789542,"eval_count":4,"eval_duration":81626916}]
[DEBUG] ollama_chat_json: content: Understood.
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 12 bytes [Understood.]
[DEBUG] jq_sanitize: 303 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T11:35:54.483307Z","message":{"role":"assistant","content":"Understood."},"done_reason":"stop","done":true,"total_duration":181181042,"load_duration":63843375,"prompt_eval_count":44,"prompt_eval_duration":34789542,"eval_count":4,"eval_duration":81626916}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T11:35:54.483307Z","message":{"role":"assistant","content":"Understood."},"done_reason":"stop","done":true,"total_duration":181181042,"load_duration":63843375,"prompt_eval_count":44,"prompt_eval_duration":34789542,"eval_count":4,"eval_duration":81626916}]
[DEBUG] ollama_chat: content: Understood.
Understood.
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 12 bytes [Understood.]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "qwen2.5vl:3b"
```
```
[DEBUG] ollama_messages_add: [user]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [qwen2.5vl:3b]
[DEBUG] ollama_chat_json: [qwen2.5vl:3b]
[DEBUG] json_safe_value: 13 bytes [qwen2.5vl:3b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"qwen2.5vl:3b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Understood."},{"role":"user","content":"What is the secret word??"}],"stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 297 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T11:35:54.9309Z","message":{"role":"assistant","content":"RABBIT"},"done_reason":"stop","done":true,"total_duration":265375792,"load_duration":60745084,"prompt_eval_count":63,"prompt_eval_duration":112386209,"eval_count":4,"eval_duration":90037416}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T11:35:54.9309Z","message":{"role":"assistant","content":"RABBIT"},"done_reason":"stop","done":true,"total_duration":265375792,"load_duration":60745084,"prompt_eval_count":63,"prompt_eval_duration":112386209,"eval_count":4,"eval_duration":90037416}]
[DEBUG] ollama_chat_json: content: RABBIT
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 7 bytes [RABBIT]
[DEBUG] jq_sanitize: 297 bytes [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T11:35:54.9309Z","message":{"role":"assistant","content":"RABBIT"},"done_reason":"stop","done":true,"total_duration":265375792,"load_duration":60745084,"prompt_eval_count":63,"prompt_eval_duration":112386209,"eval_count":4,"eval_duration":90037416}]
[DEBUG] jq_sanitized: sanitized: [{"model":"qwen2.5vl:3b","created_at":"2025-07-30T11:35:54.9309Z","message":{"role":"assistant","content":"RABBIT"},"done_reason":"stop","done":true,"total_duration":265375792,"load_duration":60745084,"prompt_eval_count":63,"prompt_eval_duration":112386209,"eval_count":4,"eval_duration":90037416}]
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
{"role":"assistant","content":"Understood."}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":"RABBIT"}
```
