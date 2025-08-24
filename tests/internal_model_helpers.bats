#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "_ollama_generate_json_payload: should create a valid JSON payload" {
  run _ollama_generate_json_payload "phi3" "test prompt"
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
  [[ "$output" =~ "phi3" ]]
  [[ "$output" =~ "test prompt" ]]
}

@test "_is_valid_model: should return 0 for valid model names" {
  run _is_valid_model "phi3:latest"
  [ "$status" -eq 0 ]
  [ "$output" = "phi3:latest" ]
}

@test "_is_valid_model: should return 1 for invalid model names" {
  run _is_valid_model "invalid name with spaces"
  [ "$status" -eq 1 ]
  [ -z "$output" ]
}

@test "_is_valid_model: should return a random model when input is empty" {
  run _is_valid_model ""
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}
