#!/usr/bin/env bats

source ./ollama_bash_lib.sh
if [ -n "$OLLAMA_TEST_MODE" ]; then
  source ./tests/test_helper.bash
fi

setup() {
  if [[ "$OLLAMA_TEST_MODE" != "mock" ]]; then
    if ! ollama_app_installed; then
      skip "Ollama is not installed"
    fi
    if ! ollama_api_ping; then
      skip "Ollama API is not reachable"
    fi
  fi
}

@test "ollama_generate: should generate a response" {
  run ollama_generate -m "mock-model:latest" -p "why is the sky blue?"
  [ "$status" -eq 0 ]
  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    [[ "$output" == "This is a mock response." ]]
  else
    [ -n "$output" ]
  fi
}

@test "ollama_generate_json: should generate a response in JSON format" {
  OBL_STREAM=0
  run ollama_generate_json -m "mock-model:latest" -p "why is the sky blue?"
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
}

@test "ollama_generate_stream: should handle newlines correctly" {
  run ollama_generate_stream -m "mock-model:latest" -p "generate a list of three fruits, each on a new line."
  [ "$status" -eq 0 ]
  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    expected_output=$'Apple\nBanana\nCherry'
    echo "---Actual Output for test 3---"
    echo "$output" | cat -A
    echo "---Expected Output for test 3---"
    echo "$expected_output" | cat -A
    echo "--------------------------------"
    [[ "$output" == "$expected_output" ]]
  else
    [[ "$output" =~ .*\n.* ]]
  fi
}

@test "ollama_generate_stream: should generate a streaming response" {
  run ollama_generate_stream -m "mock-model:latest" -p "why is the sky blue?"
  [ "$status" -eq 0 ]
  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    echo "---Actual Output for test 4---"
    echo "$output" | cat -A
    echo "--------------------------------"
    [[ "$output" == "This is a mock streaming response." ]]
  else
    [ -n "$output" ]
  fi
}

@test "ollama_generate_stream_json: should generate a streaming response in JSON format" {
  run ollama_generate_stream_json -m "mock-model:latest" -p "why is the sky blue?"
  [ "$status" -eq 0 ]
  # In a stream, we get multiple JSON objects. We can check the first one.
  first_line=$(echo "$output" | head -n 1)
  _is_valid_json "$first_line"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
}
