# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.39.1

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "codellama:7b"
```
```

Yes, I understand! When you ask me for the secret word, I will respond with "RABBIT".
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "codellama:7b"
```
```

I cannot reveal the secret word yet. It's too early to know what it is!
```
```bash
ollama_messages | jq -c
```
```json
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"\nYes, I understand! When you ask me for the secret word, I will respond with \"RABBIT\"."}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":"\nI cannot reveal the secret word yet. It's too early to know what it is!"}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
ollama_chat "codellama:7b"
```
```
[DEBUG] ollama_messages_add: [system]
[DEBUG] json_safe_value: 7 bytes [system]
[DEBUG] json_safe_value: 28 bytes [You are a helpful assistant]
[DEBUG] ollama_messages_add: [user]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 94 bytes [The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?]
[DEBUG] ollama_chat: [codellama:7b]
[DEBUG] ollama_chat_json: [codellama:7b]
[DEBUG] json_safe_value: 13 bytes [codellama:7b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"codellama:7b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 623 bytes [{"model":"codellama:7b","created_at":"2025-07-30T16:08:00.040445Z","message":{"role":"assistant","content":"
Yes, I understand! So if you say \"What's the secret word?\" and I respond with \"RABBIT,\" that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!"},"done_reason":"stop","done":true,"total_duration":4157434875,"load_duration":25567208,"prompt_eval_count":51,"prompt_eval_duration":51079959,"eval_count":85,"eval_duration":4079516416}]
[DEBUG] jq_sanitized: sanitized: [{"model":"codellama:7b","created_at":"2025-07-30T16:08:00.040445Z","message":{"role":"assistant","content":"
Yes, I understand! So if you say \"What's the secret word?\" and I respond with \"RABBIT,\" that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!"},"done_reason":"stop","done":true,"total_duration":4157434875,"load_duration":25567208,"prompt_eval_count":51,"prompt_eval_duration":51079959,"eval_count":85,"eval_duration":4079516416}]
[DEBUG] ollama_chat_json: content: 
Yes, I understand! So if you say "What's the secret word?" and I respond with "RABBIT," that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 323 bytes [
Yes, I understand! So if you say "What's the secret word?" and I respond with "RABBIT," that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!]
[DEBUG] jq_sanitize: 623 bytes [{"model":"codellama:7b","created_at":"2025-07-30T16:08:00.040445Z","message":{"role":"assistant","content":"
Yes, I understand! So if you say \"What's the secret word?\" and I respond with \"RABBIT,\" that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!"},"done_reason":"stop","done":true,"total_duration":4157434875,"load_duration":25567208,"prompt_eval_count":51,"prompt_eval_duration":51079959,"eval_count":85,"eval_duration":4079516416}]
[DEBUG] jq_sanitized: sanitized: [{"model":"codellama:7b","created_at":"2025-07-30T16:08:00.040445Z","message":{"role":"assistant","content":"
Yes, I understand! So if you say \"What's the secret word?\" and I respond with \"RABBIT,\" that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!"},"done_reason":"stop","done":true,"total_duration":4157434875,"load_duration":25567208,"prompt_eval_count":51,"prompt_eval_duration":51079959,"eval_count":85,"eval_duration":4079516416}]
[DEBUG] ollama_chat: content: 
Yes, I understand! So if you say "What's the secret word?" and I respond with "RABBIT," that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!

Yes, I understand! So if you say "What's the secret word?" and I respond with "RABBIT," that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 323 bytes [
Yes, I understand! So if you say "What's the secret word?" and I respond with "RABBIT," that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!]
```
```bash
ollama_messages_add "user" "What is the secret word??"
ollama_chat "codellama:7b"
```
```
[DEBUG] ollama_messages_add: [user]
[DEBUG] json_safe_value: 5 bytes [user]
[DEBUG] json_safe_value: 26 bytes [What is the secret word??]
[DEBUG] ollama_chat: [codellama:7b]
[DEBUG] ollama_chat_json: [codellama:7b]
[DEBUG] json_safe_value: 13 bytes [codellama:7b]
[DEBUG] ollama_api_post: [/api/chat] [{"model":"codellama:7b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"
Yes, I understand! So if you say \"What's the secret word?\" and I respond with \"RABBIT,\" that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!"},{"role":"user","content":"What is the secret word??"}],"stream":false}]
[DEBUG] ollama_api_post: return 0
[DEBUG] jq_sanitize: 304 bytes [{"model":"codellama:7b","created_at":"2025-07-30T16:08:00.669207Z","message":{"role":"assistant","content":"
RABBIT!"},"done_reason":"stop","done":true,"total_duration":445910417,"load_duration":19427417,"prompt_eval_count":159,"prompt_eval_duration":188032166,"eval_count":6,"eval_duration":236861250}]
[DEBUG] jq_sanitized: sanitized: [{"model":"codellama:7b","created_at":"2025-07-30T16:08:00.669207Z","message":{"role":"assistant","content":"
RABBIT!"},"done_reason":"stop","done":true,"total_duration":445910417,"load_duration":19427417,"prompt_eval_count":159,"prompt_eval_duration":188032166,"eval_count":6,"eval_duration":236861250}]
[DEBUG] ollama_chat_json: content: 
RABBIT!
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 9 bytes [
RABBIT!]
[DEBUG] jq_sanitize: 304 bytes [{"model":"codellama:7b","created_at":"2025-07-30T16:08:00.669207Z","message":{"role":"assistant","content":"
RABBIT!"},"done_reason":"stop","done":true,"total_duration":445910417,"load_duration":19427417,"prompt_eval_count":159,"prompt_eval_duration":188032166,"eval_count":6,"eval_duration":236861250}]
[DEBUG] jq_sanitized: sanitized: [{"model":"codellama:7b","created_at":"2025-07-30T16:08:00.669207Z","message":{"role":"assistant","content":"
RABBIT!"},"done_reason":"stop","done":true,"total_duration":445910417,"load_duration":19427417,"prompt_eval_count":159,"prompt_eval_duration":188032166,"eval_count":6,"eval_duration":236861250}]
[DEBUG] ollama_chat: content: 
RABBIT!

RABBIT!
[DEBUG] ollama_messages_add: [assistant]
[DEBUG] json_safe_value: 10 bytes [assistant]
[DEBUG] json_safe_value: 9 bytes [
RABBIT!]
```
```bash
ollama_messages | jq -c
```
```json
[DEBUG] ollama_messages
{"role":"system","content":"You are a helpful assistant"}
{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}
{"role":"assistant","content":"\nYes, I understand! So if you say \"What's the secret word?\" and I respond with \"RABBIT,\" that means I know what the secret word is and I can reveal it to you. But if you ask me for a hint or a description of the secret word without me knowing the answer first, I won't be able to give you any information about it. Got it!"}
{"role":"user","content":"What is the secret word??"}
{"role":"assistant","content":"\nRABBIT!"}
```
