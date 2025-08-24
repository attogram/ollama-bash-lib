#!/usr/bin/env bats

source ./ollama_bash_lib.sh

setup() {
  ollama_messages_clear
}

@test "ollama_messages: should manage message history" {
  ollama_messages_add -r "user" -c "hello"

  run ollama_messages_count
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]

  run ollama_messages_last
  [ "$status" -eq 0 ]
  [[ "$output" =~ "hello" ]]

  ollama_messages_clear

  run ollama_messages_count
  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "ollama_chat: should have a conversation" {
  ollama_messages_add -r "user" -c "what is 1+1?"

  local tmp_file
  tmp_file=$(mktemp)
  ollama_chat -m phi3 > "$tmp_file"
  local chat_status=$?
  local chat_output
  chat_output=$(cat "$tmp_file")
  rm "$tmp_file"

  [ "$chat_status" -eq 0 ]
  [ -n "$chat_output" ]
  [[ "$chat_output" =~ "2" ]]

  run ollama_messages_count
  [ "$status" -eq 0 ]
  [ "$output" -eq 2 ] # user message + assistant response
}

@test "ollama_chat_json: should have a conversation and return json" {
  ollama_messages_add -r "user" -c "what is 1+1?"
  OBL_STREAM=0 # ensure we get a single json response back

  ollama_chat_json -m phi3
  local chat_json_status=$?
  [ "$chat_json_status" -eq 0 ]

  run ollama_messages_last
  [ "$status" -eq 0 ]
  [[ "$output" =~ "2" ]]
}

@test "ollama_chat_stream: should have a streaming conversation" {
  ollama_messages_add -r "user" -c "what is 1+1?"
  run ollama_chat_stream -m phi3
  [ "$status" -eq 0 ]
  [ -n "$output" ]
  [[ "$output" =~ "2" ]]
}

@test "ollama_chat_stream_json: should have a streaming conversation and return json" {
  ollama_messages_add -r "user" -c "what is 1+1?"
  run ollama_chat_stream_json -m phi3
  [ "$status" -eq 0 ]
  [ -n "$output" ]
  first_line=$(echo "$output" | head -n 1)
  _is_valid_json "$first_line"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
}

@test "ollama_chat_stream: should handle newlines correctly" {
  ollama_messages_add -r "user" -c "generate a list of three fruits, each on a new line."
  run ollama_chat_stream -m phi3
  [ "$status" -eq 0 ]
  [[ "$output" =~ .*\n.* ]]
}
