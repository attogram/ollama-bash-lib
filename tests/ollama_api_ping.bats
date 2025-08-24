#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_api_ping: should succeed when the API is running" {
  run ollama_api_ping
  [ "$status" -eq 0 ]
}
