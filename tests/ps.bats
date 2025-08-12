#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "ollama_ps: success" {
    load_lib
    run ollama_ps
    [ "$status" -eq 0 ]
    [ "${lines[0]}" = "ollama ps" ]
}

@test "ollama_ps_json: success" {
    load_lib
    run ollama_ps_json
    [ "$status" -eq 0 ]
}
