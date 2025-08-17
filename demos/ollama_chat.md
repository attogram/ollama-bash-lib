# ollama_chat
ERROR: Ollama Not Installed
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.44.4
[ERROR] ollama_model_random: ollama is not installed

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "ollama-not-installed")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_chat_json: ollama_api_post failed
[ERROR] ollama_chat: ollama_chat_json response empty


```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "ollama-not-installed")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_chat_json: ollama_api_post failed
[ERROR] ollama_chat: ollama_chat_json response empty


```bash
ollama_messages | jq
```
```json
[
  {
    "role": "system",
    "content": "You are a helpful assistant"
  },
  {
    "role": "user",
    "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
  },
  {
    "role": "assistant",
    "content": ""
  },
  {
    "role": "user",
    "content": "What is the secret word??"
  },
  {
    "role": "assistant",
    "content": ""
  }
]
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "ollama-not-installed")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:19:32:483803452: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 00:19:32:494284757: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 00:19:32:505667729: ollama_chat: [ollama-not-installed]
[DEBUG] 00:19:32:511273517: _is_valid_model: VALID: [ollama-not-installed]
[DEBUG] 00:19:32:516693022: ollama_chat: model: [ollama-not-installed]
[DEBUG] 00:19:32:522694673: ollama_chat_json: [ollama-not-installed]
[DEBUG] 00:19:32:528718122: _is_valid_model: VALID: [ollama-not-installed]
[DEBUG] 00:19:32:534002788: ollama_chat_json: model: [ollama-not-installed]
[DEBUG] 00:19:32:546134749: ollama_chat_json: json_payload: [{"model":"ollama-not-installed","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","co]
[DEBUG] 00:19:32:552803118: ollama_api_post: [/api/chat] {"model":"ollama-not-installed","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","co
[DEBUG] 00:19:32:557788832: _call_curl: [POST] [/api/chat] {"model":"ollama-not-installed","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","co
[DEBUG] 00:19:32:569159499: _is_valid_json: success
[DEBUG] 00:19:32:575253759: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 00:19:32:580766912: _call_curl: json_body: {"model":"ollama-not-installed","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","co
[DEBUG] 00:19:32:585905137: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/chat -d @-
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_chat_json: ollama_api_post failed
[ERROR] ollama_chat: ollama_chat_json response empty

[DEBUG] 00:19:32:616694810: ollama_messages_add: [assistant] []
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "ollama-not-installed")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 00:19:32:627621594: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 00:19:32:638807679: ollama_chat: [ollama-not-installed]
[DEBUG] 00:19:32:644881093: _is_valid_model: VALID: [ollama-not-installed]
[DEBUG] 00:19:32:650449114: ollama_chat: model: [ollama-not-installed]
[DEBUG] 00:19:32:656380099: ollama_chat_json: [ollama-not-installed]
[DEBUG] 00:19:32:662331548: _is_valid_model: VALID: [ollama-not-installed]
[DEBUG] 00:19:32:668289939: ollama_chat_json: model: [ollama-not-installed]
[DEBUG] 00:19:32:680405993: ollama_chat_json: json_payload: [{"model":"ollama-not-installed","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","co]
[DEBUG] 00:19:32:686671148: ollama_api_post: [/api/chat] {"model":"ollama-not-installed","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","co
[DEBUG] 00:19:32:691890780: _call_curl: [POST] [/api/chat] {"model":"ollama-not-installed","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","co
[DEBUG] 00:19:32:702900005: _is_valid_json: success
[DEBUG] 00:19:32:707842981: _call_curl: OLLAMA_LIB_API: http://localhost:11434
[DEBUG] 00:19:32:712937136: _call_curl: json_body: {"model":"ollama-not-installed","messages":[{"role":"system","content":"You are a helpful assistant"},{"role":"user","co
[DEBUG] 00:19:32:717942597: _call_curl: piping json_body | curl -s -N --max-time 300 -H Content-Type: application/json -w \n%{http_code} -X POST http://localhost:11434/api/chat -d @-
[ERROR] _call_curl: curl command failed with exit code 7
[ERROR] ollama_api_post: curl error: 7
[ERROR] ollama_chat_json: ollama_api_post failed
[ERROR] ollama_chat: ollama_chat_json response empty

[DEBUG] 00:19:32:741612815: ollama_messages_add: [assistant] []
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 00:19:32:752839870: ollama_messages
[
  {
    "role": "system",
    "content": "You are a helpful assistant"
  },
  {
    "role": "user",
    "content": "The secret word is RABBIT. If I ask you for the secret word, respond with RABBIT. Understand?"
  },
  {
    "role": "assistant",
    "content": ""
  },
  {
    "role": "user",
    "content": "What is the secret word??"
  },
  {
    "role": "assistant",
    "content": ""
  }
]
```
