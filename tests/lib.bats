#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_lib_about: success" {
    load_lib
    run ollama_lib_about
    [ "$status" -eq 0 ]
}

@test "ollama_lib_version: success" {
    load_lib
    run ollama_lib_version
    [ "$status" -eq 0 ]
    [ "$output" = "0.43.7" ]
}
