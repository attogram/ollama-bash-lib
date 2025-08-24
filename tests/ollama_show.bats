#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_show: should show model information" {
  run ollama_show -m phi3
  [ "$status" -eq 0 ]
  [[ "$output" =~ "parameters" ]]
}

@test "ollama_show_json: should show model information in JSON format" {
  run ollama_show_json -m phi3
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
  [[ "$output" =~ "modelfile" ]]
}
