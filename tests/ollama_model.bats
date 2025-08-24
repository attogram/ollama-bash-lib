#!/usr/bin/env bats

source ./ollama_bash_lib.sh

@test "ollama_model_random: should return a random model" {
  run ollama_model_random
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "ollama_model_unload: should unload a model" {
  # First, ensure the model is loaded
  run ollama_show -m phi3
  [ "$status" -eq 0 ]

  # Unload the model
  run ollama_model_unload -m phi3
  [ "$status" -eq 0 ]

  sleep 2

  # To confirm it's unloaded, we can check `ollama ps`.
  # This is not a perfect test, but it's a good indicator.
  run ollama_ps
  [ "$status" -eq 0 ]
  [[ ! "$output" =~ "phi3" ]]

  # Load it again for other tests
  run ollama_show -m phi3
  [ "$status" -eq 0 ]
}
