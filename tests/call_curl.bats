#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "_call_curl: should return error for invalid method" {
  run _call_curl "INVALID_METHOD" "/api/tags"
  [ "$status" -ne 0 ]
}

@test "_call_curl: should return error for invalid API path" {
  run _call_curl "GET" "invalid path"
  [ "$status" -ne 0 ]
}

@test "_call_curl: should return error for invalid JSON body" {
  run _call_curl "POST" "/api/generate" '{"invalid json'
  [ "$status" -ne 0 ]
}

@test "_call_curl: should make a successful GET request" {
  # This will make a real request to the running Ollama instance
  run _call_curl "GET" "/api/tags"
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
}

@test "_call_curl: should make a successful POST request" {
  # This will make a real request to the running Ollama instance
  run _call_curl "POST" "/api/show" '{"model": "phi3"}'
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
}
