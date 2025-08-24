#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "_is_valid_json: should return 0 for valid and truthy JSON" {
  run _is_valid_json '{"key": "value"}'
  [ "$status" -eq 0 ]
  run _is_valid_json '{"key": 0}'
  [ "$status" -eq 0 ]
  run _is_valid_json '{"key": true}'
  [ "$status" -eq 0 ]
}

@test "_is_valid_json: should return 1 for invalid JSON syntax" {
  run _is_valid_json '{"key": "value"'
  [ "$status" -ne 0 ]
}

@test "_is_valid_json: should return 1 for an empty string" {
  run _is_valid_json ""
  [ "$status" -ne 0 ]
}

@test "_is_valid_json: should return 1 for 'null' as the top-level value" {
  run _is_valid_json 'null'
  [ "$status" -eq 1 ]
}

@test "_is_valid_json: should return 1 for 'false' as the top-level value" {
  run _is_valid_json 'false'
  [ "$status" -eq 1 ]
}

@test "_is_valid_json: should return 0 for JSON containing 'null' but not as the top-level value" {
  run _is_valid_json '{"key": null}'
  [ "$status" -eq 0 ]
}

@test "_is_valid_json: should return 0 for JSON containing 'false' but not as the top-level value" {
  run _is_valid_json '{"key": false}'
  [ "$status" -eq 0 ]
}
