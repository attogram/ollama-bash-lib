#!/usr/bin/env bats

source ./ollama_bash_lib.sh
source tests/test_helper.bash

@test "ollama_show: should show model information" {
  if [ "$OLLAMA_TEST_MODE" != "live" ]; then
    skip "CLI is only available in live mode"
  fi
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
