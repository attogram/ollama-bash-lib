#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_list: success" {
    load_lib
    run ollama_list
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "ollama list" ]
}

@test "ollama_list_json: success" {
    load_lib
    run ollama_list_json
    [ "$status" -eq 0 ]
}

@test "ollama_list_array: success" {
    load_lib
    run ollama_list_array
    [ "$status" -eq 0 ]
}
