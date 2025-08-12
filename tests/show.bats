#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_show: success" {
    load_lib
    run ollama_show "model"
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "ollama show model" ]
}

@test "ollama_show_json: success" {
    load_lib
    run ollama_show_json "model"
    [ "$status" -eq 0 ]
}
