#!/usr/bin/env bash

echo '# Test for streaming with thinking enabled'

# shellcheck source=../ollama_bash_lib.sh
source "$(dirname "$0")/../ollama_bash_lib.sh"

echo
echo '## Turn on thinking'
# shellcheck disable=SC2016
echo '
```
ollama_thinking on
ollama_thinking
```
'
ollama_thinking on
ollama_thinking

echo
echo '## ollama_generate_stream'
# shellcheck disable=SC2016
echo '
```
ollama_generate_stream -m "$(ollama_model_random)" -p "Why is the sky blue? Be concise."
```
'
ollama_generate_stream -m "$(ollama_model_random)" -p "Why is the sky blue? Be concise."

echo
echo '## ollama_chat_stream'
# shellcheck disable=SC2016
echo '
```
ollama_messages_clear
ollama_messages_add -r "user" -c "Why is the ocean blue? Be concise."
ollama_chat_stream -m "$(ollama_model_random)"
```
'
ollama_messages_clear
ollama_messages_add -r "user" -c "Why is the ocean blue? Be concise."
ollama_chat_stream -m "$(ollama_model_random)"

