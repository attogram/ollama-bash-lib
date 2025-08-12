#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_eval: no task" {
    load_lib
    run ollama_eval ""
    [ "$status" -eq 1 ]
}

@test "ollama_eval: success" {
    load_lib
    run ollama_eval "task" "model"
    [ "$status" -eq 0 ]
}
