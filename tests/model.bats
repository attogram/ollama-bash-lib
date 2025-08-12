#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "_is_valid_model: valid" {
    load_lib
    run _is_valid_model "model"
    [ "$status" -eq 0 ]
    [ "$output" = "model" ]
}

@test "_is_valid_model: invalid" {
    load_lib
    run _is_valid_model "invalid model"
    [ "$status" -eq 1 ]
    [ "$output" = "" ]
}

@test "_is_valid_model: empty" {
    load_lib
    run _is_valid_model ""
    [ "$status" -eq 1 ]
}

@test "ollama_model_random: success" {
    load_lib
    run ollama_model_random
    [ "$status" -eq 0 ]
}

@test "ollama_model_unload: no model" {
    load_lib
    run ollama_model_unload ""
    [ "$status" -eq 1 ]
}

@test "ollama_model_unload: success" {
    load_lib
    run ollama_model_unload "model"
    [ "$status" -eq 0 ]
}
