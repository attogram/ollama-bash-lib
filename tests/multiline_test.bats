#!/usr/bin/env bats

@test "multiline string assertion" {
  multiline_string="hello
world"

  run echo "$multiline_string"

  [ "$status" -eq 0 ]
  [[ "$output" == "hello
world" ]]
}
