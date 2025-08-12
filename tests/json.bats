#!/usr/bin/env bats

load_lib() {
    load '../ollama_bash_lib.sh'
}

setup() {
    export PATH="tests/mocks:$PATH"
}

@test "_is_valid_json: valid" {
    load_lib
    run _is_valid_json '{"key":"value"}'
    [ "$status" -eq 0 ]
}

@test "_is_valid_json: invalid" {
    load_lib
    run _is_valid_json '{"key":}'
    [ "$status" -eq 1 ]
}

@test "_is_valid_json: empty" {
    load_lib
    run _is_valid_json ''
    [ "$status" -eq 1 ]
}
