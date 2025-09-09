#!/usr/bin/env bats

source ./ollama_bash_lib.sh
source tests/test_helper.bash

setup() {
  if [[ "$OLLAMA_TEST_MODE" != "mock" ]]; then
    if ! ollama_app_installed; then
      skip "Ollama is not installed"
    fi
    if ! ollama_api_ping; then
      skip "Ollama API is not reachable"
    fi
  fi
}

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
  run _call_curl "GET" "/api/tags"
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    [[ "$output" == '{"models":[{"name":"mock-model:latest","modified_at":"2023-11-20T15:07:52.871123-08:00","size":123456789,"digest":"abcdef1234567890"}]}' ]]
  fi
}

@test "_call_curl: should make a successful POST request" {
  run _call_curl "POST" "/api/show" '{"model": "mock-model:latest"}'
  [ "$status" -eq 0 ]
  _is_valid_json "$output"
  local is_valid_json_status=$?
  [ "$is_valid_json_status" -eq 0 ]
  if [[ "$OLLAMA_TEST_MODE" == "mock" ]]; then
    [[ "$output" == '{"modelfile":"FROM mock-model:latest\n","parameters":"stop [INST]\nstop [/INST]\nstop <<SYS>>\nstop <</SYS>>\n","template":"[INST] {{ .Prompt }} [/INST] "}' ]]
  fi
}
