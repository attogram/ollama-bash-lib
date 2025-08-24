#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_app_version: should return the version string" {
  run ollama_app_version
  [ "$status" -eq 0 ]
  [[ "$output" =~ [0-9]+\.[0-9]+\.[0-9]+ ]]
}

@test "ollama_app_version_json: should return the version as JSON" {
  run ollama_app_version_json
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
  [[ "$output" =~ "version" ]]
}

@test "ollama_app_version_cli: should return the version from the CLI" {
  run ollama_app_version_cli
  [ "$status" -eq 0 ]
  [[ "$output" =~ "ollama version is" ]]
}
