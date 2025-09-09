#!/usr/bin/env bats

source ./ollama_bash_lib.sh
if [ -n "$OLLAMA_TEST_MODE" ]; then
  source ./tests/test_helper.bash
fi

setup() {
  ollama_messages_clear
}

@test "ollama_messages: should manage message history" {
  ollama_messages_add -r "user" -c "hello"

  run ollama_messages_count
  [ "$status" -eq 0 ]
  [ "$output" -eq 1 ]

  run ollama_messages_last_json
  [ "$status" -eq 0 ]
  [[ $(echo "$output" | jq -r '.content') == "hello" ]]

  ollama_messages_clear

  run ollama_messages_count
  [ "$status" -eq 0 ]
  [ "$output" -eq 0 ]
}

@test "ollama_chat: should have a conversation" {
  ollama_messages_add -r "user" -c "what is 1+1?"

  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    run ollama_chat -m "mock-model:latest"
    [ "$status" -eq 0 ]
    [[ "$output" == "This is a mock chat response." ]]
  else
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
  fi
}

@test "ollama_chat_json: should have a conversation (non-streaming)" {
  ollama_messages_add -r "user" -c "what is 1+1?"
  OBL_STREAM=0 # ensure we get a single json response back

  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    # This function modifies history but doesn't print to stdout
    ollama_chat_json -m "mock-model:latest"
    local status=$?
    [ "$status" -eq 0 ]

    # Check that history was modified correctly
    run ollama_messages_count
    [ "$output" -eq 2 ]

    run ollama_messages_last_json
    [ "$status" -eq 0 ]
    _is_valid_json "$output"
    [ $? -eq 0 ]
    [[ $(echo "$output" | jq -r '.content') == "This is a mock chat response." ]]
  else
    ollama_chat_json -m phi3
    local chat_json_status=$?
    [ "$chat_json_status" -eq 0 ]
  fi
}


@test "ollama_chat_stream: should have a streaming conversation" {
  ollama_messages_add -r "user" -c "what is 1+1?"
  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    run ollama_chat_stream -m "mock-model:latest"
    [ "$status" -eq 0 ]
    [[ "$output" == "This is a mock streaming chat response." ]]
  else
    run ollama_chat_stream -m phi3
    [ "$status" -eq 0 ]
    [ -n "$output" ]
    [[ "$output" =~ "2" ]]
  fi
}

@test "ollama_chat_stream_json: should have a streaming conversation and return json" {
  ollama_messages_add -r "user" -c "what is 1+1?"
  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    run ollama_chat_stream_json -m "mock-model:latest"
    [ "$status" -eq 0 ]
    [ -n "$output" ]
    first_line=$(echo "$output" | head -n 1)
    _is_valid_json "$first_line"
    local is_valid_json_status=$?
    [ "$is_valid_json_status" -eq 0 ]
    [[ $(echo "$first_line" | jq -r '.message.content') == "This is a mock streaming chat response." ]]
  else
    run ollama_chat_stream_json -m phi3
    [ "$status" -eq 0 ]
    [ -n "$output" ]
    first_line=$(echo "$output" | head -n 1)
    _is_valid_json "$first_line"
    local is_valid_json_status=$?
    [ "$is_valid_json_status" -eq 0 ]
  fi
}

@test "ollama_chat_stream: should handle newlines correctly" {
  ollama_messages_add -r "user" -c "generate a list of three fruits, each on a new line."
  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    run ollama_chat_stream -m "mock-model:latest"
    [ "$status" -eq 0 ]
    expected_output=$'Apple\nBanana\nCherry'
    echo "---Actual Output---"
    echo "$output" | cat -A
    echo "---Expected Output---"
    echo "$expected_output" | cat -A
    echo "-------------------"
    [[ "$output" == "$expected_output" ]]
  else
    run ollama_chat_stream -m phi3
    [ "$status" -eq 0 ]
    [[ "$output" =~ .*\n.* ]]
  fi
}
