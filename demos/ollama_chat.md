# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.0

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it.

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
RABBIT

```bash
ollama_messages | jq
```
```json
{
  "role": "system",
  "content": "You are a helpful assistant"
}
{
  "role": "user",
  "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
}
{
  "role": "assistant",
  "content": "Got it."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "RABBIT"
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 19:44:06:517434500: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 19:44:06:601754000: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 19:44:06:652928700: ollama_chat: [gpt-oss:20b]
[DEBUG] 19:44:06:686684000: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 19:44:06:712661300: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 19:44:06:745164800: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 19:44:06:774019800: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 19:44:06:798947100: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 19:44:06:841261600: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 19:44:06:871869100: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 19:44:06:896582400: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 19:44:06:919318200: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 19:44:06:942924600: _call_curl: Turbo Mode
[DEBUG] 19:44:06:966101600: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 19:44:08:465903800: ollama_api_post: success: return 0
[DEBUG] 19:44:08:530010800: _is_valid_json: VALID: return 0
[DEBUG] 19:44:08:595051200: ollama_chat_json: content: [I understand. The secret word is **RABBIT*]
[DEBUG] 19:44:08:616650500: ollama_chat_json: return 0
[DEBUG] 19:44:08:671575800: _is_valid_json: VALID: return 0
[DEBUG] 19:44:08:732917900: ollama_chat: return: 0
I understand. The secret word is **RABBIT**.
[DEBUG] 19:44:08:757554800: ollama_messages_add: [assistant] [I understand. The secret word is **RABBIT*]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 19:44:08:805538300: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 19:44:08:849909000: ollama_chat: [gpt-oss:20b]
[DEBUG] 19:44:08:881666500: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 19:44:08:904122900: ollama_chat: model: [gpt-oss:20b]
[DEBUG] 19:44:08:932422700: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 19:44:08:985174200: _is_valid_model: VALID: [gpt-oss:20b]
[DEBUG] 19:44:09:006903400: ollama_chat_json: model: [gpt-oss:20b]
[DEBUG] 19:44:09:053511700: ollama_chat_json: json_payload: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 19:44:09:083154100: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 19:44:09:120268600: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 19:44:09:143852500: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 19:44:09:166751000: _call_curl: Turbo Mode
[DEBUG] 19:44:09:189686300: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 19:44:10:193140100: ollama_api_post: success: return 0
[DEBUG] 19:44:10:269778000: _is_valid_json: VALID: return 0
[DEBUG] 19:44:10:329436700: ollama_chat_json: content: [RABBIT]
[DEBUG] 19:44:10:360791000: ollama_chat_json: return 0
[DEBUG] 19:44:10:400025100: _is_valid_json: VALID: return 0
[DEBUG] 19:44:10:445368600: ollama_chat: return: 0
RABBIT
[DEBUG] 19:44:10:469169600: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 19:44:10:517429600: ollama_messages
{
  "role": "system",
  "content": "You are a helpful assistant"
}
{
  "role": "user",
  "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
}
{
  "role": "assistant",
  "content": "I understand. The secret word is **RABBIT**."
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": "RABBIT"
}
```
