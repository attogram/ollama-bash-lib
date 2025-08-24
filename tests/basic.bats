#!/usr/bin/env bats

@test "hello world" {
  run echo "hello world"
  [ "$status" -eq 0 ]
  [ "$output" = "hello world" ]
}
