# ollama_chat
ERROR: Ollama Not Installed
[ERROR] ollama_api_get: curl error: 7
ERROR: Ollama API not reachable

A [demo](../README.md#demos) of [Ollama Bash Lib](https://github.com/attogram/ollama-bash-lib) v0.43.4
./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found

## Demo

```bash
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found
[ERROR] ollama_chat: No Models Found


```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
./../ollama_bash_lib.sh: line 607: ollama: command not found
[ERROR] ollama_model_random: No Models Found
[ERROR] ollama_chat: No Models Found


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
  "content": ""
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": ""
}
```

## Demo Debug

```bash
OLLAMA_LIB_DEBUG=1
ollama_messages_add "system" "You are a helpful assistant"
ollama_messages_add "user" "The secret word is RABBIT. If asked for the secret word, respond with RABBIT. Understand?"
response="$(ollama_chat "")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 20:11:33:092484152: ollama_messages_add: [system] [You are a helpful assistant]
[DEBUG] 20:11:33:103527490: ollama_messages_add: [user] [The secret word is RABBIT. If I ask you fo]
[DEBUG] 20:11:33:115829980: ollama_chat: []
[DEBUG] 20:11:33:121598666: _is_valid_model: Model name empty: getting random model
[DEBUG] 20:11:33:127845552: ollama_model_random
[DEBUG] 20:11:33:134582986: ollama_list_array
./../ollama_bash_lib.sh: line 607: ollama: command not found
[DEBUG] 20:11:33:147517186: ollama_list_array: 0 models found: return 0
[DEBUG] 20:11:33:153554267: ollama_model_random: 0 models found
[ERROR] ollama_model_random: No Models Found
[DEBUG] 20:11:33:160484395: _is_valid_model: Model Not Found: ollama_model_random failed
[DEBUG] 20:11:33:166800450: ollama_chat: model: []
[ERROR] ollama_chat: No Models Found

[DEBUG] 20:11:33:173603111: ollama_messages_add: [assistant] []
```

```bash
ollama_messages_add "user" "What is the secret word??"
response="$(ollama_chat "")"
printf '%s\n' "$response"
ollama_messages_add 'assistant' "$response"
```
```
[DEBUG] 20:11:33:184037575: ollama_messages_add: [user] [What is the secret word??]
[DEBUG] 20:11:33:195849969: ollama_chat: []
[DEBUG] 20:11:33:201499540: _is_valid_model: Model name empty: getting random model
[DEBUG] 20:11:33:207609735: ollama_model_random
[DEBUG] 20:11:33:213691186: ollama_list_array
./../ollama_bash_lib.sh: line 607: ollama: command not found
[DEBUG] 20:11:33:225498298: ollama_list_array: 0 models found: return 0
[DEBUG] 20:11:33:231290022: ollama_model_random: 0 models found
[ERROR] ollama_model_random: No Models Found
[DEBUG] 20:11:33:238054974: _is_valid_model: Model Not Found: ollama_model_random failed
[DEBUG] 20:11:33:243602049: ollama_chat: model: []
[ERROR] ollama_chat: No Models Found

[DEBUG] 20:11:33:250606183: ollama_messages_add: [assistant] []
```

```bash
ollama_messages | jq
```
```json
[DEBUG] 20:11:33:263237738: ollama_messages
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
  "content": ""
}
{
  "role": "user",
  "content": "What is the secret word??"
}
{
  "role": "assistant",
  "content": ""
}
```
