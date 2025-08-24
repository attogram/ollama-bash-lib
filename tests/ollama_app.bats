#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_app_installed: should return 0" {
  run ollama_app_installed
  [ "$status" -eq 0 ]
}

@test "ollama_app_turbo: should toggle turbo mode" {
  # I can't test the interactive prompt for the key, so I'll set it in the environment
  export OBL_TURBO_KEY="test_key"

  ollama_app_turbo -m on
  [ "$OBL_API" = "https://ollama.com" ]

  ollama_app_turbo -m off
  [ "$OBL_API" = "http://localhost:11434" ]
}

@test "ollama_app_vars: should return a list of variables" {
  run ollama_app_vars
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}
