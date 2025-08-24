#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "_redact: should redact sensitive information" {
  OBL_TURBO_KEY="test_key"
  run _redact "this is a test with test_key"
  [ "$status" -eq 0 ]
  [[ "$output" == *"this is a test with [REDACTED]"* ]]
}

@test "_exists: should return 0 for existing commands" {
  run _exists "echo"
  [ "$status" -eq 0 ]
}

@test "_exists: should return 1 for non-existing commands" {
  run _exists "non_existent_command"
  [ "$status" -eq 1 ]
}

@test "_is_valid_url: should return 0 for valid URLs" {
  run _is_valid_url "http://localhost:11434"
  [ "$status" -eq 0 ]
  run _is_valid_url "https://example.com"
  [ "$status" -eq 0 ]
}

@test "_is_valid_url: should return 1 for invalid URLs" {
  run _is_valid_url "not a url"
  [ "$status" -eq 1 ]
  run _is_valid_url "http:://invalid"
  [ "$status" -eq 1 ]
}
