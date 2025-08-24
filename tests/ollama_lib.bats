#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_lib_version: should return the library version" {
  run ollama_lib_version
  [ "$status" -eq 0 ]
  [[ "$output" =~ [0-9]+\.[0-9]+\.[0-9]+ ]]
}

@test "ollama_lib_about: should return about information" {
  run ollama_lib_about
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "ollama_thinking: should toggle thinking mode" {
  ollama_thinking on
  [ "$OBL_THINKING" = "on" ]

  ollama_thinking off
  [ "$OBL_THINKING" = "off" ]

  ollama_thinking hide
  [ "$OBL_THINKING" = "hide" ]
}
