#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_list: should return a list of models" {
  run ollama_list
  [ "$status" -eq 0 ]
}

@test "ollama_list_json: should return a JSON list of models" {
  run ollama_list_json
  [ "$status" -eq 0 ]
  run _is_valid_json "$output"
  [ "$status" -eq 0 ]
}

@test "ollama_list_array: should return a space-separated list of models" {
  run ollama_list_array
  [ "$status" -eq 0 ]
  # The output should not contain newlines, and should not be empty
  # if there are models. If there are no models, it will be empty.
  [[ ! "$output" =~ .*\n.* ]]
}
