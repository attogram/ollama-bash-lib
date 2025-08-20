#!/usr/bin/env bash

# Test for streaming with thinking enabled

# shellcheck source=../ollama_bash_lib.sh
source "$(dirname "$0")/../ollama_bash_lib.sh"

echo '--- Testing ollama_generate_stream with thinking ON ---'
ollama_thinking on
ollama_generate_stream "$(ollama_model_random)" "Why is the sky blue? Be concise."

echo
echo '--- Testing ollama_chat_stream with thinking ON ---'
ollama_messages_clear
ollama_messages_add "user" "Why is the ocean blue? Be concise."
ollama_chat_stream "$(ollama_model_random)"
