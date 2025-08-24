#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_generate: should generate a response" {
  run ollama_generate -m phi3 -p "why is the sky blue?"
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "ollama_generate_json: should generate a response in JSON format" {
  run ollama_generate_json -m phi3 -p "why is the sky blue?"
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
}

@test "ollama_generate_stream: should handle newlines correctly" {
  run ollama_generate_stream -m phi3 -p "generate a list of three fruits, each on a new line."
  [ "$status" -eq 0 ]
  [[ "$output" =~ .*\n.* ]]
}

@test "ollama_generate_stream: should generate a streaming response" {
  run ollama_generate_stream -m phi3 -p "why is the sky blue?"
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "ollama_generate_stream_json: should generate a streaming response in JSON format" {
  run ollama_generate_stream_json -m phi3 -p "why is the sky blue?"
  [ "$status" -eq 0 ]
  # In a stream, we get multiple JSON objects. We can check the first one.
  first_line=$(echo "$output" | head -n 1)
  _is_valid_json "$first_line"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
}
