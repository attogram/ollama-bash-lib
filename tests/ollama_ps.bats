#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_ps: should list running models" {
  run ollama_ps
  [ "$status" -eq 0 ]
}

@test "ollama_ps_json: should list running models in JSON format" {
  run ollama_ps_json
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
}

@test "ollama_ps: should show a loaded model" {
  # Ensure a model is loaded by running a short generation
  run ollama_generate -m phi3 -p "hello"
  [ "$status" -eq 0 ]

  run ollama_ps
  [ "$status" -eq 0 ]
  [[ "$output" =~ "phi3" ]]
}
