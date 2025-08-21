#!/usr/bin/env bash

echo '# ollama_tools with args demo'

startup() {
  ollama_bash_lib="$(dirname "$0")/../ollama_bash_lib.sh";
  if [ ! -f "$ollama_bash_lib" ]; then echo "ERROR: Ollama Bash Lib Not Found: $ollama_bash_lib"; exit 1; fi
  # shellcheck source=../ollama_bash_lib.sh
  source "$ollama_bash_lib"
  if ! ollama_app_installed; then echo 'ERROR: Ollama Not Installed'; fi;
  if ! ollama_api_ping; then echo 'ERROR: Ollama API not reachable'; fi
  echo; echo "A [demo](../README.md#demos) of [$OLLAMA_LIB_NAME]($OLLAMA_LIB_URL) v$OLLAMA_LIB_VERSION"
}

startup

# enter model as 1st arg, or use random model by default
model="$1"
if [ -z "$model" ]; then
  model="$(ollama_model_random)"
fi

search_tool_def='{
  "type": "function",
  "function": {
    "name": "search",
    "description": "Search for a query",
    "parameters": {
      "type": "object",
      "properties": {
        "query": { "type": "string" }
      },
      "required": ["query"]
    }
  }
}'

# Note: The command is a self-contained script snippet that parses args from $1
ollama_tools_add "search" 'query=$(echo "$1" | jq -r .query); echo "Searching for: $query"' "$search_tool_def"

demo() {
  echo '## Demo with search tool'
  echo
  echo 'Tools registered:'
  ollama_tools
  echo

  ollama_messages_add "user" "Search for 'ollama bash lib'"

  echo '--- User Prompt ---'
  ollama_messages | jq .
  echo '-------------------'

  response="$(ollama_chat_json "$model")"

  echo '--- Model Response (first pass) ---'
  echo "$response" | jq .
  echo '-----------------------------------'

  if ollama_tools_is_call "$response"; then
    echo 'Tool call detected. Running tools...'

    tool_calls_json="$(printf '%s' "$response" | jq -c '.message.tool_calls | .[]')"

    while IFS= read -r tool_call; do
        tool_name="$(printf '%s' "$tool_call" | jq -r '.function.name')"
        tool_args="$(printf '%s' "$tool_call" | jq -r '.function.arguments')"
        tool_call_id="$(printf '%s' "$tool_call" | jq -r '.id')"

        echo "Running tool: $tool_name with args: $tool_args"
        result="$(ollama_tools_run "$tool_name" "$tool_args")"

        echo "Tool result: $result"

        tool_response_json="$(jq -c -n --arg tool_call_id "$tool_call_id" --arg result "$result" '{tool_call_id: $tool_call_id, result: $result}')"

        ollama_messages_add "tool" "$tool_response_json"
    done <<< "$tool_calls_json"


    echo '--- Messages with Tool Results ---'
    ollama_messages | jq .
    echo '----------------------------------'

    # Call chat again with tool results
    final_response="$(ollama_chat_json "$model")"

    echo '--- Final Model Response ---'
    echo "$final_response" | jq .
    echo '----------------------------'
  else
    echo 'No tool call detected.'
  fi

  ollama_messages_clear
  ollama_tools_clear
}

demo
