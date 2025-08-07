# ollama_chat

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.42.23

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
Got it! If you ask for the secret word, I'll say "RABBIT".

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
  "content": "Got it! If you ask for the secret word, I'll say \"RABBIT\"."
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
[DEBUG] 00:55:03:450993700: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:55:03:473209600: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:55:03:504001100: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:55:03:521841400: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:55:03:555032100: ollama_chat_json: json_payload: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"}],"stream":false}
[DEBUG] 00:55:03:572016700: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:55:03:582107200: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:55:03:595400100: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:03:606144900: _call_curl: Turbo Mode
[DEBUG] 00:55:03:616141500: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:55:03:627416000: _call_curl: curl_args: -s -N -H Content-Type: application/json -H Authorization: Bearer 06ab07b80cdb4f2db7fe63336646c86f.O8ntAssNC-QUWdXK3urz4UDZ -X POST https://ollama.com/api/chat -d @-
[DEBUG] 00:55:04:754151300: ollama_api_post: success: return 0
[DEBUG] 00:55:04:788770300: ollama_chat_json: content: [Got it! If you ask for it, I'll reply with]
[DEBUG] 00:55:04:801435600: ollama_chat_json: return 0
[DEBUG] 00:55:04:832687000: ollama_chat: return: 0
Got it! If you ask for it, I'll reply with RABBIT.
[DEBUG] 00:55:04:844684400: ollama_messages_add: [assistant] [Got it! If you ask for it, I'll reply with]
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "gpt-oss:20b")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:55:04:867622500: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:55:04:897131600: ollama_chat: [gpt-oss:20b]
[DEBUG] 00:55:04:915297100: ollama_chat_json: [gpt-oss:20b]
[DEBUG] 00:55:04:952526800: ollama_chat_json: json_payload: {"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"},{"role":"assistant","content":"Got it! If you ask for it, I'll reply with RABBIT."},{"role":"user","content":"What is the secret word??"}],"stream":false}
[DEBUG] 00:55:04:967550900: ollama_api_post: [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:55:04:978807800: _call_curl: [POST] [/api/chat] [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:55:04:989955000: _call_curl: OLLAMA_LIB_API: https://ollama.com
[DEBUG] 00:55:05:001880900: _call_curl: Turbo Mode
[DEBUG] 00:55:05:012912900: _call_curl: json_body: [{"model":"gpt-oss:20b","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","content":"T]
[DEBUG] 00:55:05:024473400: _call_curl: curl_args: -s -N -H Content-Type: application/json -H Authorization: Bearer 06ab07b80cdb4f2db7fe63336646c86f.O8ntAssNC-QUWdXK3urz4UDZ -X POST https://ollama.com/api/chat -d @-
[DEBUG] 00:55:06:287036900: ollama_api_post: success: return 0
[DEBUG] 00:55:06:332775100: ollama_chat_json: content: [RABBIT]
[DEBUG] 00:55:06:342992600: ollama_chat_json: return 0
[DEBUG] 00:55:06:379609000: ollama_chat: return: 0
RABBIT
[DEBUG] 00:55:06:391581900: ollama_messages_add: [assistant] [RABBIT]
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:55:06:418779300: ollama_messages
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
  "content": "Got it! If you ask for it, I'll reply with RABBIT."
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
